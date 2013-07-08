.class public Lcom/android/internal/telephony/MotoWrigley3GRIL;
.super Lcom/android/internal/telephony/RIL;
.source "MotoWrigley3GRIL.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/telephony/MotoWrigley3GRIL$RILSender;,
        Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;
    }
.end annotation


# static fields
.field private static final MSG_RECOVERY_POWERDOWN:I = 0x1

.field private static final MSG_RECOVERY_POWERUP:I = 0x2

.field private static final TAG:Ljava/lang/String; = "MotoWrigley3GRIL"


# instance fields
.field private mDataConnectionCount:I

.field private mHandler:Landroid/os/Handler;

.field private mRadioShouldBeOn:Ljava/lang/Boolean;

.field private mRecoveryState:Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;

.field private mSetupDataCallRequest:Lcom/android/internal/telephony/RILRequest;


# direct methods
.method public constructor <init>(Landroid/content/Context;II)V
    .locals 2
    .parameter "context"
    .parameter "networkMode"
    .parameter "cdmaSubscription"

    .prologue
    .line 82
    invoke-direct {p0, p1, p2, p3}, Lcom/android/internal/telephony/RIL;-><init>(Landroid/content/Context;II)V

    .line 46
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/internal/telephony/MotoWrigley3GRIL;->mDataConnectionCount:I

    .line 49
    sget-object v0, Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;->IDLE:Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;

    iput-object v0, p0, Lcom/android/internal/telephony/MotoWrigley3GRIL;->mRecoveryState:Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;

    .line 51
    new-instance v0, Lcom/android/internal/telephony/MotoWrigley3GRIL$1;

    invoke-direct {v0, p0}, Lcom/android/internal/telephony/MotoWrigley3GRIL$1;-><init>(Lcom/android/internal/telephony/MotoWrigley3GRIL;)V

    iput-object v0, p0, Lcom/android/internal/telephony/MotoWrigley3GRIL;->mHandler:Landroid/os/Handler;

    .line 83
    new-instance v0, Lcom/android/internal/telephony/MotoWrigley3GRIL$RILSender;

    iget-object v1, p0, Lcom/android/internal/telephony/MotoWrigley3GRIL;->mSenderThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/android/internal/telephony/MotoWrigley3GRIL$RILSender;-><init>(Lcom/android/internal/telephony/MotoWrigley3GRIL;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/internal/telephony/MotoWrigley3GRIL;->mSender:Lcom/android/internal/telephony/RIL$RILSender;

    .line 84
    return-void
.end method

.method static synthetic access$000(Lcom/android/internal/telephony/MotoWrigley3GRIL;)Ljava/lang/Boolean;
    .locals 1
    .parameter "x0"

    .prologue
    .line 43
    iget-object v0, p0, Lcom/android/internal/telephony/MotoWrigley3GRIL;->mRadioShouldBeOn:Ljava/lang/Boolean;

    return-object v0
.end method

.method static synthetic access$101(Lcom/android/internal/telephony/MotoWrigley3GRIL;ZLandroid/os/Message;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 43
    invoke-super {p0, p1, p2}, Lcom/android/internal/telephony/RIL;->setRadioPower(ZLandroid/os/Message;)V

    return-void
.end method

.method static synthetic access$202(Lcom/android/internal/telephony/MotoWrigley3GRIL;Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;)Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 43
    iput-object p1, p0, Lcom/android/internal/telephony/MotoWrigley3GRIL;->mRecoveryState:Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;

    return-object p1
.end method

.method static synthetic access$300(Lcom/android/internal/telephony/MotoWrigley3GRIL;)Lcom/android/internal/telephony/RILRequest;
    .locals 1
    .parameter "x0"

    .prologue
    .line 43
    iget-object v0, p0, Lcom/android/internal/telephony/MotoWrigley3GRIL;->mSetupDataCallRequest:Lcom/android/internal/telephony/RILRequest;

    return-object v0
.end method

.method static synthetic access$302(Lcom/android/internal/telephony/MotoWrigley3GRIL;Lcom/android/internal/telephony/RILRequest;)Lcom/android/internal/telephony/RILRequest;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 43
    iput-object p1, p0, Lcom/android/internal/telephony/MotoWrigley3GRIL;->mSetupDataCallRequest:Lcom/android/internal/telephony/RILRequest;

    return-object p1
.end method

.method static synthetic access$401(Lcom/android/internal/telephony/MotoWrigley3GRIL;I)Lcom/android/internal/telephony/RILRequest;
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 43
    invoke-super {p0, p1}, Lcom/android/internal/telephony/RIL;->findAndRemoveRequestFromList(I)Lcom/android/internal/telephony/RILRequest;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public deactivateDataCall(IILandroid/os/Message;)V
    .locals 3
    .parameter "cid"
    .parameter "reason"
    .parameter "result"

    .prologue
    const/4 v2, 0x0

    .line 252
    iget v0, p0, Lcom/android/internal/telephony/MotoWrigley3GRIL;->mDataConnectionCount:I

    if-nez v0, :cond_0

    .line 253
    const-string v0, "MotoWrigley3GRIL"

    const-string v1, "Received deactivateDataCall RIL call without an active data call, dropping"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 254
    invoke-static {p3, v2, v2}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 255
    invoke-virtual {p3}, Landroid/os/Message;->sendToTarget()V

    .line 259
    :goto_0
    return-void

    .line 257
    :cond_0
    invoke-super {p0, p1, p2, p3}, Lcom/android/internal/telephony/RIL;->deactivateDataCall(IILandroid/os/Message;)V

    goto :goto_0
.end method

.method protected findAndRemoveRequestFromList(I)Lcom/android/internal/telephony/RILRequest;
    .locals 3
    .parameter "serial"

    .prologue
    .line 89
    invoke-super {p0, p1}, Lcom/android/internal/telephony/RIL;->findAndRemoveRequestFromList(I)Lcom/android/internal/telephony/RILRequest;

    move-result-object v0

    .line 90
    .local v0, rr:Lcom/android/internal/telephony/RILRequest;
    iget-object v1, p0, Lcom/android/internal/telephony/MotoWrigley3GRIL;->mSetupDataCallRequest:Lcom/android/internal/telephony/RILRequest;

    if-ne v0, v1, :cond_0

    .line 95
    const-string v1, "MotoWrigley3GRIL"

    const-string v2, "Got SETUP_DATA_CALL response"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/android/internal/telephony/MotoWrigley3GRIL;->mSetupDataCallRequest:Lcom/android/internal/telephony/RILRequest;

    .line 98
    :cond_0
    return-object v0
.end method

.method protected handleProcessedSolicitedResponse(Lcom/android/internal/telephony/RILRequest;ILjava/lang/Object;)V
    .locals 3
    .parameter "rr"
    .parameter "error"
    .parameter "ret"

    .prologue
    .line 104
    iget v0, p1, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    const/16 v1, 0x1b

    if-ne v0, v1, :cond_0

    .line 105
    const/4 v0, 0x2

    if-ne p2, v0, :cond_1

    iget-object v0, p0, Lcom/android/internal/telephony/MotoWrigley3GRIL;->mRecoveryState:Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;

    sget-object v1, Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;->IDLE:Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;

    if-ne v0, v1, :cond_1

    .line 106
    const-string v0, "MotoWrigley3GRIL"

    const-string v1, "Got GENERIC_FAILURE error for SETUP_DATA_CALL command, attempting recovery..."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 107
    sget-object v0, Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;->ACTIVE:Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;

    iput-object v0, p0, Lcom/android/internal/telephony/MotoWrigley3GRIL;->mRecoveryState:Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;

    .line 108
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/android/internal/telephony/MotoWrigley3GRIL;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    invoke-super {p0, v0, v1}, Lcom/android/internal/telephony/RIL;->setRadioPower(ZLandroid/os/Message;)V

    .line 115
    :cond_0
    :goto_0
    invoke-super {p0, p1, p2, p3}, Lcom/android/internal/telephony/RIL;->handleProcessedSolicitedResponse(Lcom/android/internal/telephony/RILRequest;ILjava/lang/Object;)V

    .line 116
    return-void

    .line 109
    :cond_1
    if-nez p2, :cond_0

    iget-object v0, p0, Lcom/android/internal/telephony/MotoWrigley3GRIL;->mRecoveryState:Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;

    sget-object v1, Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;->DONE:Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;

    if-ne v0, v1, :cond_0

    .line 110
    const-string v0, "MotoWrigley3GRIL"

    const-string v1, "SETUP_DATA_CALL GENERIC_FAILURE recovery successful."

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    sget-object v0, Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;->IDLE:Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;

    iput-object v0, p0, Lcom/android/internal/telephony/MotoWrigley3GRIL;->mRecoveryState:Lcom/android/internal/telephony/MotoWrigley3GRIL$DataCallRecoveryState;

    goto :goto_0
.end method

.method protected responseCallList(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 14
    .parameter "p"

    .prologue
    const/4 v10, 0x0

    const/4 v9, 0x1

    .line 148
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    .line 149
    .local v3, num:I
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 151
    .local v4, response:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/internal/telephony/DriverCall;>;"
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    if-ge v1, v3, :cond_7

    .line 152
    new-instance v0, Lcom/android/internal/telephony/DriverCall;

    invoke-direct {v0}, Lcom/android/internal/telephony/DriverCall;-><init>()V

    .line 154
    .local v0, dc:Lcom/android/internal/telephony/DriverCall;
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v8

    invoke-static {v8}, Lcom/android/internal/telephony/DriverCall;->stateFromCLCC(I)Lcom/android/internal/telephony/DriverCall$State;

    move-result-object v8

    iput-object v8, v0, Lcom/android/internal/telephony/DriverCall;->state:Lcom/android/internal/telephony/DriverCall$State;

    .line 155
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v8

    iput v8, v0, Lcom/android/internal/telephony/DriverCall;->index:I

    .line 156
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v8

    iput v8, v0, Lcom/android/internal/telephony/DriverCall;->TOA:I

    .line 157
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v8

    if-eqz v8, :cond_1

    move v8, v9

    :goto_1
    iput-boolean v8, v0, Lcom/android/internal/telephony/DriverCall;->isMpty:Z

    .line 158
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v8

    if-eqz v8, :cond_2

    move v8, v9

    :goto_2
    iput-boolean v8, v0, Lcom/android/internal/telephony/DriverCall;->isMT:Z

    .line 159
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v8

    iput v8, v0, Lcom/android/internal/telephony/DriverCall;->als:I

    .line 160
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v7

    .line 161
    .local v7, voiceSettings:I
    if-nez v7, :cond_3

    move v8, v10

    :goto_3
    iput-boolean v8, v0, Lcom/android/internal/telephony/DriverCall;->isVoice:Z

    .line 162
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v8

    if-eqz v8, :cond_4

    move v8, v9

    :goto_4
    iput-boolean v8, v0, Lcom/android/internal/telephony/DriverCall;->isVoicePrivacy:Z

    .line 163
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, v0, Lcom/android/internal/telephony/DriverCall;->number:Ljava/lang/String;

    .line 164
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 169
    .local v2, np:I
    iget-boolean v8, v0, Lcom/android/internal/telephony/DriverCall;->isMT:Z

    if-nez v8, :cond_0

    const/4 v2, 0x0

    .line 170
    :cond_0
    invoke-static {v2}, Lcom/android/internal/telephony/DriverCall;->presentationFromCLIP(I)I

    move-result v8

    iput v8, v0, Lcom/android/internal/telephony/DriverCall;->numberPresentation:I

    .line 171
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, v0, Lcom/android/internal/telephony/DriverCall;->name:Ljava/lang/String;

    .line 172
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v8

    iput v8, v0, Lcom/android/internal/telephony/DriverCall;->namePresentation:I

    .line 173
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v6

    .line 174
    .local v6, uusInfoPresent:I
    if-ne v6, v9, :cond_5

    .line 175
    new-instance v8, Lcom/android/internal/telephony/UUSInfo;

    invoke-direct {v8}, Lcom/android/internal/telephony/UUSInfo;-><init>()V

    iput-object v8, v0, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    .line 176
    iget-object v8, v0, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v11

    invoke-virtual {v8, v11}, Lcom/android/internal/telephony/UUSInfo;->setType(I)V

    .line 177
    iget-object v8, v0, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v11

    invoke-virtual {v8, v11}, Lcom/android/internal/telephony/UUSInfo;->setDcs(I)V

    .line 178
    invoke-virtual {p1}, Landroid/os/Parcel;->createByteArray()[B

    move-result-object v5

    .line 179
    .local v5, userData:[B
    iget-object v8, v0, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual {v8, v5}, Lcom/android/internal/telephony/UUSInfo;->setUserData([B)V

    .line 180
    const-string v8, "Incoming UUS : type=%d, dcs=%d, length=%d"

    const/4 v11, 0x3

    new-array v11, v11, [Ljava/lang/Object;

    iget-object v12, v0, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual {v12}, Lcom/android/internal/telephony/UUSInfo;->getType()I

    move-result v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v11, v10

    iget-object v12, v0, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual {v12}, Lcom/android/internal/telephony/UUSInfo;->getDcs()I

    move-result v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v11, v9

    const/4 v12, 0x2

    iget-object v13, v0, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual {v13}, Lcom/android/internal/telephony/UUSInfo;->getUserData()[B

    move-result-object v13

    array-length v13, v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-static {v8, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/android/internal/telephony/MotoWrigley3GRIL;->riljLogv(Ljava/lang/String;)V

    .line 183
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Incoming UUS : data (string)="

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    new-instance v11, Ljava/lang/String;

    iget-object v12, v0, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual {v12}, Lcom/android/internal/telephony/UUSInfo;->getUserData()[B

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/android/internal/telephony/MotoWrigley3GRIL;->riljLogv(Ljava/lang/String;)V

    .line 185
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Incoming UUS : data (hex): "

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v11, v0, Lcom/android/internal/telephony/DriverCall;->uusInfo:Lcom/android/internal/telephony/UUSInfo;

    invoke-virtual {v11}, Lcom/android/internal/telephony/UUSInfo;->getUserData()[B

    move-result-object v11

    invoke-static {v11}, Lcom/android/internal/telephony/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/android/internal/telephony/MotoWrigley3GRIL;->riljLogv(Ljava/lang/String;)V

    .line 192
    .end local v5           #userData:[B
    :goto_5
    iget-object v8, v0, Lcom/android/internal/telephony/DriverCall;->number:Ljava/lang/String;

    iget v11, v0, Lcom/android/internal/telephony/DriverCall;->TOA:I

    invoke-static {v8, v11}, Landroid/telephony/PhoneNumberUtils;->stringFromStringAndTOA(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v0, Lcom/android/internal/telephony/DriverCall;->number:Ljava/lang/String;

    .line 194
    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 196
    iget-boolean v8, v0, Lcom/android/internal/telephony/DriverCall;->isVoicePrivacy:Z

    if-eqz v8, :cond_6

    .line 197
    iget-object v8, p0, Lcom/android/internal/telephony/MotoWrigley3GRIL;->mVoicePrivacyOnRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v8}, Landroid/os/RegistrantList;->notifyRegistrants()V

    .line 198
    const-string v8, "InCall VoicePrivacy is enabled"

    invoke-virtual {p0, v8}, Lcom/android/internal/telephony/MotoWrigley3GRIL;->riljLog(Ljava/lang/String;)V

    .line 151
    :goto_6
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    .end local v2           #np:I
    .end local v6           #uusInfoPresent:I
    .end local v7           #voiceSettings:I
    :cond_1
    move v8, v10

    .line 157
    goto/16 :goto_1

    :cond_2
    move v8, v10

    .line 158
    goto/16 :goto_2

    .restart local v7       #voiceSettings:I
    :cond_3
    move v8, v9

    .line 161
    goto/16 :goto_3

    :cond_4
    move v8, v10

    .line 162
    goto/16 :goto_4

    .line 188
    .restart local v2       #np:I
    .restart local v6       #uusInfoPresent:I
    :cond_5
    const-string v8, "Incoming UUS : NOT present!"

    invoke-virtual {p0, v8}, Lcom/android/internal/telephony/MotoWrigley3GRIL;->riljLogv(Ljava/lang/String;)V

    goto :goto_5

    .line 200
    :cond_6
    iget-object v8, p0, Lcom/android/internal/telephony/MotoWrigley3GRIL;->mVoicePrivacyOffRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v8}, Landroid/os/RegistrantList;->notifyRegistrants()V

    .line 201
    const-string v8, "InCall VoicePrivacy is disabled"

    invoke-virtual {p0, v8}, Lcom/android/internal/telephony/MotoWrigley3GRIL;->riljLog(Ljava/lang/String;)V

    goto :goto_6

    .line 205
    .end local v0           #dc:Lcom/android/internal/telephony/DriverCall;
    .end local v2           #np:I
    .end local v6           #uusInfoPresent:I
    .end local v7           #voiceSettings:I
    :cond_7
    invoke-static {v4}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 207
    return-object v4
.end method

.method protected responseDataCallList(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 4
    .parameter "p"

    .prologue
    .line 213
    invoke-super {p0, p1}, Lcom/android/internal/telephony/RIL;->responseDataCallList(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 215
    .local v0, response:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/internal/telephony/DataCallState;>;"
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    iput v1, p0, Lcom/android/internal/telephony/MotoWrigley3GRIL;->mDataConnectionCount:I

    .line 216
    const-string v1, "MotoWrigley3GRIL"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Got data call list message, now has "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/android/internal/telephony/MotoWrigley3GRIL;->mDataConnectionCount:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " connections"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 218
    return-object v0
.end method

.method protected responseSuppServiceNotification(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 3
    .parameter "p"

    .prologue
    .line 121
    invoke-super {p0, p1}, Lcom/android/internal/telephony/RIL;->responseSuppServiceNotification(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/gsm/SuppServiceNotification;

    .line 131
    .local v0, notification:Lcom/android/internal/telephony/gsm/SuppServiceNotification;
    iget v1, v0, Lcom/android/internal/telephony/gsm/SuppServiceNotification;->notificationType:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 132
    iget v1, v0, Lcom/android/internal/telephony/gsm/SuppServiceNotification;->code:I

    const/16 v2, 0xa

    if-ne v1, v2, :cond_0

    .line 133
    const/4 v1, 0x0

    iput v1, v0, Lcom/android/internal/telephony/gsm/SuppServiceNotification;->code:I

    .line 137
    :cond_0
    return-object v0
.end method

.method public setRadioPower(ZLandroid/os/Message;)V
    .locals 1
    .parameter "power"
    .parameter "result"

    .prologue
    .line 264
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/telephony/MotoWrigley3GRIL;->mRadioShouldBeOn:Ljava/lang/Boolean;

    .line 265
    invoke-super {p0, p1, p2}, Lcom/android/internal/telephony/RIL;->setRadioPower(ZLandroid/os/Message;)V

    .line 266
    return-void
.end method

.method public setupDataCall(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V
    .locals 3
    .parameter "radioTechnology"
    .parameter "profile"
    .parameter "apn"
    .parameter "user"
    .parameter "password"
    .parameter "authType"
    .parameter "protocol"
    .parameter "result"

    .prologue
    .line 226
    const/16 v1, 0x1b

    invoke-static {v1, p8}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v0

    .line 229
    .local v0, rr:Lcom/android/internal/telephony/RILRequest;
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mp:Landroid/os/Parcel;

    const/4 v2, 0x7

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 231
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mp:Landroid/os/Parcel;

    invoke-virtual {v1, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 232
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mp:Landroid/os/Parcel;

    invoke-virtual {v1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 233
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mp:Landroid/os/Parcel;

    invoke-virtual {v1, p3}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 234
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mp:Landroid/os/Parcel;

    invoke-virtual {v1, p4}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 235
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mp:Landroid/os/Parcel;

    invoke-virtual {v1, p5}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 236
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mp:Landroid/os/Parcel;

    invoke-virtual {v1, p6}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 237
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mp:Landroid/os/Parcel;

    invoke-virtual {v1, p7}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 239
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, v0, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v2}, Lcom/android/internal/telephony/MotoWrigley3GRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/MotoWrigley3GRIL;->riljLog(Ljava/lang/String;)V

    .line 244
    iput-object v0, p0, Lcom/android/internal/telephony/MotoWrigley3GRIL;->mSetupDataCallRequest:Lcom/android/internal/telephony/RILRequest;

    .line 246
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/MotoWrigley3GRIL;->send(Lcom/android/internal/telephony/RILRequest;)V

    .line 247
    return-void
.end method

.method protected switchToRadioState(Lcom/android/internal/telephony/CommandsInterface$RadioState;)V
    .locals 3
    .parameter "newState"

    .prologue
    .line 270
    const-string v0, "MotoWrigley3GRIL"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "switchToRadioState, old = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/telephony/MotoWrigley3GRIL;->mState:Lcom/android/internal/telephony/CommandsInterface$RadioState;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " new = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 271
    invoke-super {p0, p1}, Lcom/android/internal/telephony/RIL;->switchToRadioState(Lcom/android/internal/telephony/CommandsInterface$RadioState;)V

    .line 272
    return-void
.end method
