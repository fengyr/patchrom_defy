.class Lcom/android/server/ServerThread;
.super Ljava/lang/Thread;
.source "SystemServer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/ServerThread$AdbPortObserver;
    }
.end annotation


# static fields
.field private static final ENCRYPTED_STATE:Ljava/lang/String; = "1"

.field private static final ENCRYPTING_STATE:Ljava/lang/String; = "trigger_restart_min_framework"

.field private static final TAG:Ljava/lang/String; = "SystemServer"


# instance fields
.field mContentResolver:Landroid/content/ContentResolver;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 80
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 92
    return-void
.end method

.method static final startSystemUi(Landroid/content/Context;)V
    .locals 4
    .parameter "context"

    .prologue
    .line 1025
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 1026
    .local v0, intent:Landroid/content/Intent;
    new-instance v1, Landroid/content/ComponentName;

    const-string v2, "com.android.systemui"

    const-string v3, "com.android.systemui.SystemUIService"

    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 1028
    const-string v1, "SystemServer"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Starting service: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1029
    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 1030
    return-void
.end method


# virtual methods
.method reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 3
    .parameter "msg"
    .parameter "e"

    .prologue
    .line 88
    const-string v0, "SystemServer"

    const-string v1, "***********************************************"

    invoke-static {v0, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    const-string v0, "SystemServer"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "BOOT FAILURE "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p2}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 90
    return-void
.end method

