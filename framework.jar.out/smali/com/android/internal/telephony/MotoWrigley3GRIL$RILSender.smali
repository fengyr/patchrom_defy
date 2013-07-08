.class Lcom/android/internal/telephony/MotoWrigley3GRIL$RILSender;
.super Lcom/android/internal/telephony/RIL$RILSender;
.source "MotoWrigley3GRIL.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/telephony/MotoWrigley3GRIL;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "RILSender"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/telephony/MotoWrigley3GRIL;


# direct methods
.method public constructor <init>(Lcom/android/internal/telephony/MotoWrigley3GRIL;Landroid/os/Looper;)V
    .locals 0
    .parameter
    .parameter "looper"

    .prologue
    .line 275
    iput-object p1, p0, Lcom/android/internal/telephony/MotoWrigley3GRIL$RILSender;->this$0:Lcom/android/internal/telephony/MotoWrigley3GRIL;

    .line 276
    invoke-direct {p0, p1, p2}, Lcom/android/internal/telephony/RIL$RILSender;-><init>(Lcom/android/internal/telephony/RIL;Landroid/os/Looper;)V

    .line 277
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4
    .parameter "msg"

    .prologue
    const/4 v3, 0x0

    .line 282
    invoke-super {p0, p1}, Lcom/android/internal/telephony/RIL$RILSender;->handleMessage(Landroid/os/Message;)V

    .line 284
    iget v1, p1, Landroid/os/Message;->what:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_1

    iget-object v1, p0, Lcom/android/internal/telephony/MotoWrigley3GRIL$RILSender;->this$0:Lcom/android/internal/telephony/MotoWrigley3GRIL;

    #getter for: Lcom/android/internal/telephony/MotoWrigley3GRIL;->mSetupDataCallRequest:Lcom/android/internal/telephony/RILRequest;
    invoke-static {v1}, Lcom/android/internal/telephony/MotoWrigley3GRIL;->access$300(Lcom/android/internal/telephony/MotoWrigley3GRIL;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 285
    iget-object v1, p0, Lcom/android/internal/telephony/MotoWrigley3GRIL$RILSender;->this$0:Lcom/android/internal/telephony/MotoWrigley3GRIL;

    iget-object v2, p0, Lcom/android/internal/telephony/MotoWrigley3GRIL$RILSender;->this$0:Lcom/android/internal/telephony/MotoWrigley3GRIL;

    #getter for: Lcom/android/internal/telephony/MotoWrigley3GRIL;->mSetupDataCallRequest:Lcom/android/internal/telephony/RILRequest;
    invoke-static {v2}, Lcom/android/internal/telephony/MotoWrigley3GRIL;->access$300(Lcom/android/internal/telephony/MotoWrigley3GRIL;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v2

    iget v2, v2, Lcom/android/internal/telephony/RILRequest;->mSerial:I

    #calls: Lcom/android/internal/telephony/RIL;->findAndRemoveRequestFromList(I)Lcom/android/internal/telephony/RILRequest;
    invoke-static {v1, v2}, Lcom/android/internal/telephony/MotoWrigley3GRIL;->access$401(Lcom/android/internal/telephony/MotoWrigley3GRIL;I)Lcom/android/internal/telephony/RILRequest;

    .line 286
    iget-object v1, p0, Lcom/android/internal/telephony/MotoWrigley3GRIL$RILSender;->this$0:Lcom/android/internal/telephony/MotoWrigley3GRIL;

    #getter for: Lcom/android/internal/telephony/MotoWrigley3GRIL;->mSetupDataCallRequest:Lcom/android/internal/telephony/RILRequest;
    invoke-static {v1}, Lcom/android/internal/telephony/MotoWrigley3GRIL;->access$300(Lcom/android/internal/telephony/MotoWrigley3GRIL;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v1

    iget-object v1, v1, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    if-eqz v1, :cond_0

    .line 287
    const-string v1, "MotoWrigley3GRIL"

    const-string v2, "Got stale SETUP_DATA_CALL request, pretending radio not available"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 288
    new-instance v0, Lcom/android/internal/telephony/CommandException;

    sget-object v1, Lcom/android/internal/telephony/CommandException$Error;->RADIO_NOT_AVAILABLE:Lcom/android/internal/telephony/CommandException$Error;

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/CommandException;-><init>(Lcom/android/internal/telephony/CommandException$Error;)V

    .line 289
    .local v0, ex:Lcom/android/internal/telephony/CommandException;
    iget-object v1, p0, Lcom/android/internal/telephony/MotoWrigley3GRIL$RILSender;->this$0:Lcom/android/internal/telephony/MotoWrigley3GRIL;

    #getter for: Lcom/android/internal/telephony/MotoWrigley3GRIL;->mSetupDataCallRequest:Lcom/android/internal/telephony/RILRequest;
    invoke-static {v1}, Lcom/android/internal/telephony/MotoWrigley3GRIL;->access$300(Lcom/android/internal/telephony/MotoWrigley3GRIL;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v1

    iget-object v1, v1, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    invoke-static {v1, v3, v0}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 290
    iget-object v1, p0, Lcom/android/internal/telephony/MotoWrigley3GRIL$RILSender;->this$0:Lcom/android/internal/telephony/MotoWrigley3GRIL;

    #getter for: Lcom/android/internal/telephony/MotoWrigley3GRIL;->mSetupDataCallRequest:Lcom/android/internal/telephony/RILRequest;
    invoke-static {v1}, Lcom/android/internal/telephony/MotoWrigley3GRIL;->access$300(Lcom/android/internal/telephony/MotoWrigley3GRIL;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v1

    iget-object v1, v1, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    invoke-virtual {v1}, Landroid/os/Message;->sendToTarget()V

    .line 292
    .end local v0           #ex:Lcom/android/internal/telephony/CommandException;
    :cond_0
    iget-object v1, p0, Lcom/android/internal/telephony/MotoWrigley3GRIL$RILSender;->this$0:Lcom/android/internal/telephony/MotoWrigley3GRIL;

    #getter for: Lcom/android/internal/telephony/MotoWrigley3GRIL;->mSetupDataCallRequest:Lcom/android/internal/telephony/RILRequest;
    invoke-static {v1}, Lcom/android/internal/telephony/MotoWrigley3GRIL;->access$300(Lcom/android/internal/telephony/MotoWrigley3GRIL;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/internal/telephony/RILRequest;->release()V

    .line 293
    iget-object v1, p0, Lcom/android/internal/telephony/MotoWrigley3GRIL$RILSender;->this$0:Lcom/android/internal/telephony/MotoWrigley3GRIL;

    #setter for: Lcom/android/internal/telephony/MotoWrigley3GRIL;->mSetupDataCallRequest:Lcom/android/internal/telephony/RILRequest;
    invoke-static {v1, v3}, Lcom/android/internal/telephony/MotoWrigley3GRIL;->access$302(Lcom/android/internal/telephony/MotoWrigley3GRIL;Lcom/android/internal/telephony/RILRequest;)Lcom/android/internal/telephony/RILRequest;

    .line 295
    :cond_1
    return-void
.end method
