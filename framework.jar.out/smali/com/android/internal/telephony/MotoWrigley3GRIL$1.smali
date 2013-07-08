.class Lcom/android/internal/telephony/MotoWrigley3GRIL$1;
.super Landroid/os/Handler;
.source "MotoWrigley3GRIL.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/telephony/MotoWrigley3GRIL;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/telephony/MotoWrigley3GRIL;


# direct methods
.method constructor <init>(Lcom/android/internal/telephony/MotoWrigley3GRIL;)V
    .locals 0
    .parameter

    .prologue
    .line 51
    iput-object p1, p0, Lcom/android/internal/telephony/MotoWrigley3GRIL$1;->this$0:Lcom/android/internal/telephony/MotoWrigley3GRIL;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .parameter "msg"

    .prologue
    .line 54
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 67
    :goto_0
    return-void

    .line 56
    :pswitch_0
    const-string v0, "MotoWrigley3GRIL"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SETUP_DATA_CALL recovery: powered down radio, should be on = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/telephony/MotoWrigley3GRIL$1;->this$0:Lcom/android/internal/telephony/MotoWrigley3GRIL;

    #getter for: Lcom/android/internal/telephony/MotoWrigley3GRIL;->mRadioShouldBeOn:Ljava/lang/Boolean;
    invoke-static {v2}, Lcom/android/internal/telephony/MotoWrigley3GRIL;->access$000(Lcom/android/internal/telephony/MotoWrigley3GRIL;)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    iget-object v0, p0, Lcom/android/internal/telephony/MotoWrigley3GRIL$1;->this$0:Lcom/android/internal/telephony/MotoWrigley3GRIL;

    #getter for: Lcom/android/internal/telephony/MotoWrigley3GRIL;->mRadioShouldBeOn:Ljava/lang/Boolean;
    invoke-static {v0}, Lcom/android/internal/telephony/MotoWrigley3GRIL;->access$000(Lcom/android/internal/telephony/MotoWrigley3GRIL;)Ljava/lang/Boolean;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/telephony/MotoWrigley3GRIL$1;->this$0:Lcom/android/internal/telephony/MotoWrigley3GRIL;

    #getter for: Lcom/android/internal/telephony/MotoWrigley3GRIL;->mRadioShouldBeOn:Ljava/lang/Boolean;
    invoke-static {v0}, Lcom/android/internal/telephony/MotoWrigley3GRIL;->access$000(Lcom/android/internal/telephony/MotoWrigley3GRIL;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 58
    iget-object v0, p0, Lcom/android/internal/telephony/MotoWrigley3GRIL$1;->this$0:Lcom/android/internal/telephony/MotoWrigley3GRIL;

    const/4 v1, 0x1

    const/4 v2, 0x2

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/MotoWrigley3GRIL$1;->obtainMessage(I)Landroid/os/Message;

    move-result-object v2

    #calls: Lcom/android/internal/telephony/RIL;->setRadioPower(ZLandroid/os/Message;)V
    invoke-static {v0, v1, v2}, Lcom/android/internal/telephony/MotoWrigley3GRIL;->access$101(Lcom/android/internal/telephony/MotoWrigley3GRIL;ZLandroid/os/Message;)V

    goto :goto_0

    .line 63
    :cond_0
    :pswitch_1
    const-string v0, "MotoWrigley3GRIL"

    const-string v1, "SETUP_DATA_CALL recovery: powered up radio"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    iget-object v0, p0, Lcom/android/internal/telephony/MotoWrigley3GRIL$1;->this$0:Lcom/android/internal/telephony/MotoWrigley3GRIL;

    sget-object v1, Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;->DONE:Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;

    #setter for: Lcom/android/internal/telephony/MotoWrigley3GRIL;->mRecoveryState:Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;
    invoke-static {v0, v1}, Lcom/android/internal/telephony/MotoWrigley3GRIL;->access$202(Lcom/android/internal/telephony/MotoWrigley3GRIL;Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;)Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;

    goto :goto_0

    .line 54
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