.method public run()V
    .locals 142

    .prologue
    .line 107
    const/16 v4, 0xbc2

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v10

    invoke-static {v4, v10, v11}, Landroid/util/EventLog;->writeEvent(IJ)I

    .line 110
    invoke-static {}, Landroid/os/Looper;->prepare()V

    .line 112
    const/4 v4, -0x2

    invoke-static {v4}, Landroid/os/Process;->setThreadPriority(I)V

    .line 115
    const/4 v4, 0x1

    invoke-static {v4}, Lcom/android/internal/os/BinderInternal;->disableBackgroundScheduling(Z)V

    .line 116
    const/4 v4, 0x0

    invoke-static {v4}, Landroid/os/Process;->setCanSelfBackground(Z)V

    .line 120
    const-string v4, "sys.shutdown.requested"

    const-string v10, ""

    invoke-static {v4, v10}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v120

    .line 122
    .local v120, shutdownAction:Ljava/lang/String;
    if-eqz v120, :cond_0

    invoke-virtual/range {v120 .. v120}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_0

    .line 123
    const/4 v4, 0x0

    move-object/from16 v0, v120

    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v10, 0x31

    if-ne v4, v10, :cond_a

    const/16 v111, 0x1

    .line 126
    .local v111, reboot:Z
    :goto_0
    invoke-virtual/range {v120 .. v120}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v10, 0x1

    if-le v4, v10, :cond_b

    .line 127
    const/4 v4, 0x1

    invoke-virtual/range {v120 .. v120}, Ljava/lang/String;->length()I

    move-result v10

    move-object/from16 v0, v120

    invoke-virtual {v0, v4, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v110

    .line 132
    .local v110, reason:Ljava/lang/String;
    :goto_1
    move/from16 v0, v111

    move-object/from16 v1, v110

    invoke-static {v0, v1}, Lcom/android/server/pm/ShutdownThread;->rebootOrShutdown(ZLjava/lang/String;)V

    .line 136
    .end local v110           #reason:Ljava/lang/String;
    .end local v111           #reboot:Z
    :cond_0
    const-string v4, "ro.factorytest"

    invoke-static {v4}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v75

    .line 137
    .local v75, factoryTestStr:Ljava/lang/String;
    const-string v4, ""

    move-object/from16 v0, v75

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c

    const/16 v74, 0x0

    .line 139
    .local v74, factoryTest:I
    :goto_2
    const-string v4, "1"

    const-string v10, "ro.config.headless"

    const-string v11, "0"

    invoke-static {v10, v11}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v4, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    .line 141
    .local v17, headless:Z
    const/16 v43, 0x0

    .line 142
    .local v43, accountManager:Landroid/accounts/AccountManagerService;
    const/16 v62, 0x0

    .line 143
    .local v62, contentService:Landroid/content/ContentService;
    const/16 v87, 0x0

    .line 144
    .local v87, lights:Lcom/android/server/LightsService;
    const/16 v107, 0x0

    .line 145
    .local v107, power:Lcom/android/server/PowerManagerService;
    const/16 v49, 0x0

    .line 146
    .local v49, battery:Lcom/android/server/BatteryService;
    const/16 v132, 0x0

    .line 147
    .local v132, vibrator:Lcom/android/server/VibratorService;
    const/16 v45, 0x0

    .line 148
    .local v45, alarm:Lcom/android/server/AlarmManagerService;
    const/4 v14, 0x0

    .line 149
    .local v14, networkManagement:Lcom/android/server/NetworkManagementService;
    const/4 v13, 0x0

    .line 150
    .local v13, networkStats:Lcom/android/server/net/NetworkStatsService;
    const/16 v97, 0x0

    .line 151
    .local v97, networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    const/16 v60, 0x0

    .line 152
    .local v60, connectivity:Lcom/android/server/ConnectivityService;
    const/16 v139, 0x0

    .line 153
    .local v139, wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    const/16 v137, 0x0

    .line 154
    .local v137, wifi:Lcom/android/server/WifiService;
    const/16 v119, 0x0

    .line 155
    .local v119, serviceDiscovery:Lcom/android/server/NsdService;
    const/16 v106, 0x0

    .line 156
    .local v106, pm:Landroid/content/pm/IPackageManager;
    const/4 v5, 0x0

    .line 157
    .local v5, context:Landroid/content/Context;
    const/16 v141, 0x0

    .line 158
    .local v141, wm:Lcom/android/server/wm/WindowManagerService;
    const/16 v50, 0x0

    .line 159
    .local v50, bluetooth:Landroid/server/BluetoothService;
    const/16 v52, 0x0

    .line 160
    .local v52, bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    const/16 v69, 0x0

    .line 161
    .local v69, dock:Lcom/android/server/DockObserver;
    const/16 v114, 0x0

    .line 162
    .local v114, rotateSwitch:Lcom/android/server/RotationSwitchObserver;
    const/16 v129, 0x0

    .line 163
    .local v129, usb:Lcom/android/server/usb/UsbService;
    const/16 v116, 0x0

    .line 164
    .local v116, serial:Lcom/android/server/SerialService;
    const/16 v127, 0x0

    .line 165
    .local v127, uiMode:Lcom/android/server/UiModeManagerService;
    const/16 v112, 0x0

    .line 166
    .local v112, recognition:Lcom/android/server/RecognitionManagerService;
    const/16 v123, 0x0

    .line 167
    .local v123, throttle:Lcom/android/server/ThrottleService;
    const/16 v99, 0x0

    .line 168
    .local v99, networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    const/16 v57, 0x0

    .line 169
    .local v57, commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    const/16 v82, 0x0

    .line 173
    .local v82, inputManager:Lcom/android/server/input/InputManagerService;
    :try_start_0
    const-string v4, "SystemServer"

    const-string v10, "Entropy Mixer"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 174
    const-string v4, "entropy"

    new-instance v10, Lcom/android/server/EntropyMixer;

    invoke-direct {v10}, Lcom/android/server/EntropyMixer;-><init>()V

    invoke-static {v4, v10}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 176
    const-string v4, "SystemServer"

    const-string v10, "Power Manager"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 177
    new-instance v7, Lcom/android/server/PowerManagerService;

    invoke-direct {v7}, Lcom/android/server/PowerManagerService;-><init>()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_52

    .line 178
    .end local v107           #power:Lcom/android/server/PowerManagerService;
    .local v7, power:Lcom/android/server/PowerManagerService;
    :try_start_1
    const-string v4, "power"

    invoke-static {v4, v7}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 180
    const-string v4, "SystemServer"

    const-string v10, "Activity Manager"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 181
    invoke-static/range {v74 .. v74}, Lcom/android/server/am/ActivityManagerService;->main(I)Landroid/content/Context;

    move-result-object v5

    .line 183
    const-string v4, "SystemServer"

    const-string v10, "Telephony Registry"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 184
    const-string v4, "telephony.registry"

    new-instance v10, Lcom/android/server/TelephonyRegistry;

    invoke-direct {v10, v5}, Lcom/android/server/TelephonyRegistry;-><init>(Landroid/content/Context;)V

    invoke-static {v4, v10}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 186
    const-string v4, "SystemServer"

    const-string v10, "Scheduling Policy"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 187
    const-string v4, "scheduling_policy"

    new-instance v10, Landroid/os/SchedulingPolicyService;

    invoke-direct {v10}, Landroid/os/SchedulingPolicyService;-><init>()V

    invoke-static {v4, v10}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 190
    invoke-static {v5}, Lcom/android/server/AttributeCache;->init(Landroid/content/Context;)V

    .line 192
    const-string v4, "SystemServer"

    const-string v10, "Package Manager"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 194
    const-string v4, "vold.decrypt"

    invoke-static {v4}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v65

    .line 195
    .local v65, cryptState:Ljava/lang/String;
    const/16 v103, 0x0

    .line 196
    .local v103, onlyCore:Z
    const-string v4, "trigger_restart_min_framework"

    move-object/from16 v0, v65

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d

    .line 197
    const-string v4, "SystemServer"

    const-string v10, "Detected encryption in progress - only parsing core apps"

    invoke-static {v4, v10}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 198
    const/16 v103, 0x1

    .line 204
    :cond_1
    :goto_3
    if-eqz v74, :cond_e

    const/4 v4, 0x1

    :goto_4
    move/from16 v0, v103

    invoke-static {v5, v4, v0}, Lcom/android/server/pm/PackageManagerService;->main(Landroid/content/Context;ZZ)Landroid/content/pm/IPackageManager;
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v106

    .line 207
    const/16 v77, 0x0

    .line 209
    .local v77, firstBoot:Z
    :try_start_2
    invoke-interface/range {v106 .. v106}, Landroid/content/pm/IPackageManager;->isFirstBoot()Z
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_3a
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_1

    move-result v77

    .line 213
    :goto_5
    :try_start_3
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->setSystemProcess()V

    .line 215
    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/android/server/ServerThread;->mContentResolver:Landroid/content/ContentResolver;
    :try_end_3
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_1

    .line 219
    :try_start_4
    const-string v4, "SystemServer"

    const-string v10, "Account Manager"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 220
    new-instance v44, Landroid/accounts/AccountManagerService;

    move-object/from16 v0, v44

    invoke-direct {v0, v5}, Landroid/accounts/AccountManagerService;-><init>(Landroid/content/Context;)V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_1

    .line 221
    .end local v43           #accountManager:Landroid/accounts/AccountManagerService;
    .local v44, accountManager:Landroid/accounts/AccountManagerService;
    :try_start_5
    const-string v4, "account"

    move-object/from16 v0, v44

    invoke-static {v4, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_59
    .catch Ljava/lang/RuntimeException; {:try_start_5 .. :try_end_5} :catch_53

    move-object/from16 v43, v44

    .line 226
    .end local v44           #accountManager:Landroid/accounts/AccountManagerService;
    .restart local v43       #accountManager:Landroid/accounts/AccountManagerService;
    :goto_6
    :try_start_6
    const-string v4, "SystemServer"

    const-string v10, "Content Manager"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 227
    const/4 v4, 0x1

    move/from16 v0, v74

    if-ne v0, v4, :cond_f

    const/4 v4, 0x1

    :goto_7
    invoke-static {v5, v4}, Landroid/content/ContentService;->main(Landroid/content/Context;Z)Landroid/content/ContentService;

    move-result-object v62

    .line 230
    const-string v4, "SystemServer"

    const-string v10, "System Content Providers"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 231
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->installSystemProviders()V

    .line 233
    const-string v4, "SystemServer"

    const-string v10, "Lights Service"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 234
    new-instance v88, Lcom/android/server/LightsService;

    move-object/from16 v0, v88

    invoke-direct {v0, v5}, Lcom/android/server/LightsService;-><init>(Landroid/content/Context;)V
    :try_end_6
    .catch Ljava/lang/RuntimeException; {:try_start_6 .. :try_end_6} :catch_1

    .line 236
    .end local v87           #lights:Lcom/android/server/LightsService;
    .local v88, lights:Lcom/android/server/LightsService;
    :try_start_7
    const-string v4, "SystemServer"

    const-string v10, "Battery Service"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 237
    new-instance v6, Lcom/android/server/BatteryService;

    move-object/from16 v0, v88

    invoke-direct {v6, v5, v0}, Lcom/android/server/BatteryService;-><init>(Landroid/content/Context;Lcom/android/server/LightsService;)V
    :try_end_7
    .catch Ljava/lang/RuntimeException; {:try_start_7 .. :try_end_7} :catch_54

    .line 238
    .end local v49           #battery:Lcom/android/server/BatteryService;
    .local v6, battery:Lcom/android/server/BatteryService;
    :try_start_8
    const-string v4, "battery"

    invoke-static {v4, v6}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 240
    const-string v4, "SystemServer"

    const-string v10, "Vibrator Service"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 241
    new-instance v133, Lcom/android/server/VibratorService;

    move-object/from16 v0, v133

    invoke-direct {v0, v5}, Lcom/android/server/VibratorService;-><init>(Landroid/content/Context;)V
    :try_end_8
    .catch Ljava/lang/RuntimeException; {:try_start_8 .. :try_end_8} :catch_55

    .line 242
    .end local v132           #vibrator:Lcom/android/server/VibratorService;
    .local v133, vibrator:Lcom/android/server/VibratorService;
    :try_start_9
    const-string v4, "vibrator"

    move-object/from16 v0, v133

    invoke-static {v4, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 246
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v4

    move-object/from16 v0, v88

    invoke-virtual {v7, v5, v0, v4, v6}, Lcom/android/server/PowerManagerService;->init(Landroid/content/Context;Lcom/android/server/LightsService;Landroid/app/IActivityManager;Lcom/android/server/BatteryService;)V

    .line 248
    const-string v4, "SystemServer"

    const-string v10, "Alarm Manager"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 249
    new-instance v8, Lcom/android/server/AlarmManagerService;

    invoke-direct {v8, v5}, Lcom/android/server/AlarmManagerService;-><init>(Landroid/content/Context;)V
    :try_end_9
    .catch Ljava/lang/RuntimeException; {:try_start_9 .. :try_end_9} :catch_56

    .line 250
    .end local v45           #alarm:Lcom/android/server/AlarmManagerService;
    .local v8, alarm:Lcom/android/server/AlarmManagerService;
    :try_start_a
    const-string v4, "alarm"

    invoke-static {v4, v8}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 252
    const-string v4, "SystemServer"

    const-string v10, "Init Watchdog"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 253
    invoke-static {}, Lcom/android/server/Watchdog;->getInstance()Lcom/android/server/Watchdog;

    move-result-object v4

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v9

    invoke-virtual/range {v4 .. v9}, Lcom/android/server/Watchdog;->init(Landroid/content/Context;Lcom/android/server/BatteryService;Lcom/android/server/PowerManagerService;Lcom/android/server/AlarmManagerService;Lcom/android/server/am/ActivityManagerService;)V

    .line 256
    const-string v4, "SystemServer"

    const-string v10, "Window Manager"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 257
    const/4 v4, 0x1

    move/from16 v0, v74

    if-eq v0, v4, :cond_10

    const/4 v4, 0x1

    move v10, v4

    :goto_8
    if-nez v77, :cond_11

    const/4 v4, 0x1

    :goto_9
    move/from16 v0, v103

    invoke-static {v5, v7, v10, v4, v0}, Lcom/android/server/wm/WindowManagerService;->main(Landroid/content/Context;Lcom/android/server/PowerManagerService;ZZZ)Lcom/android/server/wm/WindowManagerService;

    move-result-object v141

    .line 260
    const-string v4, "window"

    move-object/from16 v0, v141

    invoke-static {v4, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 261
    invoke-virtual/range {v141 .. v141}, Lcom/android/server/wm/WindowManagerService;->getInputManagerService()Lcom/android/server/input/InputManagerService;

    move-result-object v82

    .line 262
    const-string v4, "input"

    move-object/from16 v0, v82

    invoke-static {v4, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 264
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v4

    move-object/from16 v0, v141

    invoke-virtual {v4, v0}, Lcom/android/server/am/ActivityManagerService;->setWindowManager(Lcom/android/server/wm/WindowManagerService;)V

    .line 269
    const-string v4, "ro.kernel.qemu"

    invoke-static {v4}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v10, "1"

    invoke-virtual {v4, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_12

    .line 270
    const-string v4, "SystemServer"

    const-string v10, "No Bluetooh Service (emulator)"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_a
    .catch Ljava/lang/RuntimeException; {:try_start_a .. :try_end_a} :catch_2

    :goto_a
    move-object/from16 v132, v133

    .end local v133           #vibrator:Lcom/android/server/VibratorService;
    .restart local v132       #vibrator:Lcom/android/server/VibratorService;
    move-object/from16 v87, v88

    .line 298
    .end local v65           #cryptState:Ljava/lang/String;
    .end local v77           #firstBoot:Z
    .end local v88           #lights:Lcom/android/server/LightsService;
    .end local v103           #onlyCore:Z
    .restart local v87       #lights:Lcom/android/server/LightsService;
    :goto_b
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v10, 0x1110045

    invoke-virtual {v4, v10}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v78

    .line 301
    .local v78, hasRotationLock:Z
    const/16 v67, 0x0

    .line 302
    .local v67, devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    const/16 v121, 0x0

    .line 303
    .local v121, statusBar:Lcom/android/server/StatusBarManagerService;
    const/16 v80, 0x0

    .line 304
    .local v80, imm:Lcom/android/server/InputMethodManagerService;
    const/16 v46, 0x0

    .line 305
    .local v46, appWidget:Lcom/android/server/AppWidgetService;
    const/16 v108, 0x0

    .line 306
    .local v108, profile:Lcom/android/server/ProfileManagerService;
    const/16 v101, 0x0

    .line 307
    .local v101, notification:Lcom/android/server/NotificationManagerService;
    const/16 v135, 0x0

    .line 308
    .local v135, wallpaper:Lcom/android/server/WallpaperManagerService;
    const/16 v90, 0x0

    .line 309
    .local v90, location:Lcom/android/server/LocationManagerService;
    const/16 v63, 0x0

    .line 310
    .local v63, countryDetector:Lcom/android/server/CountryDetectorService;
    const/16 v125, 0x0

    .line 311
    .local v125, tsms:Lcom/android/server/TextServicesManagerService;
    const/16 v92, 0x0

    .line 312
    .local v92, lockSettings:Lcom/android/internal/widget/LockSettingsService;
    const/16 v71, 0x0

    .line 315
    .local v71, dreamy:Landroid/service/dreams/DreamManagerService;
    const/4 v4, 0x1

    move/from16 v0, v74

    if-eq v0, v4, :cond_2

    .line 317
    :try_start_b
    const-string v4, "SystemServer"

    const-string v10, "Input Method Service"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 318
    new-instance v81, Lcom/android/server/InputMethodManagerService;

    move-object/from16 v0, v81

    move-object/from16 v1, v141

    invoke-direct {v0, v5, v1}, Lcom/android/server/InputMethodManagerService;-><init>(Landroid/content/Context;Lcom/android/server/wm/WindowManagerService;)V
    :try_end_b
    .catch Ljava/lang/Throwable; {:try_start_b .. :try_end_b} :catch_3

    .line 319
    .end local v80           #imm:Lcom/android/server/InputMethodManagerService;
    .local v81, imm:Lcom/android/server/InputMethodManagerService;
    :try_start_c
    const-string v4, "input_method"

    move-object/from16 v0, v81

    invoke-static {v4, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_c
    .catch Ljava/lang/Throwable; {:try_start_c .. :try_end_c} :catch_51

    move-object/from16 v80, v81

    .line 325
    .end local v81           #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v80       #imm:Lcom/android/server/InputMethodManagerService;
    :goto_c
    :try_start_d
    const-string v4, "SystemServer"

    const-string v10, "Accessibility Manager"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 326
    const-string v4, "accessibility"

    new-instance v10, Lcom/android/server/accessibility/AccessibilityManagerService;

    invoke-direct {v10, v5}, Lcom/android/server/accessibility/AccessibilityManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v4, v10}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_d
    .catch Ljava/lang/Throwable; {:try_start_d .. :try_end_d} :catch_4

    .line 334
    :cond_2
    :goto_d
    :try_start_e
    invoke-virtual/range {v141 .. v141}, Lcom/android/server/wm/WindowManagerService;->displayReady()V
    :try_end_e
    .catch Ljava/lang/Throwable; {:try_start_e .. :try_end_e} :catch_5

    .line 340
    :goto_e
    :try_start_f
    invoke-interface/range {v106 .. v106}, Landroid/content/pm/IPackageManager;->performBootDexOpt()V
    :try_end_f
    .catch Ljava/lang/Throwable; {:try_start_f .. :try_end_f} :catch_6

    .line 346
    :goto_f
    :try_start_10
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v4

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x1040413

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v10

    const/4 v11, 0x0

    invoke-interface {v4, v10, v11}, Landroid/app/IActivityManager;->showBootMessage(Ljava/lang/CharSequence;Z)V
    :try_end_10
    .catch Landroid/os/RemoteException; {:try_start_10 .. :try_end_10} :catch_50

    .line 353
    :goto_10
    const/4 v4, 0x1

    move/from16 v0, v74

    if-eq v0, v4, :cond_1e

    .line 354
    const/16 v95, 0x0

    .line 355
    .local v95, mountService:Lcom/android/server/MountService;
    const-string v4, "0"

    const-string v10, "system_init.startmountservice"

    invoke-static {v10}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v4, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 361
    :try_start_11
    const-string v4, "SystemServer"

    const-string v10, "Mount Service"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 362
    new-instance v96, Lcom/android/server/MountService;

    move-object/from16 v0, v96

    invoke-direct {v0, v5}, Lcom/android/server/MountService;-><init>(Landroid/content/Context;)V
    :try_end_11
    .catch Ljava/lang/Throwable; {:try_start_11 .. :try_end_11} :catch_7

    .line 363
    .end local v95           #mountService:Lcom/android/server/MountService;
    .local v96, mountService:Lcom/android/server/MountService;
    :try_start_12
    const-string v4, "mount"

    move-object/from16 v0, v96

    invoke-static {v4, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_12
    .catch Ljava/lang/Throwable; {:try_start_12 .. :try_end_12} :catch_4f

    move-object/from16 v95, v96

    .line 370
    .end local v96           #mountService:Lcom/android/server/MountService;
    .restart local v95       #mountService:Lcom/android/server/MountService;
    :cond_3
    :goto_11
    :try_start_13
    const-string v4, "SystemServer"

    const-string v10, "LockSettingsService"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 371
    new-instance v93, Lcom/android/internal/widget/LockSettingsService;

    move-object/from16 v0, v93

    invoke-direct {v0, v5}, Lcom/android/internal/widget/LockSettingsService;-><init>(Landroid/content/Context;)V
    :try_end_13
    .catch Ljava/lang/Throwable; {:try_start_13 .. :try_end_13} :catch_8

    .line 372
    .end local v92           #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    .local v93, lockSettings:Lcom/android/internal/widget/LockSettingsService;
    :try_start_14
    const-string v4, "lock_settings"

    move-object/from16 v0, v93

    invoke-static {v4, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_14
    .catch Ljava/lang/Throwable; {:try_start_14 .. :try_end_14} :catch_4e

    move-object/from16 v92, v93

    .line 378
    .end local v93           #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    .restart local v92       #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    :goto_12
    :try_start_15
    const-string v4, "SystemServer"

    const-string v10, "Device Policy"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 379
    new-instance v68, Lcom/android/server/DevicePolicyManagerService;

    move-object/from16 v0, v68

    invoke-direct {v0, v5}, Lcom/android/server/DevicePolicyManagerService;-><init>(Landroid/content/Context;)V
    :try_end_15
    .catch Ljava/lang/Throwable; {:try_start_15 .. :try_end_15} :catch_9

    .line 380
    .end local v67           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .local v68, devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    :try_start_16
    const-string v4, "device_policy"

    move-object/from16 v0, v68

    invoke-static {v4, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_16
    .catch Ljava/lang/Throwable; {:try_start_16 .. :try_end_16} :catch_4d

    move-object/from16 v67, v68

    .line 386
    .end local v68           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v67       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    :goto_13
    :try_start_17
    const-string v4, "SystemServer"

    const-string v10, "Status Bar"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 387
    new-instance v122, Lcom/android/server/StatusBarManagerService;

    move-object/from16 v0, v122

    move-object/from16 v1, v141

    invoke-direct {v0, v5, v1}, Lcom/android/server/StatusBarManagerService;-><init>(Landroid/content/Context;Lcom/android/server/wm/WindowManagerService;)V
    :try_end_17
    .catch Ljava/lang/Throwable; {:try_start_17 .. :try_end_17} :catch_a

    .line 388
    .end local v121           #statusBar:Lcom/android/server/StatusBarManagerService;
    .local v122, statusBar:Lcom/android/server/StatusBarManagerService;
    :try_start_18
    const-string v4, "statusbar"

    move-object/from16 v0, v122

    invoke-static {v4, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_18
    .catch Ljava/lang/Throwable; {:try_start_18 .. :try_end_18} :catch_4c

    move-object/from16 v121, v122

    .line 394
    .end local v122           #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v121       #statusBar:Lcom/android/server/StatusBarManagerService;
    :goto_14
    :try_start_19
    const-string v4, "SystemServer"

    const-string v10, "Clipboard Service"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 395
    const-string v4, "clipboard"

    new-instance v10, Lcom/android/server/ClipboardService;

    invoke-direct {v10, v5}, Lcom/android/server/ClipboardService;-><init>(Landroid/content/Context;)V

    invoke-static {v4, v10}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_19
    .catch Ljava/lang/Throwable; {:try_start_19 .. :try_end_19} :catch_b

    .line 402
    :goto_15
    :try_start_1a
    const-string v4, "SystemServer"

    const-string v10, "NetworkManagement Service"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 403
    invoke-static {v5}, Lcom/android/server/NetworkManagementService;->create(Landroid/content/Context;)Lcom/android/server/NetworkManagementService;

    move-result-object v14

    .line 404
    const-string v4, "network_management"

    invoke-static {v4, v14}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_1a
    .catch Ljava/lang/Throwable; {:try_start_1a .. :try_end_1a} :catch_c

    .line 410
    :goto_16
    :try_start_1b
    const-string v4, "SystemServer"

    const-string v10, "Text Service Manager Service"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 411
    new-instance v126, Lcom/android/server/TextServicesManagerService;

    move-object/from16 v0, v126

    invoke-direct {v0, v5}, Lcom/android/server/TextServicesManagerService;-><init>(Landroid/content/Context;)V
    :try_end_1b
    .catch Ljava/lang/Throwable; {:try_start_1b .. :try_end_1b} :catch_d

    .line 412
    .end local v125           #tsms:Lcom/android/server/TextServicesManagerService;
    .local v126, tsms:Lcom/android/server/TextServicesManagerService;
    :try_start_1c
    const-string v4, "textservices"

    move-object/from16 v0, v126

    invoke-static {v4, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_1c
    .catch Ljava/lang/Throwable; {:try_start_1c .. :try_end_1c} :catch_4b

    move-object/from16 v125, v126

    .line 418
    .end local v126           #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v125       #tsms:Lcom/android/server/TextServicesManagerService;
    :goto_17
    :try_start_1d
    const-string v4, "SystemServer"

    const-string v10, "NetworkStats Service"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 419
    new-instance v98, Lcom/android/server/net/NetworkStatsService;

    move-object/from16 v0, v98

    invoke-direct {v0, v5, v14, v8}, Lcom/android/server/net/NetworkStatsService;-><init>(Landroid/content/Context;Landroid/os/INetworkManagementService;Landroid/app/IAlarmManager;)V
    :try_end_1d
    .catch Ljava/lang/Throwable; {:try_start_1d .. :try_end_1d} :catch_e

    .line 420
    .end local v13           #networkStats:Lcom/android/server/net/NetworkStatsService;
    .local v98, networkStats:Lcom/android/server/net/NetworkStatsService;
    :try_start_1e
    const-string v4, "netstats"

    move-object/from16 v0, v98

    invoke-static {v4, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_1e
    .catch Ljava/lang/Throwable; {:try_start_1e .. :try_end_1e} :catch_4a

    move-object/from16 v13, v98

    .line 426
    .end local v98           #networkStats:Lcom/android/server/net/NetworkStatsService;
    .restart local v13       #networkStats:Lcom/android/server/net/NetworkStatsService;
    :goto_18
    :try_start_1f
    const-string v4, "SystemServer"

    const-string v10, "NetworkPolicy Service"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 427
    new-instance v9, Lcom/android/server/net/NetworkPolicyManagerService;

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v11

    move-object v10, v5

    move-object v12, v7

    invoke-direct/range {v9 .. v14}, Lcom/android/server/net/NetworkPolicyManagerService;-><init>(Landroid/content/Context;Landroid/app/IActivityManager;Landroid/os/IPowerManager;Landroid/net/INetworkStatsService;Landroid/os/INetworkManagementService;)V
    :try_end_1f
    .catch Ljava/lang/Throwable; {:try_start_1f .. :try_end_1f} :catch_f

    .line 430
    .end local v97           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .local v9, networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    :try_start_20
    const-string v4, "netpolicy"

    invoke-static {v4, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_20
    .catch Ljava/lang/Throwable; {:try_start_20 .. :try_end_20} :catch_49

    .line 436
    :goto_19
    :try_start_21
    const-string v4, "SystemServer"

    const-string v10, "Wi-Fi P2pService"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 437
    new-instance v140, Landroid/net/wifi/p2p/WifiP2pService;

    move-object/from16 v0, v140

    invoke-direct {v0, v5}, Landroid/net/wifi/p2p/WifiP2pService;-><init>(Landroid/content/Context;)V
    :try_end_21
    .catch Ljava/lang/Throwable; {:try_start_21 .. :try_end_21} :catch_10

    .line 438
    .end local v139           #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .local v140, wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    :try_start_22
    const-string v4, "wifip2p"

    move-object/from16 v0, v140

    invoke-static {v4, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_22
    .catch Ljava/lang/Throwable; {:try_start_22 .. :try_end_22} :catch_48

    move-object/from16 v139, v140

    .line 444
    .end local v140           #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .restart local v139       #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    :goto_1a
    :try_start_23
    const-string v4, "SystemServer"

    const-string v10, "Wi-Fi Service"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 445
    new-instance v138, Lcom/android/server/WifiService;

    move-object/from16 v0, v138

    invoke-direct {v0, v5}, Lcom/android/server/WifiService;-><init>(Landroid/content/Context;)V
    :try_end_23
    .catch Ljava/lang/Throwable; {:try_start_23 .. :try_end_23} :catch_11

    .line 446
    .end local v137           #wifi:Lcom/android/server/WifiService;
    .local v138, wifi:Lcom/android/server/WifiService;
    :try_start_24
    const-string v4, "wifi"

    move-object/from16 v0, v138

    invoke-static {v4, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_24
    .catch Ljava/lang/Throwable; {:try_start_24 .. :try_end_24} :catch_47

    move-object/from16 v137, v138

    .line 452
    .end local v138           #wifi:Lcom/android/server/WifiService;
    .restart local v137       #wifi:Lcom/android/server/WifiService;
    :goto_1b
    :try_start_25
    const-string v4, "SystemServer"

    const-string v10, "Connectivity Service"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 453
    new-instance v61, Lcom/android/server/ConnectivityService;

    move-object/from16 v0, v61

    invoke-direct {v0, v5, v14, v13, v9}, Lcom/android/server/ConnectivityService;-><init>(Landroid/content/Context;Landroid/os/INetworkManagementService;Landroid/net/INetworkStatsService;Landroid/net/INetworkPolicyManager;)V
    :try_end_25
    .catch Ljava/lang/Throwable; {:try_start_25 .. :try_end_25} :catch_12

    .line 455
    .end local v60           #connectivity:Lcom/android/server/ConnectivityService;
    .local v61, connectivity:Lcom/android/server/ConnectivityService;
    :try_start_26
    const-string v4, "connectivity"

    move-object/from16 v0, v61

    invoke-static {v4, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 456
    move-object/from16 v0, v61

    invoke-virtual {v13, v0}, Lcom/android/server/net/NetworkStatsService;->bindConnectivityManager(Landroid/net/IConnectivityManager;)V

    .line 457
    move-object/from16 v0, v61

    invoke-virtual {v9, v0}, Lcom/android/server/net/NetworkPolicyManagerService;->bindConnectivityManager(Landroid/net/IConnectivityManager;)V

    .line 458
    invoke-virtual/range {v137 .. v137}, Lcom/android/server/WifiService;->checkAndStartWifi()V

    .line 459
    invoke-virtual/range {v139 .. v139}, Landroid/net/wifi/p2p/WifiP2pService;->connectivityServiceReady()V
    :try_end_26
    .catch Ljava/lang/Throwable; {:try_start_26 .. :try_end_26} :catch_46

    move-object/from16 v60, v61

    .line 465
    .end local v61           #connectivity:Lcom/android/server/ConnectivityService;
    .restart local v60       #connectivity:Lcom/android/server/ConnectivityService;
    :goto_1c
    :try_start_27
    const-string v4, "SystemServer"

    const-string v10, "Network Service Discovery Service"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 466
    invoke-static {v5}, Lcom/android/server/NsdService;->create(Landroid/content/Context;)Lcom/android/server/NsdService;

    move-result-object v119

    .line 467
    const-string v4, "servicediscovery"

    move-object/from16 v0, v119

    invoke-static {v4, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_27
    .catch Ljava/lang/Throwable; {:try_start_27 .. :try_end_27} :catch_13

    .line 474
    :goto_1d
    :try_start_28
    const-string v4, "SystemServer"

    const-string v10, "Throttle Service"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 475
    new-instance v124, Lcom/android/server/ThrottleService;

    move-object/from16 v0, v124

    invoke-direct {v0, v5}, Lcom/android/server/ThrottleService;-><init>(Landroid/content/Context;)V
    :try_end_28
    .catch Ljava/lang/Throwable; {:try_start_28 .. :try_end_28} :catch_14

    .line 476
    .end local v123           #throttle:Lcom/android/server/ThrottleService;
    .local v124, throttle:Lcom/android/server/ThrottleService;
    :try_start_29
    const-string v4, "throttle"

    move-object/from16 v0, v124

    invoke-static {v4, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_29
    .catch Ljava/lang/Throwable; {:try_start_29 .. :try_end_29} :catch_45

    move-object/from16 v123, v124

    .line 483
    .end local v124           #throttle:Lcom/android/server/ThrottleService;
    .restart local v123       #throttle:Lcom/android/server/ThrottleService;
    :goto_1e
    :try_start_2a
    const-string v4, "SystemServer"

    const-string v10, "FM receiver Service"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 484
    const-string v4, "fm_receiver"

    new-instance v10, Lcom/stericsson/hardware/fm/FmReceiverService;

    invoke-direct {v10, v5}, Lcom/stericsson/hardware/fm/FmReceiverService;-><init>(Landroid/content/Context;)V

    invoke-static {v4, v10}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2a
    .catch Ljava/lang/Throwable; {:try_start_2a .. :try_end_2a} :catch_15

    .line 491
    :goto_1f
    :try_start_2b
    const-string v4, "SystemServer"

    const-string v10, "FM transmitter Service"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 492
    const-string v4, "fm_transmitter"

    new-instance v10, Lcom/stericsson/hardware/fm/FmTransmitterService;

    invoke-direct {v10, v5}, Lcom/stericsson/hardware/fm/FmTransmitterService;-><init>(Landroid/content/Context;)V

    invoke-static {v4, v10}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2b
    .catch Ljava/lang/Throwable; {:try_start_2b .. :try_end_2b} :catch_16

    .line 498
    :goto_20
    :try_start_2c
    const-string v4, "SystemServer"

    const-string v10, "UpdateLock Service"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 499
    const-string v4, "updatelock"

    new-instance v10, Lcom/android/server/UpdateLockService;

    invoke-direct {v10, v5}, Lcom/android/server/UpdateLockService;-><init>(Landroid/content/Context;)V

    invoke-static {v4, v10}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2c
    .catch Ljava/lang/Throwable; {:try_start_2c .. :try_end_2c} :catch_17

    .line 510
    :goto_21
    if-eqz v95, :cond_4

    .line 511
    invoke-virtual/range {v95 .. v95}, Lcom/android/server/MountService;->waitForAsecScan()V

    .line 515
    :cond_4
    :try_start_2d
    const-string v4, "SystemServer"

    const-string v10, "Profile Manager"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 516
    new-instance v109, Lcom/android/server/ProfileManagerService;

    move-object/from16 v0, v109

    invoke-direct {v0, v5}, Lcom/android/server/ProfileManagerService;-><init>(Landroid/content/Context;)V
    :try_end_2d
    .catch Ljava/lang/Throwable; {:try_start_2d .. :try_end_2d} :catch_18

    .line 517
    .end local v108           #profile:Lcom/android/server/ProfileManagerService;
    .local v109, profile:Lcom/android/server/ProfileManagerService;
    :try_start_2e
    const-string v4, "profile"

    move-object/from16 v0, v109

    invoke-static {v4, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2e
    .catch Ljava/lang/Throwable; {:try_start_2e .. :try_end_2e} :catch_44

    move-object/from16 v108, v109

    .line 523
    .end local v109           #profile:Lcom/android/server/ProfileManagerService;
    .restart local v108       #profile:Lcom/android/server/ProfileManagerService;
    :goto_22
    if-eqz v43, :cond_5

    .line 524
    :try_start_2f
    invoke-virtual/range {v43 .. v43}, Landroid/accounts/AccountManagerService;->systemReady()V
    :try_end_2f
    .catch Ljava/lang/Throwable; {:try_start_2f .. :try_end_2f} :catch_19

    .line 530
    :cond_5
    :goto_23
    if-eqz v62, :cond_6

    .line 531
    :try_start_30
    invoke-virtual/range {v62 .. v62}, Landroid/content/ContentService;->systemReady()V
    :try_end_30
    .catch Ljava/lang/Throwable; {:try_start_30 .. :try_end_30} :catch_1a

    .line 537
    :cond_6
    :goto_24
    :try_start_31
    const-string v4, "SystemServer"

    const-string v10, "Notification Manager"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 538
    new-instance v102, Lcom/android/server/NotificationManagerService;

    move-object/from16 v0, v102

    move-object/from16 v1, v121

    move-object/from16 v2, v87

    invoke-direct {v0, v5, v1, v2}, Lcom/android/server/NotificationManagerService;-><init>(Landroid/content/Context;Lcom/android/server/StatusBarManagerService;Lcom/android/server/LightsService;)V
    :try_end_31
    .catch Ljava/lang/Throwable; {:try_start_31 .. :try_end_31} :catch_1b

    .line 539
    .end local v101           #notification:Lcom/android/server/NotificationManagerService;
    .local v102, notification:Lcom/android/server/NotificationManagerService;
    :try_start_32
    const-string v4, "notification"

    move-object/from16 v0, v102

    invoke-static {v4, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 540
    move-object/from16 v0, v102

    invoke-virtual {v9, v0}, Lcom/android/server/net/NetworkPolicyManagerService;->bindNotificationManager(Landroid/app/INotificationManager;)V
    :try_end_32
    .catch Ljava/lang/Throwable; {:try_start_32 .. :try_end_32} :catch_43

    move-object/from16 v101, v102

    .line 546
    .end local v102           #notification:Lcom/android/server/NotificationManagerService;
    .restart local v101       #notification:Lcom/android/server/NotificationManagerService;
    :goto_25
    :try_start_33
    const-string v4, "SystemServer"

    const-string v10, "Device Storage Monitor"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 547
    const-string v4, "devicestoragemonitor"

    new-instance v10, Lcom/android/server/DeviceStorageMonitorService;

    invoke-direct {v10, v5}, Lcom/android/server/DeviceStorageMonitorService;-><init>(Landroid/content/Context;)V

    invoke-static {v4, v10}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_33
    .catch Ljava/lang/Throwable; {:try_start_33 .. :try_end_33} :catch_1c

    .line 554
    :goto_26
    :try_start_34
    const-string v4, "SystemServer"

    const-string v10, "Location Manager"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 555
    new-instance v91, Lcom/android/server/LocationManagerService;

    move-object/from16 v0, v91

    invoke-direct {v0, v5}, Lcom/android/server/LocationManagerService;-><init>(Landroid/content/Context;)V
    :try_end_34
    .catch Ljava/lang/Throwable; {:try_start_34 .. :try_end_34} :catch_1d

    .line 556
    .end local v90           #location:Lcom/android/server/LocationManagerService;
    .local v91, location:Lcom/android/server/LocationManagerService;
    :try_start_35
    const-string v4, "location"

    move-object/from16 v0, v91

    invoke-static {v4, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_35
    .catch Ljava/lang/Throwable; {:try_start_35 .. :try_end_35} :catch_42

    move-object/from16 v90, v91

    .line 562
    .end local v91           #location:Lcom/android/server/LocationManagerService;
    .restart local v90       #location:Lcom/android/server/LocationManagerService;
    :goto_27
    :try_start_36
    const-string v4, "SystemServer"

    const-string v10, "Country Detector"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 563
    new-instance v64, Lcom/android/server/CountryDetectorService;

    move-object/from16 v0, v64

    invoke-direct {v0, v5}, Lcom/android/server/CountryDetectorService;-><init>(Landroid/content/Context;)V
    :try_end_36
    .catch Ljava/lang/Throwable; {:try_start_36 .. :try_end_36} :catch_1e

    .line 564
    .end local v63           #countryDetector:Lcom/android/server/CountryDetectorService;
    .local v64, countryDetector:Lcom/android/server/CountryDetectorService;
    :try_start_37
    const-string v4, "country_detector"

    move-object/from16 v0, v64

    invoke-static {v4, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_37
    .catch Ljava/lang/Throwable; {:try_start_37 .. :try_end_37} :catch_41

    move-object/from16 v63, v64

    .line 570
    .end local v64           #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v63       #countryDetector:Lcom/android/server/CountryDetectorService;
    :goto_28
    :try_start_38
    const-string v4, "SystemServer"

    const-string v10, "Search Service"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 571
    const-string v4, "search"

    new-instance v10, Landroid/server/search/SearchManagerService;

    invoke-direct {v10, v5}, Landroid/server/search/SearchManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v4, v10}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_38
    .catch Ljava/lang/Throwable; {:try_start_38 .. :try_end_38} :catch_1f

    .line 578
    :goto_29
    :try_start_39
    const-string v4, "SystemServer"

    const-string v10, "DropBox Service"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 579
    const-string v4, "dropbox"

    new-instance v10, Lcom/android/server/DropBoxManagerService;

    new-instance v11, Ljava/io/File;

    const-string v12, "/data/system/dropbox"

    invoke-direct {v11, v12}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v10, v5, v11}, Lcom/android/server/DropBoxManagerService;-><init>(Landroid/content/Context;Ljava/io/File;)V

    invoke-static {v4, v10}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_39
    .catch Ljava/lang/Throwable; {:try_start_39 .. :try_end_39} :catch_20

    .line 585
    :goto_2a
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v10, 0x1110029

    invoke-virtual {v4, v10}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 588
    :try_start_3a
    const-string v4, "SystemServer"

    const-string v10, "Wallpaper Service"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 589
    if-nez v17, :cond_7

    .line 590
    new-instance v136, Lcom/android/server/WallpaperManagerService;

    move-object/from16 v0, v136

    invoke-direct {v0, v5}, Lcom/android/server/WallpaperManagerService;-><init>(Landroid/content/Context;)V
    :try_end_3a
    .catch Ljava/lang/Throwable; {:try_start_3a .. :try_end_3a} :catch_21

    .line 591
    .end local v135           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .local v136, wallpaper:Lcom/android/server/WallpaperManagerService;
    :try_start_3b
    const-string v4, "wallpaper"

    move-object/from16 v0, v136

    invoke-static {v4, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_3b
    .catch Ljava/lang/Throwable; {:try_start_3b .. :try_end_3b} :catch_40

    move-object/from16 v135, v136

    .line 598
    .end local v136           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v135       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :cond_7
    :goto_2b
    const-string v4, "0"

    const-string v10, "system_init.startaudioservice"

    invoke-static {v10}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v4, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_8

    .line 600
    :try_start_3c
    const-string v4, "SystemServer"

    const-string v10, "Audio Service"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 601
    const-string v4, "audio"

    new-instance v10, Landroid/media/AudioService;

    invoke-direct {v10, v5}, Landroid/media/AudioService;-><init>(Landroid/content/Context;)V

    invoke-static {v4, v10}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_3c
    .catch Ljava/lang/Throwable; {:try_start_3c .. :try_end_3c} :catch_22

    .line 608
    :cond_8
    :goto_2c
    :try_start_3d
    const-string v4, "SystemServer"

    const-string v10, "Dock Observer"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 610
    new-instance v70, Lcom/android/server/DockObserver;

    move-object/from16 v0, v70

    invoke-direct {v0, v5, v7}, Lcom/android/server/DockObserver;-><init>(Landroid/content/Context;Lcom/android/server/PowerManagerService;)V
    :try_end_3d
    .catch Ljava/lang/Throwable; {:try_start_3d .. :try_end_3d} :catch_23

    .end local v69           #dock:Lcom/android/server/DockObserver;
    .local v70, dock:Lcom/android/server/DockObserver;
    move-object/from16 v69, v70

    .line 616
    .end local v70           #dock:Lcom/android/server/DockObserver;
    .restart local v69       #dock:Lcom/android/server/DockObserver;
    :goto_2d
    if-eqz v78, :cond_9

    .line 617
    :try_start_3e
    const-string v4, "SystemServer"

    const-string v10, "Rotation Switch Observer"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 619
    new-instance v115, Lcom/android/server/RotationSwitchObserver;

    move-object/from16 v0, v115

    invoke-direct {v0, v5}, Lcom/android/server/RotationSwitchObserver;-><init>(Landroid/content/Context;)V
    :try_end_3e
    .catch Ljava/lang/Throwable; {:try_start_3e .. :try_end_3e} :catch_24

    .end local v114           #rotateSwitch:Lcom/android/server/RotationSwitchObserver;
    .local v115, rotateSwitch:Lcom/android/server/RotationSwitchObserver;
    move-object/from16 v114, v115

    .line 626
    .end local v115           #rotateSwitch:Lcom/android/server/RotationSwitchObserver;
    .restart local v114       #rotateSwitch:Lcom/android/server/RotationSwitchObserver;
    :cond_9
    :goto_2e
    :try_start_3f
    const-string v4, "SystemServer"

    const-string v10, "Wired Accessory Observer"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 628
    new-instance v4, Lcom/android/server/WiredAccessoryObserver;

    invoke-direct {v4, v5}, Lcom/android/server/WiredAccessoryObserver;-><init>(Landroid/content/Context;)V
    :try_end_3f
    .catch Ljava/lang/Throwable; {:try_start_3f .. :try_end_3f} :catch_25

    .line 634
    :goto_2f
    :try_start_40
    const-string v4, "SystemServer"

    const-string v10, "USB Service"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 636
    new-instance v130, Lcom/android/server/usb/UsbService;

    move-object/from16 v0, v130

    invoke-direct {v0, v5}, Lcom/android/server/usb/UsbService;-><init>(Landroid/content/Context;)V
    :try_end_40
    .catch Ljava/lang/Throwable; {:try_start_40 .. :try_end_40} :catch_26

    .line 637
    .end local v129           #usb:Lcom/android/server/usb/UsbService;
    .local v130, usb:Lcom/android/server/usb/UsbService;
    :try_start_41
    const-string v4, "usb"

    move-object/from16 v0, v130

    invoke-static {v4, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_41
    .catch Ljava/lang/Throwable; {:try_start_41 .. :try_end_41} :catch_3f

    move-object/from16 v129, v130

    .line 643
    .end local v130           #usb:Lcom/android/server/usb/UsbService;
    .restart local v129       #usb:Lcom/android/server/usb/UsbService;
    :goto_30
    :try_start_42
    const-string v4, "SystemServer"

    const-string v10, "Serial Service"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 645
    new-instance v117, Lcom/android/server/SerialService;

    move-object/from16 v0, v117

    invoke-direct {v0, v5}, Lcom/android/server/SerialService;-><init>(Landroid/content/Context;)V
    :try_end_42
    .catch Ljava/lang/Throwable; {:try_start_42 .. :try_end_42} :catch_27

    .line 646
    .end local v116           #serial:Lcom/android/server/SerialService;
    .local v117, serial:Lcom/android/server/SerialService;
    :try_start_43
    const-string v4, "serial"

    move-object/from16 v0, v117

    invoke-static {v4, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_43
    .catch Ljava/lang/Throwable; {:try_start_43 .. :try_end_43} :catch_3e

    move-object/from16 v116, v117

    .line 652
    .end local v117           #serial:Lcom/android/server/SerialService;
    .restart local v116       #serial:Lcom/android/server/SerialService;
    :goto_31
    :try_start_44
    const-string v4, "SystemServer"

    const-string v10, "UI Mode Manager Service"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 654
    new-instance v128, Lcom/android/server/UiModeManagerService;

    move-object/from16 v0, v128

    invoke-direct {v0, v5}, Lcom/android/server/UiModeManagerService;-><init>(Landroid/content/Context;)V
    :try_end_44
    .catch Ljava/lang/Throwable; {:try_start_44 .. :try_end_44} :catch_28

    .end local v127           #uiMode:Lcom/android/server/UiModeManagerService;
    .local v128, uiMode:Lcom/android/server/UiModeManagerService;
    move-object/from16 v127, v128

    .line 660
    .end local v128           #uiMode:Lcom/android/server/UiModeManagerService;
    .restart local v127       #uiMode:Lcom/android/server/UiModeManagerService;
    :goto_32
    :try_start_45
    const-string v4, "SystemServer"

    const-string v10, "Backup Service"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 661
    const-string v4, "backup"

    new-instance v10, Lcom/android/server/BackupManagerService;

    invoke-direct {v10, v5}, Lcom/android/server/BackupManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v4, v10}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_45
    .catch Ljava/lang/Throwable; {:try_start_45 .. :try_end_45} :catch_29

    .line 668
    :goto_33
    :try_start_46
    const-string v4, "SystemServer"

    const-string v10, "AppWidget Service"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 669
    new-instance v47, Lcom/android/server/AppWidgetService;

    move-object/from16 v0, v47

    invoke-direct {v0, v5}, Lcom/android/server/AppWidgetService;-><init>(Landroid/content/Context;)V
    :try_end_46
    .catch Ljava/lang/Throwable; {:try_start_46 .. :try_end_46} :catch_2a

    .line 670
    .end local v46           #appWidget:Lcom/android/server/AppWidgetService;
    .local v47, appWidget:Lcom/android/server/AppWidgetService;
    :try_start_47
    const-string v4, "appwidget"

    move-object/from16 v0, v47

    invoke-static {v4, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_47
    .catch Ljava/lang/Throwable; {:try_start_47 .. :try_end_47} :catch_3d

    move-object/from16 v46, v47

    .line 676
    .end local v47           #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v46       #appWidget:Lcom/android/server/AppWidgetService;
    :goto_34
    :try_start_48
    const-string v4, "SystemServer"

    const-string v10, "Recognition Service"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 677
    new-instance v113, Lcom/android/server/RecognitionManagerService;

    move-object/from16 v0, v113

    invoke-direct {v0, v5}, Lcom/android/server/RecognitionManagerService;-><init>(Landroid/content/Context;)V
    :try_end_48
    .catch Ljava/lang/Throwable; {:try_start_48 .. :try_end_48} :catch_2b

    .end local v112           #recognition:Lcom/android/server/RecognitionManagerService;
    .local v113, recognition:Lcom/android/server/RecognitionManagerService;
    move-object/from16 v112, v113

    .line 683
    .end local v113           #recognition:Lcom/android/server/RecognitionManagerService;
    .restart local v112       #recognition:Lcom/android/server/RecognitionManagerService;
    :goto_35
    :try_start_49
    const-string v4, "SystemServer"

    const-string v10, "DiskStats Service"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 684
    const-string v4, "diskstats"

    new-instance v10, Lcom/android/server/DiskStatsService;

    invoke-direct {v10, v5}, Lcom/android/server/DiskStatsService;-><init>(Landroid/content/Context;)V

    invoke-static {v4, v10}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_49
    .catch Ljava/lang/Throwable; {:try_start_49 .. :try_end_49} :catch_2c

    .line 694
    :goto_36
    :try_start_4a
    const-string v4, "SystemServer"

    const-string v10, "SamplingProfiler Service"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 695
    const-string v4, "samplingprofiler"

    new-instance v10, Lcom/android/server/SamplingProfilerService;

    invoke-direct {v10, v5}, Lcom/android/server/SamplingProfilerService;-><init>(Landroid/content/Context;)V

    invoke-static {v4, v10}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_4a
    .catch Ljava/lang/Throwable; {:try_start_4a .. :try_end_4a} :catch_2d

    .line 702
    :goto_37
    :try_start_4b
    const-string v4, "SystemServer"

    const-string v10, "NetworkTimeUpdateService"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 703
    new-instance v100, Lcom/android/server/NetworkTimeUpdateService;

    move-object/from16 v0, v100

    invoke-direct {v0, v5}, Lcom/android/server/NetworkTimeUpdateService;-><init>(Landroid/content/Context;)V
    :try_end_4b
    .catch Ljava/lang/Throwable; {:try_start_4b .. :try_end_4b} :catch_2e

    .end local v99           #networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    .local v100, networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    move-object/from16 v99, v100

    .line 709
    .end local v100           #networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    .restart local v99       #networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    :goto_38
    :try_start_4c
    const-string v4, "SystemServer"

    const-string v10, "CommonTimeManagementService"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 710
    new-instance v58, Lcom/android/server/CommonTimeManagementService;

    move-object/from16 v0, v58

    invoke-direct {v0, v5}, Lcom/android/server/CommonTimeManagementService;-><init>(Landroid/content/Context;)V
    :try_end_4c
    .catch Ljava/lang/Throwable; {:try_start_4c .. :try_end_4c} :catch_2f

    .line 711
    .end local v57           #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    .local v58, commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    :try_start_4d
    const-string v4, "commontime_management"

    move-object/from16 v0, v58

    invoke-static {v4, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_4d
    .catch Ljava/lang/Throwable; {:try_start_4d .. :try_end_4d} :catch_3c

    move-object/from16 v57, v58

    .line 716
    .end local v58           #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    .restart local v57       #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    :goto_39
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v10, 0x1070011

    invoke-virtual {v4, v10}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v131

    .line 719
    .local v131, vendorServices:[Ljava/lang/String;
    if-eqz v131, :cond_17

    move-object/from16 v0, v131

    array-length v4, v0

    if-lez v4, :cond_17

    .line 721
    new-instance v4, Landroid/content/ContextWrapper;

    invoke-direct {v4, v5}, Landroid/content/ContextWrapper;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4}, Landroid/content/ContextWrapper;->getCacheDir()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v55

    .line 722
    .local v55, cachePath:Ljava/lang/String;
    invoke-static {}, Ljava/lang/ClassLoader;->getSystemClassLoader()Ljava/lang/ClassLoader;

    move-result-object v104

    .line 724
    .local v104, parentLoader:Ljava/lang/ClassLoader;
    move-object/from16 v48, v131

    .local v48, arr$:[Ljava/lang/String;
    move-object/from16 v0, v48

    array-length v0, v0

    move/from16 v86, v0

    .local v86, len$:I
    const/16 v79, 0x0

    .local v79, i$:I
    :goto_3a
    move/from16 v0, v79

    move/from16 v1, v86

    if-ge v0, v1, :cond_17

    aget-object v118, v48, v79

    .line 725
    .local v118, service:Ljava/lang/String;
    const-string v4, ":"

    move-object/from16 v0, v118

    invoke-virtual {v0, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v105

    .line 726
    .local v105, parts:[Ljava/lang/String;
    move-object/from16 v0, v105

    array-length v4, v0

    const/4 v10, 0x2

    if-eq v4, v10, :cond_16

    .line 727
    const-string v4, "SystemServer"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Found invalid vendor service "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    move-object/from16 v0, v118

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v4, v10}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 724
    :goto_3b
    add-int/lit8 v79, v79, 0x1

    goto :goto_3a

    .line 123
    .end local v5           #context:Landroid/content/Context;
    .end local v6           #battery:Lcom/android/server/BatteryService;
    .end local v7           #power:Lcom/android/server/PowerManagerService;
    .end local v8           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v9           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .end local v13           #networkStats:Lcom/android/server/net/NetworkStatsService;
    .end local v14           #networkManagement:Lcom/android/server/NetworkManagementService;
    .end local v17           #headless:Z
    .end local v43           #accountManager:Landroid/accounts/AccountManagerService;
    .end local v46           #appWidget:Lcom/android/server/AppWidgetService;
    .end local v48           #arr$:[Ljava/lang/String;
    .end local v50           #bluetooth:Landroid/server/BluetoothService;
    .end local v52           #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    .end local v55           #cachePath:Ljava/lang/String;
    .end local v57           #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    .end local v60           #connectivity:Lcom/android/server/ConnectivityService;
    .end local v62           #contentService:Landroid/content/ContentService;
    .end local v63           #countryDetector:Lcom/android/server/CountryDetectorService;
    .end local v67           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .end local v69           #dock:Lcom/android/server/DockObserver;
    .end local v71           #dreamy:Landroid/service/dreams/DreamManagerService;
    .end local v74           #factoryTest:I
    .end local v75           #factoryTestStr:Ljava/lang/String;
    .end local v78           #hasRotationLock:Z
    .end local v79           #i$:I
    .end local v80           #imm:Lcom/android/server/InputMethodManagerService;
    .end local v82           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v86           #len$:I
    .end local v87           #lights:Lcom/android/server/LightsService;
    .end local v90           #location:Lcom/android/server/LocationManagerService;
    .end local v92           #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    .end local v95           #mountService:Lcom/android/server/MountService;
    .end local v99           #networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    .end local v101           #notification:Lcom/android/server/NotificationManagerService;
    .end local v104           #parentLoader:Ljava/lang/ClassLoader;
    .end local v105           #parts:[Ljava/lang/String;
    .end local v106           #pm:Landroid/content/pm/IPackageManager;
    .end local v108           #profile:Lcom/android/server/ProfileManagerService;
    .end local v112           #recognition:Lcom/android/server/RecognitionManagerService;
    .end local v114           #rotateSwitch:Lcom/android/server/RotationSwitchObserver;
    .end local v116           #serial:Lcom/android/server/SerialService;
    .end local v118           #service:Ljava/lang/String;
    .end local v119           #serviceDiscovery:Lcom/android/server/NsdService;
    .end local v121           #statusBar:Lcom/android/server/StatusBarManagerService;
    .end local v123           #throttle:Lcom/android/server/ThrottleService;
    .end local v125           #tsms:Lcom/android/server/TextServicesManagerService;
    .end local v127           #uiMode:Lcom/android/server/UiModeManagerService;
    .end local v129           #usb:Lcom/android/server/usb/UsbService;
    .end local v131           #vendorServices:[Ljava/lang/String;
    .end local v132           #vibrator:Lcom/android/server/VibratorService;
    .end local v135           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .end local v137           #wifi:Lcom/android/server/WifiService;
    .end local v139           #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .end local v141           #wm:Lcom/android/server/wm/WindowManagerService;
    :cond_a
    const/16 v111, 0x0

    goto/16 :goto_0

    .line 129
    .restart local v111       #reboot:Z
    :cond_b
    const/16 v110, 0x0

    .restart local v110       #reason:Ljava/lang/String;
    goto/16 :goto_1

    .line 137
    .end local v110           #reason:Ljava/lang/String;
    .end local v111           #reboot:Z
    .restart local v75       #factoryTestStr:Ljava/lang/String;
    :cond_c
    invoke-static/range {v75 .. v75}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v74

    goto/16 :goto_2

    .line 199
    .restart local v5       #context:Landroid/content/Context;
    .restart local v7       #power:Lcom/android/server/PowerManagerService;
    .restart local v13       #networkStats:Lcom/android/server/net/NetworkStatsService;
    .restart local v14       #networkManagement:Lcom/android/server/NetworkManagementService;
    .restart local v17       #headless:Z
    .restart local v43       #accountManager:Landroid/accounts/AccountManagerService;
    .restart local v45       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v49       #battery:Lcom/android/server/BatteryService;
    .restart local v50       #bluetooth:Landroid/server/BluetoothService;
    .restart local v52       #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    .restart local v57       #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    .restart local v60       #connectivity:Lcom/android/server/ConnectivityService;
    .restart local v62       #contentService:Landroid/content/ContentService;
    .restart local v65       #cryptState:Ljava/lang/String;
    .restart local v69       #dock:Lcom/android/server/DockObserver;
    .restart local v74       #factoryTest:I
    .restart local v82       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v87       #lights:Lcom/android/server/LightsService;
    .restart local v97       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v99       #networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    .restart local v103       #onlyCore:Z
    .restart local v106       #pm:Landroid/content/pm/IPackageManager;
    .restart local v112       #recognition:Lcom/android/server/RecognitionManagerService;
    .restart local v114       #rotateSwitch:Lcom/android/server/RotationSwitchObserver;
    .restart local v116       #serial:Lcom/android/server/SerialService;
    .restart local v119       #serviceDiscovery:Lcom/android/server/NsdService;
    .restart local v123       #throttle:Lcom/android/server/ThrottleService;
    .restart local v127       #uiMode:Lcom/android/server/UiModeManagerService;
    .restart local v129       #usb:Lcom/android/server/usb/UsbService;
    .restart local v132       #vibrator:Lcom/android/server/VibratorService;
    .restart local v137       #wifi:Lcom/android/server/WifiService;
    .restart local v139       #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .restart local v141       #wm:Lcom/android/server/wm/WindowManagerService;
    :cond_d
    :try_start_4e
    const-string v4, "1"

    move-object/from16 v0, v65

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 200
    const-string v4, "SystemServer"

    const-string v10, "Device encrypted - only parsing core apps"

    invoke-static {v4, v10}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 201
    const/16 v103, 0x1

    goto/16 :goto_3

    .line 204
    :cond_e
    const/4 v4, 0x0

    goto/16 :goto_4

    .line 222
    .restart local v77       #firstBoot:Z
    :catch_0
    move-exception v73

    .line 223
    .local v73, e:Ljava/lang/Throwable;
    :goto_3c
    const-string v4, "SystemServer"

    const-string v10, "Failure starting Account Manager"

    move-object/from16 v0, v73

    invoke-static {v4, v10, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_4e
    .catch Ljava/lang/RuntimeException; {:try_start_4e .. :try_end_4e} :catch_1

    goto/16 :goto_6

    .line 293
    .end local v65           #cryptState:Ljava/lang/String;
    .end local v73           #e:Ljava/lang/Throwable;
    .end local v77           #firstBoot:Z
    .end local v103           #onlyCore:Z
    :catch_1
    move-exception v73

    move-object/from16 v8, v45

    .end local v45           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v8       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v6, v49

    .line 294
    .end local v49           #battery:Lcom/android/server/BatteryService;
    .restart local v6       #battery:Lcom/android/server/BatteryService;
    .local v73, e:Ljava/lang/RuntimeException;
    :goto_3d
    const-string v4, "System"

    const-string v10, "******************************************"

    invoke-static {v4, v10}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 295
    const-string v4, "System"

    const-string v10, "************ Failure starting core service"

    move-object/from16 v0, v73

    invoke-static {v4, v10, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_b

    .line 227
    .end local v6           #battery:Lcom/android/server/BatteryService;
    .end local v8           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v73           #e:Ljava/lang/RuntimeException;
    .restart local v45       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v49       #battery:Lcom/android/server/BatteryService;
    .restart local v65       #cryptState:Ljava/lang/String;
    .restart local v77       #firstBoot:Z
    .restart local v103       #onlyCore:Z
    :cond_f
    const/4 v4, 0x0

    goto/16 :goto_7

    .line 257
    .end local v45           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v49           #battery:Lcom/android/server/BatteryService;
    .end local v87           #lights:Lcom/android/server/LightsService;
    .end local v132           #vibrator:Lcom/android/server/VibratorService;
    .restart local v6       #battery:Lcom/android/server/BatteryService;
    .restart local v8       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v88       #lights:Lcom/android/server/LightsService;
    .restart local v133       #vibrator:Lcom/android/server/VibratorService;
    :cond_10
    const/4 v4, 0x0

    move v10, v4

    goto/16 :goto_8

    :cond_11
    const/4 v4, 0x0

    goto/16 :goto_9

    .line 271
    :cond_12
    const/4 v4, 0x1

    move/from16 v0, v74

    if-ne v0, v4, :cond_13

    .line 272
    :try_start_4f
    const-string v4, "SystemServer"

    const-string v10, "No Bluetooth Service (factory test)"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_a

    .line 293
    :catch_2
    move-exception v73

    move-object/from16 v132, v133

    .end local v133           #vibrator:Lcom/android/server/VibratorService;
    .restart local v132       #vibrator:Lcom/android/server/VibratorService;
    move-object/from16 v87, v88

    .end local v88           #lights:Lcom/android/server/LightsService;
    .restart local v87       #lights:Lcom/android/server/LightsService;
    goto :goto_3d

    .line 274
    .end local v87           #lights:Lcom/android/server/LightsService;
    .end local v132           #vibrator:Lcom/android/server/VibratorService;
    .restart local v88       #lights:Lcom/android/server/LightsService;
    .restart local v133       #vibrator:Lcom/android/server/VibratorService;
    :cond_13
    const-string v4, "SystemServer"

    const-string v10, "Bluetooth Service"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 275
    new-instance v51, Landroid/server/BluetoothService;

    move-object/from16 v0, v51

    invoke-direct {v0, v5}, Landroid/server/BluetoothService;-><init>(Landroid/content/Context;)V
    :try_end_4f
    .catch Ljava/lang/RuntimeException; {:try_start_4f .. :try_end_4f} :catch_2

    .line 276
    .end local v50           #bluetooth:Landroid/server/BluetoothService;
    .local v51, bluetooth:Landroid/server/BluetoothService;
    :try_start_50
    const-string v4, "bluetooth"

    move-object/from16 v0, v51

    invoke-static {v4, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 277
    invoke-virtual/range {v51 .. v51}, Landroid/server/BluetoothService;->initAfterRegistration()V

    .line 279
    const-string v4, "0"

    const-string v10, "system_init.startaudioservice"

    invoke-static {v10}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v4, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_14

    .line 280
    new-instance v53, Landroid/server/BluetoothA2dpService;

    move-object/from16 v0, v53

    move-object/from16 v1, v51

    invoke-direct {v0, v5, v1}, Landroid/server/BluetoothA2dpService;-><init>(Landroid/content/Context;Landroid/server/BluetoothService;)V
    :try_end_50
    .catch Ljava/lang/RuntimeException; {:try_start_50 .. :try_end_50} :catch_57

    .line 281
    .end local v52           #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    .local v53, bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    :try_start_51
    const-string v4, "bluetooth_a2dp"

    move-object/from16 v0, v53

    invoke-static {v4, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 283
    invoke-virtual/range {v51 .. v51}, Landroid/server/BluetoothService;->initAfterA2dpRegistration()V
    :try_end_51
    .catch Ljava/lang/RuntimeException; {:try_start_51 .. :try_end_51} :catch_58

    move-object/from16 v52, v53

    .line 286
    .end local v53           #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    .restart local v52       #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    :cond_14
    :try_start_52
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/ServerThread;->mContentResolver:Landroid/content/ContentResolver;

    const-string v10, "bluetooth_on"

    const/4 v11, 0x0

    invoke-static {v4, v10, v11}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v54

    .line 288
    .local v54, bluetoothOn:I
    if-eqz v54, :cond_15

    .line 289
    invoke-virtual/range {v51 .. v51}, Landroid/server/BluetoothService;->enable()Z
    :try_end_52
    .catch Ljava/lang/RuntimeException; {:try_start_52 .. :try_end_52} :catch_57

    :cond_15
    move-object/from16 v50, v51

    .end local v51           #bluetooth:Landroid/server/BluetoothService;
    .restart local v50       #bluetooth:Landroid/server/BluetoothService;
    goto/16 :goto_a

    .line 320
    .end local v54           #bluetoothOn:I
    .end local v65           #cryptState:Ljava/lang/String;
    .end local v77           #firstBoot:Z
    .end local v88           #lights:Lcom/android/server/LightsService;
    .end local v103           #onlyCore:Z
    .end local v133           #vibrator:Lcom/android/server/VibratorService;
    .restart local v46       #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v63       #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v67       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v71       #dreamy:Landroid/service/dreams/DreamManagerService;
    .restart local v78       #hasRotationLock:Z
    .restart local v80       #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v87       #lights:Lcom/android/server/LightsService;
    .restart local v90       #location:Lcom/android/server/LocationManagerService;
    .restart local v92       #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    .restart local v101       #notification:Lcom/android/server/NotificationManagerService;
    .restart local v108       #profile:Lcom/android/server/ProfileManagerService;
    .restart local v121       #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v125       #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v132       #vibrator:Lcom/android/server/VibratorService;
    .restart local v135       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :catch_3
    move-exception v73

    .line 321
    .local v73, e:Ljava/lang/Throwable;
    :goto_3e
    const-string v4, "starting Input Manager Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_c

    .line 328
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_4
    move-exception v73

    .line 329
    .restart local v73       #e:Ljava/lang/Throwable;
    const-string v4, "starting Accessibility Manager"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_d

    .line 335
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_5
    move-exception v73

    .line 336
    .restart local v73       #e:Ljava/lang/Throwable;
    const-string v4, "making display ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_e

    .line 341
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_6
    move-exception v73

    .line 342
    .restart local v73       #e:Ljava/lang/Throwable;
    const-string v4, "performing boot dexopt"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_f

    .line 364
    .end local v73           #e:Ljava/lang/Throwable;
    .restart local v95       #mountService:Lcom/android/server/MountService;
    :catch_7
    move-exception v73

    .line 365
    .restart local v73       #e:Ljava/lang/Throwable;
    :goto_3f
    const-string v4, "starting Mount Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_11

    .line 373
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_8
    move-exception v73

    .line 374
    .restart local v73       #e:Ljava/lang/Throwable;
    :goto_40
    const-string v4, "starting LockSettingsService service"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_12

    .line 381
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_9
    move-exception v73

    .line 382
    .restart local v73       #e:Ljava/lang/Throwable;
    :goto_41
    const-string v4, "starting DevicePolicyService"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_13

    .line 389
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_a
    move-exception v73

    .line 390
    .restart local v73       #e:Ljava/lang/Throwable;
    :goto_42
    const-string v4, "starting StatusBarManagerService"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_14

    .line 397
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_b
    move-exception v73

    .line 398
    .restart local v73       #e:Ljava/lang/Throwable;
    const-string v4, "starting Clipboard Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_15

    .line 405
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_c
    move-exception v73

    .line 406
    .restart local v73       #e:Ljava/lang/Throwable;
    const-string v4, "starting NetworkManagement Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_16

    .line 413
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_d
    move-exception v73

    .line 414
    .restart local v73       #e:Ljava/lang/Throwable;
    :goto_43
    const-string v4, "starting Text Service Manager Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_17

    .line 421
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_e
    move-exception v73

    .line 422
    .restart local v73       #e:Ljava/lang/Throwable;
    :goto_44
    const-string v4, "starting NetworkStats Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_18

    .line 431
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_f
    move-exception v73

    move-object/from16 v9, v97

    .line 432
    .end local v97           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v9       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v73       #e:Ljava/lang/Throwable;
    :goto_45
    const-string v4, "starting NetworkPolicy Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_19

    .line 439
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_10
    move-exception v73

    .line 440
    .restart local v73       #e:Ljava/lang/Throwable;
    :goto_46
    const-string v4, "starting Wi-Fi P2pService"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1a

    .line 447
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_11
    move-exception v73

    .line 448
    .restart local v73       #e:Ljava/lang/Throwable;
    :goto_47
    const-string v4, "starting Wi-Fi Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1b

    .line 460
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_12
    move-exception v73

    .line 461
    .restart local v73       #e:Ljava/lang/Throwable;
    :goto_48
    const-string v4, "starting Connectivity Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1c

    .line 469
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_13
    move-exception v73

    .line 470
    .restart local v73       #e:Ljava/lang/Throwable;
    const-string v4, "starting Service Discovery Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1d

    .line 478
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_14
    move-exception v73

    .line 479
    .restart local v73       #e:Ljava/lang/Throwable;
    :goto_49
    const-string v4, "starting ThrottleService"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1e

    .line 486
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_15
    move-exception v73

    .line 487
    .restart local v73       #e:Ljava/lang/Throwable;
    const-string v4, "SystemServer"

    const-string v10, "Failure starting FM receiver Service"

    move-object/from16 v0, v73

    invoke-static {v4, v10, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_1f

    .line 494
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_16
    move-exception v73

    .line 495
    .restart local v73       #e:Ljava/lang/Throwable;
    const-string v4, "SystemServer"

    const-string v10, "Failure starting FM transmitter Service"

    move-object/from16 v0, v73

    invoke-static {v4, v10, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_20

    .line 501
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_17
    move-exception v73

    .line 502
    .restart local v73       #e:Ljava/lang/Throwable;
    const-string v4, "starting UpdateLockService"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_21

    .line 518
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_18
    move-exception v73

    .line 519
    .restart local v73       #e:Ljava/lang/Throwable;
    :goto_4a
    const-string v4, "SystemServer"

    const-string v10, "Failure starting Profile Manager"

    move-object/from16 v0, v73

    invoke-static {v4, v10, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_22

    .line 525
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_19
    move-exception v73

    .line 526
    .restart local v73       #e:Ljava/lang/Throwable;
    const-string v4, "making Account Manager Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_23

    .line 532
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_1a
    move-exception v73

    .line 533
    .restart local v73       #e:Ljava/lang/Throwable;
    const-string v4, "making Content Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_24

    .line 541
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_1b
    move-exception v73

    .line 542
    .restart local v73       #e:Ljava/lang/Throwable;
    :goto_4b
    const-string v4, "starting Notification Manager"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_25

    .line 549
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_1c
    move-exception v73

    .line 550
    .restart local v73       #e:Ljava/lang/Throwable;
    const-string v4, "starting DeviceStorageMonitor service"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_26

    .line 557
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_1d
    move-exception v73

    .line 558
    .restart local v73       #e:Ljava/lang/Throwable;
    :goto_4c
    const-string v4, "starting Location Manager"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_27

    .line 565
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_1e
    move-exception v73

    .line 566
    .restart local v73       #e:Ljava/lang/Throwable;
    :goto_4d
    const-string v4, "starting Country Detector"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_28

    .line 573
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_1f
    move-exception v73

    .line 574
    .restart local v73       #e:Ljava/lang/Throwable;
    const-string v4, "starting Search Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_29

    .line 581
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_20
    move-exception v73

    .line 582
    .restart local v73       #e:Ljava/lang/Throwable;
    const-string v4, "starting DropBoxManagerService"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2a

    .line 593
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_21
    move-exception v73

    .line 594
    .restart local v73       #e:Ljava/lang/Throwable;
    :goto_4e
    const-string v4, "starting Wallpaper Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2b

    .line 602
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_22
    move-exception v73

    .line 603
    .restart local v73       #e:Ljava/lang/Throwable;
    const-string v4, "starting Audio Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2c

    .line 611
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_23
    move-exception v73

    .line 612
    .restart local v73       #e:Ljava/lang/Throwable;
    const-string v4, "starting DockObserver"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2d

    .line 621
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_24
    move-exception v73

    .line 622
    .restart local v73       #e:Ljava/lang/Throwable;
    const-string v4, "starting RotationSwitchObserver"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2e

    .line 629
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_25
    move-exception v73

    .line 630
    .restart local v73       #e:Ljava/lang/Throwable;
    const-string v4, "starting WiredAccessoryObserver"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2f

    .line 638
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_26
    move-exception v73

    .line 639
    .restart local v73       #e:Ljava/lang/Throwable;
    :goto_4f
    const-string v4, "starting UsbService"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_30

    .line 647
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_27
    move-exception v73

    .line 648
    .restart local v73       #e:Ljava/lang/Throwable;
    :goto_50
    const-string v4, "SystemServer"

    const-string v10, "Failure starting SerialService"

    move-object/from16 v0, v73

    invoke-static {v4, v10, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_31

    .line 655
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_28
    move-exception v73

    .line 656
    .restart local v73       #e:Ljava/lang/Throwable;
    const-string v4, "starting UiModeManagerService"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_32

    .line 663
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_29
    move-exception v73

    .line 664
    .restart local v73       #e:Ljava/lang/Throwable;
    const-string v4, "SystemServer"

    const-string v10, "Failure starting Backup Service"

    move-object/from16 v0, v73

    invoke-static {v4, v10, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_33

    .line 671
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_2a
    move-exception v73

    .line 672
    .restart local v73       #e:Ljava/lang/Throwable;
    :goto_51
    const-string v4, "starting AppWidget Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_34

    .line 678
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_2b
    move-exception v73

    .line 679
    .restart local v73       #e:Ljava/lang/Throwable;
    const-string v4, "starting Recognition Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_35

    .line 685
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_2c
    move-exception v73

    .line 686
    .restart local v73       #e:Ljava/lang/Throwable;
    const-string v4, "starting DiskStats Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_36

    .line 697
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_2d
    move-exception v73

    .line 698
    .restart local v73       #e:Ljava/lang/Throwable;
    const-string v4, "starting SamplingProfiler Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_37

    .line 704
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_2e
    move-exception v73

    .line 705
    .restart local v73       #e:Ljava/lang/Throwable;
    const-string v4, "starting NetworkTimeUpdate service"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_38

    .line 712
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_2f
    move-exception v73

    .line 713
    .restart local v73       #e:Ljava/lang/Throwable;
    :goto_52
    const-string v4, "starting CommonTimeManagementService service"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_39

    .line 731
    .end local v73           #e:Ljava/lang/Throwable;
    .restart local v48       #arr$:[Ljava/lang/String;
    .restart local v55       #cachePath:Ljava/lang/String;
    .restart local v79       #i$:I
    .restart local v86       #len$:I
    .restart local v104       #parentLoader:Ljava/lang/ClassLoader;
    .restart local v105       #parts:[Ljava/lang/String;
    .restart local v118       #service:Ljava/lang/String;
    .restart local v131       #vendorServices:[Ljava/lang/String;
    :cond_16
    const/4 v4, 0x0

    aget-object v84, v105, v4

    .line 732
    .local v84, jarPath:Ljava/lang/String;
    const/4 v4, 0x1

    aget-object v56, v105, v4

    .line 739
    .local v56, className:Ljava/lang/String;
    :try_start_53
    new-instance v89, Ldalvik/system/DexClassLoader;

    const/4 v4, 0x0

    move-object/from16 v0, v89

    move-object/from16 v1, v84

    move-object/from16 v2, v55

    move-object/from16 v3, v104

    invoke-direct {v0, v1, v2, v4, v3}, Ldalvik/system/DexClassLoader;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)V

    .line 740
    .local v89, loader:Ldalvik/system/DexClassLoader;
    move-object/from16 v0, v89

    move-object/from16 v1, v56

    invoke-virtual {v0, v1}, Ldalvik/system/DexClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v85

    .line 741
    .local v85, klass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    invoke-virtual/range {v85 .. v85}, Ljava/lang/Class;->getDeclaredConstructors()[Ljava/lang/reflect/Constructor;

    move-result-object v4

    const/4 v10, 0x0

    aget-object v66, v4, v10

    .line 742
    .local v66, ctor:Ljava/lang/reflect/Constructor;,"Ljava/lang/reflect/Constructor<*>;"
    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v5, v4, v10

    move-object/from16 v0, v66

    invoke-virtual {v0, v4}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v83

    .line 744
    .local v83, instance:Ljava/lang/Object;
    invoke-virtual/range {v85 .. v85}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    check-cast v83, Landroid/os/IBinder;

    .end local v83           #instance:Ljava/lang/Object;
    move-object/from16 v0, v83

    invoke-static {v4, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 745
    const-string v4, "SystemServer"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Vendor service "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    move-object/from16 v0, v56

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " started."

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_53
    .catch Ljava/lang/Exception; {:try_start_53 .. :try_end_53} :catch_30

    goto/16 :goto_3b

    .line 746
    .end local v66           #ctor:Ljava/lang/reflect/Constructor;,"Ljava/lang/reflect/Constructor<*>;"
    .end local v85           #klass:Ljava/lang/Class;,"Ljava/lang/Class<*>;"
    .end local v89           #loader:Ldalvik/system/DexClassLoader;
    :catch_30
    move-exception v73

    .line 747
    .local v73, e:Ljava/lang/Exception;
    const-string v4, "SystemServer"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Starting vendor service "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    move-object/from16 v0, v56

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " failed."

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    move-object/from16 v0, v73

    invoke-static {v4, v10, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_3b

    .line 753
    .end local v48           #arr$:[Ljava/lang/String;
    .end local v55           #cachePath:Ljava/lang/String;
    .end local v56           #className:Ljava/lang/String;
    .end local v73           #e:Ljava/lang/Exception;
    .end local v79           #i$:I
    .end local v84           #jarPath:Ljava/lang/String;
    .end local v86           #len$:I
    .end local v104           #parentLoader:Ljava/lang/ClassLoader;
    .end local v105           #parts:[Ljava/lang/String;
    .end local v118           #service:Ljava/lang/String;
    :cond_17
    :try_start_54
    const-string v4, "SystemServer"

    const-string v10, "CertBlacklister"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 754
    new-instance v4, Lcom/android/server/CertBlacklister;

    invoke-direct {v4, v5}, Lcom/android/server/CertBlacklister;-><init>(Landroid/content/Context;)V
    :try_end_54
    .catch Ljava/lang/Throwable; {:try_start_54 .. :try_end_54} :catch_31

    .line 759
    :goto_53
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v10, 0x111003e

    invoke-virtual {v4, v10}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v4

    if-eqz v4, :cond_18

    .line 762
    :try_start_55
    const-string v4, "SystemServer"

    const-string v10, "Dreams Service"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 764
    new-instance v72, Landroid/service/dreams/DreamManagerService;

    move-object/from16 v0, v72

    invoke-direct {v0, v5}, Landroid/service/dreams/DreamManagerService;-><init>(Landroid/content/Context;)V
    :try_end_55
    .catch Ljava/lang/Throwable; {:try_start_55 .. :try_end_55} :catch_32

    .line 765
    .end local v71           #dreamy:Landroid/service/dreams/DreamManagerService;
    .local v72, dreamy:Landroid/service/dreams/DreamManagerService;
    :try_start_56
    const-string v4, "dreams"

    move-object/from16 v0, v72

    invoke-static {v4, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_56
    .catch Ljava/lang/Throwable; {:try_start_56 .. :try_end_56} :catch_3b

    move-object/from16 v71, v72

    .line 772
    .end local v72           #dreamy:Landroid/service/dreams/DreamManagerService;
    .restart local v71       #dreamy:Landroid/service/dreams/DreamManagerService;
    :cond_18
    :goto_54
    :try_start_57
    const-string v4, "SystemServer"

    const-string v10, "AssetRedirectionManager Service"

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 773
    const-string v4, "assetredirection"

    new-instance v10, Lcom/android/server/AssetRedirectionManagerService;

    invoke-direct {v10, v5}, Lcom/android/server/AssetRedirectionManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v4, v10}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_57
    .catch Ljava/lang/Throwable; {:try_start_57 .. :try_end_57} :catch_33

    .line 780
    .end local v95           #mountService:Lcom/android/server/MountService;
    .end local v131           #vendorServices:[Ljava/lang/String;
    :goto_55
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/ServerThread;->mContentResolver:Landroid/content/ContentResolver;

    const-string v10, "adb_port"

    const-string v11, "service.adb.tcp.port"

    const-string v12, "-1"

    invoke-static {v11, v12}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v11

    invoke-static {v4, v10, v11}, Landroid/provider/Settings$Secure;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 784
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/server/ServerThread;->mContentResolver:Landroid/content/ContentResolver;

    const-string v10, "adb_port"

    invoke-static {v10}, Landroid/provider/Settings$Secure;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v10

    const/4 v11, 0x0

    new-instance v12, Lcom/android/server/ServerThread$AdbPortObserver;

    move-object/from16 v0, p0

    invoke-direct {v12, v0}, Lcom/android/server/ServerThread$AdbPortObserver;-><init>(Lcom/android/server/ServerThread;)V

    invoke-virtual {v4, v10, v11, v12}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 790
    invoke-virtual/range {v141 .. v141}, Lcom/android/server/wm/WindowManagerService;->detectSafeMode()Z

    move-result v30

    .line 791
    .local v30, safeMode:Z
    if-eqz v30, :cond_1d

    .line 792
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/server/am/ActivityManagerService;->enterSafeMode()V

    .line 794
    const/4 v4, 0x1

    sput-boolean v4, Ldalvik/system/Zygote;->systemInSafeMode:Z

    .line 796
    invoke-static {}, Ldalvik/system/VMRuntime;->getRuntime()Ldalvik/system/VMRuntime;

    move-result-object v4

    invoke-virtual {v4}, Ldalvik/system/VMRuntime;->disableJitCompilation()V

    .line 805
    :goto_56
    :try_start_58
    invoke-virtual/range {v132 .. v132}, Lcom/android/server/VibratorService;->systemReady()V
    :try_end_58
    .catch Ljava/lang/Throwable; {:try_start_58 .. :try_end_58} :catch_34

    .line 810
    :goto_57
    if-eqz v67, :cond_19

    .line 812
    :try_start_59
    invoke-virtual/range {v67 .. v67}, Lcom/android/server/DevicePolicyManagerService;->systemReady()V
    :try_end_59
    .catch Ljava/lang/Throwable; {:try_start_59 .. :try_end_59} :catch_35

    .line 818
    :cond_19
    :goto_58
    if-eqz v101, :cond_1a

    .line 820
    :try_start_5a
    invoke-virtual/range {v101 .. v101}, Lcom/android/server/NotificationManagerService;->systemReady()V
    :try_end_5a
    .catch Ljava/lang/Throwable; {:try_start_5a .. :try_end_5a} :catch_36

    .line 827
    :cond_1a
    :goto_59
    :try_start_5b
    invoke-virtual/range {v141 .. v141}, Lcom/android/server/wm/WindowManagerService;->systemReady()V
    :try_end_5b
    .catch Ljava/lang/Throwable; {:try_start_5b .. :try_end_5b} :catch_37

    .line 832
    :goto_5a
    if-eqz v30, :cond_1b

    .line 833
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/server/am/ActivityManagerService;->showSafeModeOverlay()V

    .line 839
    :cond_1b
    invoke-virtual/range {v141 .. v141}, Lcom/android/server/wm/WindowManagerService;->computeNewConfiguration()Landroid/content/res/Configuration;

    move-result-object v59

    .line 840
    .local v59, config:Landroid/content/res/Configuration;
    new-instance v94, Landroid/util/DisplayMetrics;

    invoke-direct/range {v94 .. v94}, Landroid/util/DisplayMetrics;-><init>()V

    .line 841
    .local v94, metrics:Landroid/util/DisplayMetrics;
    const-string v4, "window"

    invoke-virtual {v5, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v134

    check-cast v134, Landroid/view/WindowManager;

    .line 842
    .local v134, w:Landroid/view/WindowManager;
    invoke-interface/range {v134 .. v134}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v4

    move-object/from16 v0, v94

    invoke-virtual {v4, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 843
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    move-object/from16 v0, v59

    move-object/from16 v1, v94

    invoke-virtual {v4, v0, v1}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;)V

    .line 845
    invoke-virtual {v7}, Lcom/android/server/PowerManagerService;->systemReady()V

    .line 847
    :try_start_5c
    invoke-interface/range {v106 .. v106}, Landroid/content/pm/IPackageManager;->systemReady()V
    :try_end_5c
    .catch Ljava/lang/Throwable; {:try_start_5c .. :try_end_5c} :catch_38

    .line 852
    :goto_5b
    :try_start_5d
    invoke-virtual/range {v92 .. v92}, Lcom/android/internal/widget/LockSettingsService;->systemReady()V
    :try_end_5d
    .catch Ljava/lang/Throwable; {:try_start_5d .. :try_end_5d} :catch_39

    .line 857
    :goto_5c
    new-instance v76, Landroid/content/IntentFilter;

    invoke-direct/range {v76 .. v76}, Landroid/content/IntentFilter;-><init>()V

    .line 858
    .local v76, filter:Landroid/content/IntentFilter;
    const-string v4, "com.tmobile.intent.action.APP_LAUNCH_FAILURE"

    move-object/from16 v0, v76

    invoke-virtual {v0, v4}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 859
    const-string v4, "com.tmobile.intent.action.APP_LAUNCH_FAILURE_RESET"

    move-object/from16 v0, v76

    invoke-virtual {v0, v4}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 860
    const-string v4, "android.intent.action.PACKAGE_ADDED"

    move-object/from16 v0, v76

    invoke-virtual {v0, v4}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 861
    const-string v4, "android.intent.action.PACKAGE_REMOVED"

    move-object/from16 v0, v76

    invoke-virtual {v0, v4}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 862
    const-string v4, "com.tmobile.intent.category.THEME_PACKAGE_INSTALL_STATE_CHANGE"

    move-object/from16 v0, v76

    invoke-virtual {v0, v4}, Landroid/content/IntentFilter;->addCategory(Ljava/lang/String;)V

    .line 863
    const-string v4, "package"

    move-object/from16 v0, v76

    invoke-virtual {v0, v4}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    .line 864
    new-instance v4, Lcom/android/server/AppsLaunchFailureReceiver;

    invoke-direct {v4}, Lcom/android/server/AppsLaunchFailureReceiver;-><init>()V

    move-object/from16 v0, v76

    invoke-virtual {v5, v4, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 867
    move-object/from16 v18, v5

    .line 868
    .local v18, contextF:Landroid/content/Context;
    move-object/from16 v19, v6

    .line 869
    .local v19, batteryF:Lcom/android/server/BatteryService;
    move-object/from16 v20, v14

    .line 870
    .local v20, networkManagementF:Lcom/android/server/NetworkManagementService;
    move-object/from16 v21, v13

    .line 871
    .local v21, networkStatsF:Lcom/android/server/net/NetworkStatsService;
    move-object/from16 v22, v9

    .line 872
    .local v22, networkPolicyF:Lcom/android/server/net/NetworkPolicyManagerService;
    move-object/from16 v23, v60

    .line 873
    .local v23, connectivityF:Lcom/android/server/ConnectivityService;
    move-object/from16 v24, v69

    .line 874
    .local v24, dockF:Lcom/android/server/DockObserver;
    move-object/from16 v25, v114

    .line 875
    .local v25, rotateSwitchF:Lcom/android/server/RotationSwitchObserver;
    move-object/from16 v26, v129

    .line 876
    .local v26, usbF:Lcom/android/server/usb/UsbService;
    move-object/from16 v36, v123

    .line 877
    .local v36, throttleF:Lcom/android/server/ThrottleService;
    move-object/from16 v27, v127

    .line 878
    .local v27, uiModeF:Lcom/android/server/UiModeManagerService;
    move-object/from16 v29, v46

    .line 879
    .local v29, appWidgetF:Lcom/android/server/AppWidgetService;
    move-object/from16 v31, v135

    .line 880
    .local v31, wallpaperF:Lcom/android/server/WallpaperManagerService;
    move-object/from16 v32, v80

    .line 881
    .local v32, immF:Lcom/android/server/InputMethodManagerService;
    move-object/from16 v28, v112

    .line 882
    .local v28, recognitionF:Lcom/android/server/RecognitionManagerService;
    move-object/from16 v34, v90

    .line 883
    .local v34, locationF:Lcom/android/server/LocationManagerService;
    move-object/from16 v35, v63

    .line 884
    .local v35, countryDetectorF:Lcom/android/server/CountryDetectorService;
    move-object/from16 v37, v99

    .line 885
    .local v37, networkTimeUpdaterF:Lcom/android/server/NetworkTimeUpdateService;
    move-object/from16 v38, v57

    .line 886
    .local v38, commonTimeMgmtServiceF:Lcom/android/server/CommonTimeManagementService;
    move-object/from16 v39, v125

    .line 887
    .local v39, textServiceManagerServiceF:Lcom/android/server/TextServicesManagerService;
    move-object/from16 v33, v121

    .line 888
    .local v33, statusBarF:Lcom/android/server/StatusBarManagerService;
    move-object/from16 v40, v71

    .line 889
    .local v40, dreamyF:Landroid/service/dreams/DreamManagerService;
    move-object/from16 v41, v82

    .line 890
    .local v41, inputManagerF:Lcom/android/server/input/InputManagerService;
    move-object/from16 v42, v50

    .line 897
    .local v42, bluetoothF:Landroid/server/BluetoothService;
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v4

    new-instance v15, Lcom/android/server/ServerThread$1;

    move-object/from16 v16, p0

    invoke-direct/range {v15 .. v42}, Lcom/android/server/ServerThread$1;-><init>(Lcom/android/server/ServerThread;ZLandroid/content/Context;Lcom/android/server/BatteryService;Lcom/android/server/NetworkManagementService;Lcom/android/server/net/NetworkStatsService;Lcom/android/server/net/NetworkPolicyManagerService;Lcom/android/server/ConnectivityService;Lcom/android/server/DockObserver;Lcom/android/server/RotationSwitchObserver;Lcom/android/server/usb/UsbService;Lcom/android/server/UiModeManagerService;Lcom/android/server/RecognitionManagerService;Lcom/android/server/AppWidgetService;ZLcom/android/server/WallpaperManagerService;Lcom/android/server/InputMethodManagerService;Lcom/android/server/StatusBarManagerService;Lcom/android/server/LocationManagerService;Lcom/android/server/CountryDetectorService;Lcom/android/server/ThrottleService;Lcom/android/server/NetworkTimeUpdateService;Lcom/android/server/CommonTimeManagementService;Lcom/android/server/TextServicesManagerService;Landroid/service/dreams/DreamManagerService;Lcom/android/server/input/InputManagerService;Landroid/server/BluetoothService;)V

    invoke-virtual {v4, v15}, Lcom/android/server/am/ActivityManagerService;->systemReady(Ljava/lang/Runnable;)V

    .line 1016
    invoke-static {}, Landroid/os/StrictMode;->conditionallyEnableDebugLogging()Z

    move-result v4

    if-eqz v4, :cond_1c

    .line 1017
    const-string v4, "SystemServer"

    const-string v10, "Enabled StrictMode for system server main thread."

    invoke-static {v4, v10}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1020
    :cond_1c
    invoke-static {}, Landroid/os/Looper;->loop()V

    .line 1021
    const-string v4, "SystemServer"

    const-string v10, "System ServerThread is exiting!"

    invoke-static {v4, v10}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1022
    return-void

    .line 755
    .end local v18           #contextF:Landroid/content/Context;
    .end local v19           #batteryF:Lcom/android/server/BatteryService;
    .end local v20           #networkManagementF:Lcom/android/server/NetworkManagementService;
    .end local v21           #networkStatsF:Lcom/android/server/net/NetworkStatsService;
    .end local v22           #networkPolicyF:Lcom/android/server/net/NetworkPolicyManagerService;
    .end local v23           #connectivityF:Lcom/android/server/ConnectivityService;
    .end local v24           #dockF:Lcom/android/server/DockObserver;
    .end local v25           #rotateSwitchF:Lcom/android/server/RotationSwitchObserver;
    .end local v26           #usbF:Lcom/android/server/usb/UsbService;
    .end local v27           #uiModeF:Lcom/android/server/UiModeManagerService;
    .end local v28           #recognitionF:Lcom/android/server/RecognitionManagerService;
    .end local v29           #appWidgetF:Lcom/android/server/AppWidgetService;
    .end local v30           #safeMode:Z
    .end local v31           #wallpaperF:Lcom/android/server/WallpaperManagerService;
    .end local v32           #immF:Lcom/android/server/InputMethodManagerService;
    .end local v33           #statusBarF:Lcom/android/server/StatusBarManagerService;
    .end local v34           #locationF:Lcom/android/server/LocationManagerService;
    .end local v35           #countryDetectorF:Lcom/android/server/CountryDetectorService;
    .end local v36           #throttleF:Lcom/android/server/ThrottleService;
    .end local v37           #networkTimeUpdaterF:Lcom/android/server/NetworkTimeUpdateService;
    .end local v38           #commonTimeMgmtServiceF:Lcom/android/server/CommonTimeManagementService;
    .end local v39           #textServiceManagerServiceF:Lcom/android/server/TextServicesManagerService;
    .end local v40           #dreamyF:Landroid/service/dreams/DreamManagerService;
    .end local v41           #inputManagerF:Lcom/android/server/input/InputManagerService;
    .end local v42           #bluetoothF:Landroid/server/BluetoothService;
    .end local v59           #config:Landroid/content/res/Configuration;
    .end local v76           #filter:Landroid/content/IntentFilter;
    .end local v94           #metrics:Landroid/util/DisplayMetrics;
    .end local v134           #w:Landroid/view/WindowManager;
    .restart local v95       #mountService:Lcom/android/server/MountService;
    .restart local v131       #vendorServices:[Ljava/lang/String;
    :catch_31
    move-exception v73

    .line 756
    .local v73, e:Ljava/lang/Throwable;
    const-string v4, "starting CertBlacklister"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_53

    .line 766
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_32
    move-exception v73

    .line 767
    .restart local v73       #e:Ljava/lang/Throwable;
    :goto_5d
    const-string v4, "starting DreamManagerService"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_54

    .line 774
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_33
    move-exception v73

    .line 775
    .restart local v73       #e:Ljava/lang/Throwable;
    const-string v4, "SystemServer"

    const-string v10, "Failure starting AssetRedirectionManager Service"

    move-object/from16 v0, v73

    invoke-static {v4, v10, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_55

    .line 799
    .end local v73           #e:Ljava/lang/Throwable;
    .end local v95           #mountService:Lcom/android/server/MountService;
    .end local v131           #vendorServices:[Ljava/lang/String;
    .restart local v30       #safeMode:Z
    :cond_1d
    invoke-static {}, Ldalvik/system/VMRuntime;->getRuntime()Ldalvik/system/VMRuntime;

    move-result-object v4

    invoke-virtual {v4}, Ldalvik/system/VMRuntime;->startJitCompilation()V

    goto/16 :goto_56

    .line 806
    :catch_34
    move-exception v73

    .line 807
    .restart local v73       #e:Ljava/lang/Throwable;
    const-string v4, "making Vibrator Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_57

    .line 813
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_35
    move-exception v73

    .line 814
    .restart local v73       #e:Ljava/lang/Throwable;
    const-string v4, "making Device Policy Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_58

    .line 821
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_36
    move-exception v73

    .line 822
    .restart local v73       #e:Ljava/lang/Throwable;
    const-string v4, "making Notification Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_59

    .line 828
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_37
    move-exception v73

    .line 829
    .restart local v73       #e:Ljava/lang/Throwable;
    const-string v4, "making Window Manager Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_5a

    .line 848
    .end local v73           #e:Ljava/lang/Throwable;
    .restart local v59       #config:Landroid/content/res/Configuration;
    .restart local v94       #metrics:Landroid/util/DisplayMetrics;
    .restart local v134       #w:Landroid/view/WindowManager;
    :catch_38
    move-exception v73

    .line 849
    .restart local v73       #e:Ljava/lang/Throwable;
    const-string v4, "making Package Manager Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_5b

    .line 853
    .end local v73           #e:Ljava/lang/Throwable;
    :catch_39
    move-exception v73

    .line 854
    .restart local v73       #e:Ljava/lang/Throwable;
    const-string v4, "making Lock Settings Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v73

    invoke-virtual {v0, v4, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_5c

    .line 210
    .end local v6           #battery:Lcom/android/server/BatteryService;
    .end local v8           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v9           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .end local v30           #safeMode:Z
    .end local v46           #appWidget:Lcom/android/server/AppWidgetService;
    .end local v59           #config:Landroid/content/res/Configuration;
    .end local v63           #countryDetector:Lcom/android/server/CountryDetectorService;
    .end local v67           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .end local v71           #dreamy:Landroid/service/dreams/DreamManagerService;
    .end local v73           #e:Ljava/lang/Throwable;
    .end local v78           #hasRotationLock:Z
    .end local v80           #imm:Lcom/android/server/InputMethodManagerService;
    .end local v90           #location:Lcom/android/server/LocationManagerService;
    .end local v92           #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    .end local v94           #metrics:Landroid/util/DisplayMetrics;
    .end local v101           #notification:Lcom/android/server/NotificationManagerService;
    .end local v108           #profile:Lcom/android/server/ProfileManagerService;
    .end local v121           #statusBar:Lcom/android/server/StatusBarManagerService;
    .end local v125           #tsms:Lcom/android/server/TextServicesManagerService;
    .end local v134           #w:Landroid/view/WindowManager;
    .end local v135           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v45       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v49       #battery:Lcom/android/server/BatteryService;
    .restart local v65       #cryptState:Ljava/lang/String;
    .restart local v77       #firstBoot:Z
    .restart local v97       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v103       #onlyCore:Z
    :catch_3a
    move-exception v4

    goto/16 :goto_5

    .line 766
    .end local v45           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v49           #battery:Lcom/android/server/BatteryService;
    .end local v65           #cryptState:Ljava/lang/String;
    .end local v77           #firstBoot:Z
    .end local v97           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .end local v103           #onlyCore:Z
    .restart local v6       #battery:Lcom/android/server/BatteryService;
    .restart local v8       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v9       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v46       #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v63       #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v67       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v72       #dreamy:Landroid/service/dreams/DreamManagerService;
    .restart local v78       #hasRotationLock:Z
    .restart local v80       #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v90       #location:Lcom/android/server/LocationManagerService;
    .restart local v92       #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    .restart local v95       #mountService:Lcom/android/server/MountService;
    .restart local v101       #notification:Lcom/android/server/NotificationManagerService;
    .restart local v108       #profile:Lcom/android/server/ProfileManagerService;
    .restart local v121       #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v125       #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v131       #vendorServices:[Ljava/lang/String;
    .restart local v135       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :catch_3b
    move-exception v73

    move-object/from16 v71, v72

    .end local v72           #dreamy:Landroid/service/dreams/DreamManagerService;
    .restart local v71       #dreamy:Landroid/service/dreams/DreamManagerService;
    goto :goto_5d

    .line 712
    .end local v57           #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    .end local v131           #vendorServices:[Ljava/lang/String;
    .restart local v58       #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    :catch_3c
    move-exception v73

    move-object/from16 v57, v58

    .end local v58           #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    .restart local v57       #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    goto/16 :goto_52

    .line 671
    .end local v46           #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v47       #appWidget:Lcom/android/server/AppWidgetService;
    :catch_3d
    move-exception v73

    move-object/from16 v46, v47

    .end local v47           #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v46       #appWidget:Lcom/android/server/AppWidgetService;
    goto/16 :goto_51

    .line 647
    .end local v116           #serial:Lcom/android/server/SerialService;
    .restart local v117       #serial:Lcom/android/server/SerialService;
    :catch_3e
    move-exception v73

    move-object/from16 v116, v117

    .end local v117           #serial:Lcom/android/server/SerialService;
    .restart local v116       #serial:Lcom/android/server/SerialService;
    goto/16 :goto_50

    .line 638
    .end local v129           #usb:Lcom/android/server/usb/UsbService;
    .restart local v130       #usb:Lcom/android/server/usb/UsbService;
    :catch_3f
    move-exception v73

    move-object/from16 v129, v130

    .end local v130           #usb:Lcom/android/server/usb/UsbService;
    .restart local v129       #usb:Lcom/android/server/usb/UsbService;
    goto/16 :goto_4f

    .line 593
    .end local v135           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v136       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :catch_40
    move-exception v73

    move-object/from16 v135, v136

    .end local v136           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v135       #wallpaper:Lcom/android/server/WallpaperManagerService;
    goto/16 :goto_4e

    .line 565
    .end local v63           #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v64       #countryDetector:Lcom/android/server/CountryDetectorService;
    :catch_41
    move-exception v73

    move-object/from16 v63, v64

    .end local v64           #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v63       #countryDetector:Lcom/android/server/CountryDetectorService;
    goto/16 :goto_4d

    .line 557
    .end local v90           #location:Lcom/android/server/LocationManagerService;
    .restart local v91       #location:Lcom/android/server/LocationManagerService;
    :catch_42
    move-exception v73

    move-object/from16 v90, v91

    .end local v91           #location:Lcom/android/server/LocationManagerService;
    .restart local v90       #location:Lcom/android/server/LocationManagerService;
    goto/16 :goto_4c

    .line 541
    .end local v101           #notification:Lcom/android/server/NotificationManagerService;
    .restart local v102       #notification:Lcom/android/server/NotificationManagerService;
    :catch_43
    move-exception v73

    move-object/from16 v101, v102

    .end local v102           #notification:Lcom/android/server/NotificationManagerService;
    .restart local v101       #notification:Lcom/android/server/NotificationManagerService;
    goto/16 :goto_4b

    .line 518
    .end local v108           #profile:Lcom/android/server/ProfileManagerService;
    .restart local v109       #profile:Lcom/android/server/ProfileManagerService;
    :catch_44
    move-exception v73

    move-object/from16 v108, v109

    .end local v109           #profile:Lcom/android/server/ProfileManagerService;
    .restart local v108       #profile:Lcom/android/server/ProfileManagerService;
    goto/16 :goto_4a

    .line 478
    .end local v123           #throttle:Lcom/android/server/ThrottleService;
    .restart local v124       #throttle:Lcom/android/server/ThrottleService;
    :catch_45
    move-exception v73

    move-object/from16 v123, v124

    .end local v124           #throttle:Lcom/android/server/ThrottleService;
    .restart local v123       #throttle:Lcom/android/server/ThrottleService;
    goto/16 :goto_49

    .line 460
    .end local v60           #connectivity:Lcom/android/server/ConnectivityService;
    .restart local v61       #connectivity:Lcom/android/server/ConnectivityService;
    :catch_46
    move-exception v73

    move-object/from16 v60, v61

    .end local v61           #connectivity:Lcom/android/server/ConnectivityService;
    .restart local v60       #connectivity:Lcom/android/server/ConnectivityService;
    goto/16 :goto_48

    .line 447
    .end local v137           #wifi:Lcom/android/server/WifiService;
    .restart local v138       #wifi:Lcom/android/server/WifiService;
    :catch_47
    move-exception v73

    move-object/from16 v137, v138

    .end local v138           #wifi:Lcom/android/server/WifiService;
    .restart local v137       #wifi:Lcom/android/server/WifiService;
    goto/16 :goto_47

    .line 439
    .end local v139           #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .restart local v140       #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    :catch_48
    move-exception v73

    move-object/from16 v139, v140

    .end local v140           #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .restart local v139       #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    goto/16 :goto_46

    .line 431
    :catch_49
    move-exception v73

    goto/16 :goto_45

    .line 421
    .end local v9           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .end local v13           #networkStats:Lcom/android/server/net/NetworkStatsService;
    .restart local v97       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v98       #networkStats:Lcom/android/server/net/NetworkStatsService;
    :catch_4a
    move-exception v73

    move-object/from16 v13, v98

    .end local v98           #networkStats:Lcom/android/server/net/NetworkStatsService;
    .restart local v13       #networkStats:Lcom/android/server/net/NetworkStatsService;
    goto/16 :goto_44

    .line 413
    .end local v125           #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v126       #tsms:Lcom/android/server/TextServicesManagerService;
    :catch_4b
    move-exception v73

    move-object/from16 v125, v126

    .end local v126           #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v125       #tsms:Lcom/android/server/TextServicesManagerService;
    goto/16 :goto_43

    .line 389
    .end local v121           #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v122       #statusBar:Lcom/android/server/StatusBarManagerService;
    :catch_4c
    move-exception v73

    move-object/from16 v121, v122

    .end local v122           #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v121       #statusBar:Lcom/android/server/StatusBarManagerService;
    goto/16 :goto_42

    .line 381
    .end local v67           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v68       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    :catch_4d
    move-exception v73

    move-object/from16 v67, v68

    .end local v68           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v67       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    goto/16 :goto_41

    .line 373
    .end local v92           #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    .restart local v93       #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    :catch_4e
    move-exception v73

    move-object/from16 v92, v93

    .end local v93           #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    .restart local v92       #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    goto/16 :goto_40

    .line 364
    .end local v95           #mountService:Lcom/android/server/MountService;
    .restart local v96       #mountService:Lcom/android/server/MountService;
    :catch_4f
    move-exception v73

    move-object/from16 v95, v96

    .end local v96           #mountService:Lcom/android/server/MountService;
    .restart local v95       #mountService:Lcom/android/server/MountService;
    goto/16 :goto_3f

    .line 350
    .end local v95           #mountService:Lcom/android/server/MountService;
    :catch_50
    move-exception v4

    goto/16 :goto_10

    .line 320
    .end local v80           #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v81       #imm:Lcom/android/server/InputMethodManagerService;
    :catch_51
    move-exception v73

    move-object/from16 v80, v81

    .end local v81           #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v80       #imm:Lcom/android/server/InputMethodManagerService;
    goto/16 :goto_3e

    .line 293
    .end local v6           #battery:Lcom/android/server/BatteryService;
    .end local v7           #power:Lcom/android/server/PowerManagerService;
    .end local v8           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v46           #appWidget:Lcom/android/server/AppWidgetService;
    .end local v63           #countryDetector:Lcom/android/server/CountryDetectorService;
    .end local v67           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .end local v71           #dreamy:Landroid/service/dreams/DreamManagerService;
    .end local v78           #hasRotationLock:Z
    .end local v80           #imm:Lcom/android/server/InputMethodManagerService;
    .end local v90           #location:Lcom/android/server/LocationManagerService;
    .end local v92           #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    .end local v101           #notification:Lcom/android/server/NotificationManagerService;
    .end local v108           #profile:Lcom/android/server/ProfileManagerService;
    .end local v121           #statusBar:Lcom/android/server/StatusBarManagerService;
    .end local v125           #tsms:Lcom/android/server/TextServicesManagerService;
    .end local v135           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v45       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v49       #battery:Lcom/android/server/BatteryService;
    .restart local v107       #power:Lcom/android/server/PowerManagerService;
    :catch_52
    move-exception v73

    move-object/from16 v8, v45

    .end local v45           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v8       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v6, v49

    .end local v49           #battery:Lcom/android/server/BatteryService;
    .restart local v6       #battery:Lcom/android/server/BatteryService;
    move-object/from16 v7, v107

    .end local v107           #power:Lcom/android/server/PowerManagerService;
    .restart local v7       #power:Lcom/android/server/PowerManagerService;
    goto/16 :goto_3d

    .end local v6           #battery:Lcom/android/server/BatteryService;
    .end local v8           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v43           #accountManager:Landroid/accounts/AccountManagerService;
    .restart local v44       #accountManager:Landroid/accounts/AccountManagerService;
    .restart local v45       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v49       #battery:Lcom/android/server/BatteryService;
    .restart local v65       #cryptState:Ljava/lang/String;
    .restart local v77       #firstBoot:Z
    .restart local v103       #onlyCore:Z
    :catch_53
    move-exception v73

    move-object/from16 v8, v45

    .end local v45           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v8       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v6, v49

    .end local v49           #battery:Lcom/android/server/BatteryService;
    .restart local v6       #battery:Lcom/android/server/BatteryService;
    move-object/from16 v43, v44

    .end local v44           #accountManager:Landroid/accounts/AccountManagerService;
    .restart local v43       #accountManager:Landroid/accounts/AccountManagerService;
    goto/16 :goto_3d

    .end local v6           #battery:Lcom/android/server/BatteryService;
    .end local v8           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v87           #lights:Lcom/android/server/LightsService;
    .restart local v45       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v49       #battery:Lcom/android/server/BatteryService;
    .restart local v88       #lights:Lcom/android/server/LightsService;
    :catch_54
    move-exception v73

    move-object/from16 v8, v45

    .end local v45           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v8       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v6, v49

    .end local v49           #battery:Lcom/android/server/BatteryService;
    .restart local v6       #battery:Lcom/android/server/BatteryService;
    move-object/from16 v87, v88

    .end local v88           #lights:Lcom/android/server/LightsService;
    .restart local v87       #lights:Lcom/android/server/LightsService;
    goto/16 :goto_3d

    .end local v8           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v87           #lights:Lcom/android/server/LightsService;
    .restart local v45       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v88       #lights:Lcom/android/server/LightsService;
    :catch_55
    move-exception v73

    move-object/from16 v8, v45

    .end local v45           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v8       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v87, v88

    .end local v88           #lights:Lcom/android/server/LightsService;
    .restart local v87       #lights:Lcom/android/server/LightsService;
    goto/16 :goto_3d

    .end local v8           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v87           #lights:Lcom/android/server/LightsService;
    .end local v132           #vibrator:Lcom/android/server/VibratorService;
    .restart local v45       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v88       #lights:Lcom/android/server/LightsService;
    .restart local v133       #vibrator:Lcom/android/server/VibratorService;
    :catch_56
    move-exception v73

    move-object/from16 v8, v45

    .end local v45           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v8       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v132, v133

    .end local v133           #vibrator:Lcom/android/server/VibratorService;
    .restart local v132       #vibrator:Lcom/android/server/VibratorService;
    move-object/from16 v87, v88

    .end local v88           #lights:Lcom/android/server/LightsService;
    .restart local v87       #lights:Lcom/android/server/LightsService;
    goto/16 :goto_3d

    .end local v50           #bluetooth:Landroid/server/BluetoothService;
    .end local v87           #lights:Lcom/android/server/LightsService;
    .end local v132           #vibrator:Lcom/android/server/VibratorService;
    .restart local v51       #bluetooth:Landroid/server/BluetoothService;
    .restart local v88       #lights:Lcom/android/server/LightsService;
    .restart local v133       #vibrator:Lcom/android/server/VibratorService;
    :catch_57
    move-exception v73

    move-object/from16 v50, v51

    .end local v51           #bluetooth:Landroid/server/BluetoothService;
    .restart local v50       #bluetooth:Landroid/server/BluetoothService;
    move-object/from16 v132, v133

    .end local v133           #vibrator:Lcom/android/server/VibratorService;
    .restart local v132       #vibrator:Lcom/android/server/VibratorService;
    move-object/from16 v87, v88

    .end local v88           #lights:Lcom/android/server/LightsService;
    .restart local v87       #lights:Lcom/android/server/LightsService;
    goto/16 :goto_3d

    .end local v50           #bluetooth:Landroid/server/BluetoothService;
    .end local v52           #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    .end local v87           #lights:Lcom/android/server/LightsService;
    .end local v132           #vibrator:Lcom/android/server/VibratorService;
    .restart local v51       #bluetooth:Landroid/server/BluetoothService;
    .restart local v53       #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    .restart local v88       #lights:Lcom/android/server/LightsService;
    .restart local v133       #vibrator:Lcom/android/server/VibratorService;
    :catch_58
    move-exception v73

    move-object/from16 v52, v53

    .end local v53           #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    .restart local v52       #bluetoothA2dp:Landroid/server/BluetoothA2dpService;
    move-object/from16 v50, v51

    .end local v51           #bluetooth:Landroid/server/BluetoothService;
    .restart local v50       #bluetooth:Landroid/server/BluetoothService;
    move-object/from16 v132, v133

    .end local v133           #vibrator:Lcom/android/server/VibratorService;
    .restart local v132       #vibrator:Lcom/android/server/VibratorService;
    move-object/from16 v87, v88

    .end local v88           #lights:Lcom/android/server/LightsService;
    .restart local v87       #lights:Lcom/android/server/LightsService;
    goto/16 :goto_3d

    .line 222
    .end local v6           #battery:Lcom/android/server/BatteryService;
    .end local v8           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v43           #accountManager:Landroid/accounts/AccountManagerService;
    .restart local v44       #accountManager:Landroid/accounts/AccountManagerService;
    .restart local v45       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v49       #battery:Lcom/android/server/BatteryService;
    :catch_59
    move-exception v73

    move-object/from16 v43, v44

    .end local v44           #accountManager:Landroid/accounts/AccountManagerService;
    .restart local v43       #accountManager:Landroid/accounts/AccountManagerService;
    goto/16 :goto_3c

    .end local v45           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v49           #battery:Lcom/android/server/BatteryService;
    .end local v65           #cryptState:Ljava/lang/String;
    .end local v77           #firstBoot:Z
    .end local v103           #onlyCore:Z
    .restart local v6       #battery:Lcom/android/server/BatteryService;
    .restart local v8       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v46       #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v63       #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v67       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v71       #dreamy:Landroid/service/dreams/DreamManagerService;
    .restart local v78       #hasRotationLock:Z
    .restart local v80       #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v90       #location:Lcom/android/server/LocationManagerService;
    .restart local v92       #lockSettings:Lcom/android/internal/widget/LockSettingsService;
    .restart local v101       #notification:Lcom/android/server/NotificationManagerService;
    .restart local v108       #profile:Lcom/android/server/ProfileManagerService;
    .restart local v121       #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v125       #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v135       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :cond_1e
    move-object/from16 v9, v97

    .end local v97           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v9       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    goto/16 :goto_55
.end method
