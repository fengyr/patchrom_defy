.class final enum Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;
.super Ljava/lang/Enum;
.source "MotoWrigley3GRIL.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/telephony/MotoWrigley3GRIL;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "DataCallRecoveryState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;

.field public static final enum ACTIVE:Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;

.field public static final enum DONE:Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;

.field public static final enum IDLE:Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 71
    new-instance v0, Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;

    const-string v1, "IDLE"

    invoke-direct {v0, v1, v2}, Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;->IDLE:Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;

    .line 72
    new-instance v0, Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;

    const-string v1, "ACTIVE"

    invoke-direct {v0, v1, v3}, Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;->ACTIVE:Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;

    .line 73
    new-instance v0, Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;

    const-string v1, "DONE"

    invoke-direct {v0, v1, v4}, Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;->DONE:Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;

    .line 70
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;

    sget-object v1, Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;->IDLE:Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;

    aput-object v1, v0, v2

    sget-object v1, Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;->ACTIVE:Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;

    aput-object v1, v0, v3

    sget-object v1, Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;->DONE:Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;

    aput-object v1, v0, v4

    sput-object v0, Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;->$VALUES:[Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 70
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;
    .locals 1
    .parameter "name"

    .prologue
    .line 70
    const-class v0, Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;

    return-object v0
.end method

.method public static values()[Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;
    .locals 1

    .prologue
    .line 70
    sget-object v0, Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;->$VALUES:[Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;

    invoke-virtual {v0}, [Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;

    return-object v0
.end method
