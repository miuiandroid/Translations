.class public Lcom/miui/player/ui/MusicBrowserActivity;
.super Lcom/miui/player/ui/BaseActivity;
.source "MusicBrowserActivity.java"

# interfaces
.implements Lcom/miui/player/MusicUtils$Defs;
.implements Lcom/miui/player/drawerActivityGroup/MainActivityGroup$ServiceConnectionObserver;
.implements Lcom/miui/player/drawerActivityGroup/DrawerActivityGroup$OptionsMenuProvider;
.implements Lcom/miui/player/helper/FolderProvider$RefreshFolderAsPlaylist;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/player/ui/MusicBrowserActivity$QueryNumTask;,
        Lcom/miui/player/ui/MusicBrowserActivity$MetaProviderObserver;,
        Lcom/miui/player/ui/MusicBrowserActivity$RecycleTrashTask;,
        Lcom/miui/player/ui/MusicBrowserActivity$OnNavigationClickListener;
    }
.end annotation


# static fields
.field private static final PREF_LAST_CLEAR_TRASH_TIME:Ljava/lang/String; = "pref_last_clear_trash_time"

.field private static final TRASH_CLEAR_INTERVAL:J = 0x240c8400L

.field private static final TRASH_LIFE_CYCLE:J = 0x240c8400L

.field private static sNumArr:[I


# instance fields
.field private mAlbumtabNum:Landroid/widget/TextView;

.field private mArtisttabNum:Landroid/widget/TextView;

.field private mFoldertabNum:Landroid/widget/TextView;

.field private mIsRefreshMediaProvider:Z

.field private mNeedRefresh:Z

.field private mObserver:Lcom/miui/player/ui/MusicBrowserActivity$MetaProviderObserver;

.field private mPlaylisttabNum:Landroid/widget/TextView;

.field private mQueryNumTask:Lcom/miui/player/ui/MusicBrowserActivity$QueryNumTask;

.field private mSongtabNum:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 64
    invoke-direct {p0}, Lcom/miui/player/ui/BaseActivity;-><init>()V

    .line 427
    return-void
.end method

.method static synthetic access$200()[I
    .locals 1

    .prologue
    .line 64
    sget-object v0, Lcom/miui/player/ui/MusicBrowserActivity;->sNumArr:[I

    return-object v0
.end method

.method static synthetic access$302(Lcom/miui/player/ui/MusicBrowserActivity;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 64
    iput-boolean p1, p0, Lcom/miui/player/ui/MusicBrowserActivity;->mNeedRefresh:Z

    return p1
.end method

.method static synthetic access$400(Lcom/miui/player/ui/MusicBrowserActivity;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 64
    invoke-direct {p0}, Lcom/miui/player/ui/MusicBrowserActivity;->setNumText()V

    return-void
.end method

.method static synthetic access$502(Lcom/miui/player/ui/MusicBrowserActivity;Lcom/miui/player/ui/MusicBrowserActivity$QueryNumTask;)Lcom/miui/player/ui/MusicBrowserActivity$QueryNumTask;
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 64
    iput-object p1, p0, Lcom/miui/player/ui/MusicBrowserActivity;->mQueryNumTask:Lcom/miui/player/ui/MusicBrowserActivity$QueryNumTask;

    return-object p1
.end method

.method private connectService()V
    .locals 1

    .prologue
    .line 267
    invoke-static {p0}, Lcom/miui/player/drawerActivityGroup/MainActivityGroup;->getServiceFromParent(Landroid/app/Activity;)Lcom/miui/player/IMediaPlaybackService;

    move-result-object v0

    .line 268
    .local v0, service:Lcom/miui/player/IMediaPlaybackService;
    if-nez v0, :cond_0

    .line 269
    invoke-static {p0}, Lcom/miui/player/drawerActivityGroup/DrawerActivityGroup;->finishParent(Landroid/app/Activity;)V

    .line 271
    :cond_0
    return-void
.end method

.method private refreshMediaProvider()V
    .locals 2

    .prologue
    .line 203
    invoke-static {}, Landroid/os/Environment;->isExternalStorageMounted()Z

    move-result v0

    if-nez v0, :cond_0

    .line 213
    :goto_0
    return-void

    .line 207
    :cond_0
    iget-boolean v0, p0, Lcom/miui/player/ui/MusicBrowserActivity;->mIsRefreshMediaProvider:Z

    if-nez v0, :cond_1

    .line 208
    invoke-direct {p0}, Lcom/miui/player/ui/MusicBrowserActivity;->triggerMediaMounted()V

    .line 209
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/player/ui/MusicBrowserActivity;->mIsRefreshMediaProvider:Z

    goto :goto_0

    .line 211
    :cond_1
    const v0, 0x7f08004e

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method

.method private setNumText()V
    .locals 13

    .prologue
    const v12, 0x7f080045

    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 451
    invoke-static {}, Landroid/os/Environment;->isExternalStorageMounted()Z

    move-result v6

    if-nez v6, :cond_0

    .line 452
    const/4 v3, 0x0

    .local v3, i:I
    :goto_0
    const/4 v6, 0x5

    if-ge v3, v6, :cond_0

    .line 453
    sget-object v6, Lcom/miui/player/ui/MusicBrowserActivity;->sNumArr:[I

    aput v10, v6, v3

    .line 452
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 457
    .end local v3           #i:I
    :cond_0
    invoke-virtual {p0, v12}, Lcom/miui/player/ui/MusicBrowserActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    new-array v7, v11, [Ljava/lang/Object;

    sget-object v8, Lcom/miui/player/ui/MusicBrowserActivity;->sNumArr:[I

    aget v8, v8, v10

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v10

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 458
    .local v5, songNumStr:Ljava/lang/String;
    invoke-virtual {p0, v12}, Lcom/miui/player/ui/MusicBrowserActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    new-array v7, v11, [Ljava/lang/Object;

    sget-object v8, Lcom/miui/player/ui/MusicBrowserActivity;->sNumArr:[I

    aget v8, v8, v11

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v10

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 459
    .local v1, artistNumStr:Ljava/lang/String;
    invoke-virtual {p0, v12}, Lcom/miui/player/ui/MusicBrowserActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    new-array v7, v11, [Ljava/lang/Object;

    sget-object v8, Lcom/miui/player/ui/MusicBrowserActivity;->sNumArr:[I

    const/4 v9, 0x2

    aget v8, v8, v9

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v10

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 460
    .local v0, albumNumStr:Ljava/lang/String;
    invoke-virtual {p0, v12}, Lcom/miui/player/ui/MusicBrowserActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    new-array v7, v11, [Ljava/lang/Object;

    sget-object v8, Lcom/miui/player/ui/MusicBrowserActivity;->sNumArr:[I

    const/4 v9, 0x3

    aget v8, v8, v9

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v10

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 461
    .local v4, playlistNumStr:Ljava/lang/String;
    invoke-virtual {p0, v12}, Lcom/miui/player/ui/MusicBrowserActivity;->getString(I)Ljava/lang/String;

    move-result-object v6

    new-array v7, v11, [Ljava/lang/Object;

    sget-object v8, Lcom/miui/player/ui/MusicBrowserActivity;->sNumArr:[I

    const/4 v9, 0x4

    aget v8, v8, v9

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v10

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 462
    .local v2, folderNumStr:Ljava/lang/String;
    iget-object v6, p0, Lcom/miui/player/ui/MusicBrowserActivity;->mSongtabNum:Landroid/widget/TextView;

    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 463
    iget-object v6, p0, Lcom/miui/player/ui/MusicBrowserActivity;->mAlbumtabNum:Landroid/widget/TextView;

    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 464
    iget-object v6, p0, Lcom/miui/player/ui/MusicBrowserActivity;->mArtisttabNum:Landroid/widget/TextView;

    invoke-virtual {v6, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 465
    iget-object v6, p0, Lcom/miui/player/ui/MusicBrowserActivity;->mFoldertabNum:Landroid/widget/TextView;

    invoke-virtual {v6, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 466
    iget-object v6, p0, Lcom/miui/player/ui/MusicBrowserActivity;->mPlaylisttabNum:Landroid/widget/TextView;

    invoke-virtual {v6, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 467
    return-void
.end method

.method private showHelperInfo()V
    .locals 4

    .prologue
    .line 301
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f0800a1

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f080009

    new-instance v3, Lcom/miui/player/ui/MusicBrowserActivity$1;

    invoke-direct {v3, p0}, Lcom/miui/player/ui/MusicBrowserActivity$1;-><init>(Lcom/miui/player/ui/MusicBrowserActivity;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 309
    .local v0, dialog:Landroid/app/Dialog;
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 311
    return-void
.end method

.method private triggerMediaMounted()V
    .locals 4

    .prologue
    .line 217
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.MEDIA_MOUNTED"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "file://"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 219
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "com.android.providers.media"

    const-string v2, "com.android.providers.media.MediaScannerReceiver"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 221
    invoke-virtual {p0, v0}, Lcom/miui/player/ui/MusicBrowserActivity;->sendBroadcast(Landroid/content/Intent;)V

    .line 222
    return-void
.end method

.method private tryToUpdate()V
    .locals 9

    .prologue
    .line 282
    new-instance v4, Lcom/miui/player/helper/VersionManager;

    invoke-direct {v4, p0}, Lcom/miui/player/helper/VersionManager;-><init>(Landroid/content/Context;)V

    .line 283
    .local v4, vm:Lcom/miui/player/helper/VersionManager;
    invoke-virtual {v4}, Lcom/miui/player/helper/VersionManager;->isUpdated()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 284
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v5

    const-string v6, "mounted"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 285
    invoke-virtual {v4}, Lcom/miui/player/helper/VersionManager;->isFirstInstalled()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 286
    invoke-direct {p0}, Lcom/miui/player/ui/MusicBrowserActivity;->showHelperInfo()V

    .line 288
    :cond_0
    invoke-virtual {v4, p0}, Lcom/miui/player/helper/VersionManager;->updateVersionNum(Landroid/content/Context;)V

    .line 298
    :cond_1
    :goto_0
    return-void

    .line 291
    :cond_2
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 292
    .local v2, sp:Landroid/content/SharedPreferences;
    const-string v5, "pref_last_clear_trash_time"

    const-wide/16 v6, 0x0

    invoke-interface {v2, v5, v6, v7}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    .line 293
    .local v0, lastClearTime:J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    sub-long/2addr v5, v0

    const-wide/32 v7, 0x240c8400

    cmp-long v5, v5, v7

    if-lez v5, :cond_1

    .line 294
    new-instance v3, Lcom/miui/player/ui/MusicBrowserActivity$RecycleTrashTask;

    invoke-virtual {p0}, Lcom/miui/player/ui/MusicBrowserActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v3, p0, v5}, Lcom/miui/player/ui/MusicBrowserActivity$RecycleTrashTask;-><init>(Lcom/miui/player/ui/MusicBrowserActivity;Landroid/content/Context;)V

    .line 295
    .local v3, task:Lcom/miui/player/ui/MusicBrowserActivity$RecycleTrashTask;
    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Void;

    invoke-virtual {v3, v5}, Lcom/miui/player/ui/MusicBrowserActivity$RecycleTrashTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0
.end method

.method private updateItemNum()V
    .locals 2

    .prologue
    .line 150
    invoke-static {}, Landroid/os/Environment;->isExternalStorageMounted()Z

    move-result v0

    if-nez v0, :cond_1

    .line 159
    :cond_0
    :goto_0
    return-void

    .line 153
    :cond_1
    iget-object v0, p0, Lcom/miui/player/ui/MusicBrowserActivity;->mQueryNumTask:Lcom/miui/player/ui/MusicBrowserActivity$QueryNumTask;

    if-nez v0, :cond_2

    .line 154
    new-instance v0, Lcom/miui/player/ui/MusicBrowserActivity$QueryNumTask;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/player/ui/MusicBrowserActivity$QueryNumTask;-><init>(Lcom/miui/player/ui/MusicBrowserActivity;Lcom/miui/player/ui/MusicBrowserActivity$1;)V

    iput-object v0, p0, Lcom/miui/player/ui/MusicBrowserActivity;->mQueryNumTask:Lcom/miui/player/ui/MusicBrowserActivity$QueryNumTask;

    .line 156
    :cond_2
    iget-object v0, p0, Lcom/miui/player/ui/MusicBrowserActivity;->mQueryNumTask:Lcom/miui/player/ui/MusicBrowserActivity$QueryNumTask;

    invoke-virtual {v0}, Lcom/miui/player/ui/MusicBrowserActivity$QueryNumTask;->getStatus()Landroid/os/AsyncTask$Status;

    move-result-object v0

    sget-object v1, Landroid/os/AsyncTask$Status;->RUNNING:Landroid/os/AsyncTask$Status;

    if-eq v0, v1, :cond_0

    .line 157
    iget-object v0, p0, Lcom/miui/player/ui/MusicBrowserActivity;->mQueryNumTask:Lcom/miui/player/ui/MusicBrowserActivity$QueryNumTask;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/miui/player/ui/MusicBrowserActivity$QueryNumTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0
.end method


# virtual methods
.method public isEnableScanReceiver()Z
    .locals 1

    .prologue
    .line 500
    const/4 v0, 0x1

    return v0
.end method

.method public isRecoveryCompleteReceiver()Z
    .locals 1

    .prologue
    .line 495
    const/4 v0, 0x1

    return v0
.end method

.method public notifyConnection(Lcom/miui/player/IMediaPlaybackService;)V
    .locals 0
    .parameter "service"

    .prologue
    .line 407
    invoke-direct {p0}, Lcom/miui/player/ui/MusicBrowserActivity;->connectService()V

    .line 408
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 8
    .parameter "icicle"

    .prologue
    const/4 v6, 0x0

    const/4 v7, 0x1

    .line 96
    invoke-super {p0, p1}, Lcom/miui/player/ui/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    .line 97
    iput-boolean v6, p0, Lcom/miui/player/ui/MusicBrowserActivity;->mIsRefreshMediaProvider:Z

    .line 104
    const v4, 0x7f03001c

    invoke-virtual {p0, v4}, Lcom/miui/player/ui/MusicBrowserActivity;->setContentView(I)V

    .line 107
    new-instance v2, Lcom/miui/player/ui/MusicBrowserActivity$OnNavigationClickListener;

    const/4 v4, 0x0

    invoke-direct {v2, p0, v4}, Lcom/miui/player/ui/MusicBrowserActivity$OnNavigationClickListener;-><init>(Lcom/miui/player/ui/MusicBrowserActivity;Lcom/miui/player/ui/MusicBrowserActivity$1;)V

    .line 109
    .local v2, listener:Landroid/view/View$OnClickListener;
    const v4, 0x7f0c0070

    invoke-virtual {p0, v4}, Lcom/miui/player/ui/MusicBrowserActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 110
    const v4, 0x7f0c0072

    invoke-virtual {p0, v4}, Lcom/miui/player/ui/MusicBrowserActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 111
    const v4, 0x7f0c0075

    invoke-virtual {p0, v4}, Lcom/miui/player/ui/MusicBrowserActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 112
    const v4, 0x7f0c007a

    invoke-virtual {p0, v4}, Lcom/miui/player/ui/MusicBrowserActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 113
    const v4, 0x7f0c0077

    invoke-virtual {p0, v4}, Lcom/miui/player/ui/MusicBrowserActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 114
    const v4, 0x7f0c007c

    invoke-virtual {p0, v4}, Lcom/miui/player/ui/MusicBrowserActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 116
    const v4, 0x7f0c006d

    invoke-virtual {p0, v4}, Lcom/miui/player/ui/MusicBrowserActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 117
    .local v3, mainView:Landroid/view/View;
    move-object v0, v3

    check-cast v0, Landroid/view/ViewGroup;

    move-object v4, v0

    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->setAlwaysDrawnWithCacheEnabled(Z)V

    .line 118
    invoke-virtual {v3, v7}, Landroid/view/View;->setDrawingCacheEnabled(Z)V

    .line 120
    const v4, 0x7f0c0071

    invoke-virtual {p0, v4}, Lcom/miui/player/ui/MusicBrowserActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, p0, Lcom/miui/player/ui/MusicBrowserActivity;->mSongtabNum:Landroid/widget/TextView;

    .line 121
    const v4, 0x7f0c0073

    invoke-virtual {p0, v4}, Lcom/miui/player/ui/MusicBrowserActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, p0, Lcom/miui/player/ui/MusicBrowserActivity;->mArtisttabNum:Landroid/widget/TextView;

    .line 122
    const v4, 0x7f0c0076

    invoke-virtual {p0, v4}, Lcom/miui/player/ui/MusicBrowserActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, p0, Lcom/miui/player/ui/MusicBrowserActivity;->mAlbumtabNum:Landroid/widget/TextView;

    .line 123
    const v4, 0x7f0c0078

    invoke-virtual {p0, v4}, Lcom/miui/player/ui/MusicBrowserActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, p0, Lcom/miui/player/ui/MusicBrowserActivity;->mFoldertabNum:Landroid/widget/TextView;

    .line 124
    const v4, 0x7f0c007b

    invoke-virtual {p0, v4}, Lcom/miui/player/ui/MusicBrowserActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, p0, Lcom/miui/player/ui/MusicBrowserActivity;->mPlaylisttabNum:Landroid/widget/TextView;

    .line 125
    new-instance v4, Lcom/miui/player/ui/MusicBrowserActivity$MetaProviderObserver;

    new-instance v5, Landroid/os/Handler;

    invoke-direct {v5}, Landroid/os/Handler;-><init>()V

    invoke-direct {v4, p0, v5}, Lcom/miui/player/ui/MusicBrowserActivity$MetaProviderObserver;-><init>(Lcom/miui/player/ui/MusicBrowserActivity;Landroid/os/Handler;)V

    iput-object v4, p0, Lcom/miui/player/ui/MusicBrowserActivity;->mObserver:Lcom/miui/player/ui/MusicBrowserActivity$MetaProviderObserver;

    .line 127
    invoke-virtual {p0}, Lcom/miui/player/ui/MusicBrowserActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lcom/miui/player/helper/FolderProvider;->instance(Landroid/content/Context;)Lcom/miui/player/helper/FolderProvider;

    move-result-object v1

    .line 128
    .local v1, folderProvider:Lcom/miui/player/helper/FolderProvider;
    invoke-virtual {v1, p0}, Lcom/miui/player/helper/FolderProvider;->addRefreshFolderListener(Lcom/miui/player/helper/FolderProvider$RefreshFolderAsPlaylist;)V

    .line 130
    invoke-direct {p0}, Lcom/miui/player/ui/MusicBrowserActivity;->tryToUpdate()V

    .line 131
    sget-object v4, Lcom/miui/player/ui/MusicBrowserActivity;->sNumArr:[I

    if-nez v4, :cond_0

    .line 132
    const/4 v4, 0x5

    new-array v4, v4, [I

    sput-object v4, Lcom/miui/player/ui/MusicBrowserActivity;->sNumArr:[I

    .line 137
    :goto_0
    invoke-static {p0, p0}, Lcom/miui/player/drawerActivityGroup/MainActivityGroup;->registerParentServiceConnection(Landroid/app/Activity;Lcom/miui/player/drawerActivityGroup/MainActivityGroup$ServiceConnectionObserver;)V

    .line 138
    invoke-static {v6}, Lcom/miui/player/ui/TrackBrowserActivity;->setHasSynchronized(Z)V

    .line 139
    invoke-virtual {p0}, Lcom/miui/player/ui/MusicBrowserActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    sget-object v5, Landroid/provider/MediaStore$Audio$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    iget-object v6, p0, Lcom/miui/player/ui/MusicBrowserActivity;->mObserver:Lcom/miui/player/ui/MusicBrowserActivity$MetaProviderObserver;

    invoke-virtual {v4, v5, v7, v6}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 142
    invoke-virtual {p0}, Lcom/miui/player/ui/MusicBrowserActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    sget-object v5, Lcom/miui/player/provider/PlayerStore$MiuiPlaylists;->EXTERNAL_URI:Landroid/net/Uri;

    iget-object v6, p0, Lcom/miui/player/ui/MusicBrowserActivity;->mObserver:Lcom/miui/player/ui/MusicBrowserActivity$MetaProviderObserver;

    invoke-virtual {v4, v5, v7, v6}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 146
    iput-boolean v7, p0, Lcom/miui/player/ui/MusicBrowserActivity;->mNeedRefresh:Z

    .line 147
    return-void

    .line 134
    :cond_0
    invoke-direct {p0}, Lcom/miui/player/ui/MusicBrowserActivity;->setNumText()V

    goto :goto_0
.end method

.method public onCreateOptionsMenuForParent(Landroid/view/Menu;)Z
    .locals 4
    .parameter "menu"

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 168
    const/4 v0, 0x7

    const v1, 0x7f0800b1

    invoke-interface {p1, v2, v0, v2, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x7f02003b

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 169
    const v0, 0x7f08004c

    invoke-interface {p1, v2, v3, v2, v0}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x7f020038

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 170
    const/4 v0, 0x6

    const v1, 0x7f08003d

    invoke-interface {p1, v2, v0, v2, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x7f020036

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 172
    const/4 v0, 0x3

    const v1, 0x7f08003c

    invoke-interface {p1, v2, v0, v2, v1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x7f020037

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 173
    return v3
.end method

.method protected onDestroy()V
    .locals 3

    .prologue
    .line 275
    invoke-virtual {p0}, Lcom/miui/player/ui/MusicBrowserActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/player/ui/MusicBrowserActivity;->mObserver:Lcom/miui/player/ui/MusicBrowserActivity$MetaProviderObserver;

    invoke-virtual {v1, v2}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 276
    invoke-virtual {p0}, Lcom/miui/player/ui/MusicBrowserActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/player/helper/FolderProvider;->instance(Landroid/content/Context;)Lcom/miui/player/helper/FolderProvider;

    move-result-object v0

    .line 277
    .local v0, folderProvider:Lcom/miui/player/helper/FolderProvider;
    invoke-virtual {v0, p0}, Lcom/miui/player/helper/FolderProvider;->removeRefreshFolder(Lcom/miui/player/helper/FolderProvider$RefreshFolderAsPlaylist;)V

    .line 278
    invoke-super {p0}, Lcom/miui/player/ui/BaseActivity;->onDestroy()V

    .line 279
    return-void
.end method

.method public onOptionsItemSelectedForParent(Landroid/view/MenuItem;)Z
    .locals 4
    .parameter "item"

    .prologue
    const/4 v3, 0x1

    .line 178
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 199
    :pswitch_0
    const/4 v2, 0x0

    :goto_0
    return v2

    .line 180
    :pswitch_1
    new-instance v1, Lcom/miui/player/helper/SleepModeManager;

    invoke-direct {v1}, Lcom/miui/player/helper/SleepModeManager;-><init>()V

    .line 181
    .local v1, sleepModeManager:Lcom/miui/player/helper/SleepModeManager;
    invoke-virtual {v1, p0}, Lcom/miui/player/helper/SleepModeManager;->showSelectTimeDialog(Landroid/app/Activity;)V

    move v2, v3

    .line 182
    goto :goto_0

    .line 185
    .end local v1           #sleepModeManager:Lcom/miui/player/helper/SleepModeManager;
    :pswitch_2
    invoke-direct {p0}, Lcom/miui/player/ui/MusicBrowserActivity;->refreshMediaProvider()V

    move v2, v3

    .line 186
    goto :goto_0

    .line 189
    :pswitch_3
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lcom/miui/player/ui/PreferencesActivity;

    invoke-direct {v0, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 190
    .local v0, settingIntent:Landroid/content/Intent;
    invoke-virtual {p0, v0}, Lcom/miui/player/ui/MusicBrowserActivity;->startActivity(Landroid/content/Intent;)V

    move v2, v3

    .line 191
    goto :goto_0

    .line 194
    .end local v0           #settingIntent:Landroid/content/Intent;
    :pswitch_4
    invoke-static {p0}, Lcom/miui/player/MusicUtils;->quitMediaPlay(Landroid/content/Context;)V

    .line 195
    invoke-static {p0}, Lcom/miui/player/drawerActivityGroup/DrawerActivityGroup;->finishParent(Landroid/app/Activity;)V

    move v2, v3

    .line 196
    goto :goto_0

    .line 178
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_0
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_1
    .end packed-switch
.end method

.method public onPrepareOptionsMenuForParent(Landroid/view/Menu;)Z
    .locals 1
    .parameter "menu"

    .prologue
    .line 163
    const/4 v0, 0x0

    return v0
.end method

.method public onScanReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4
    .parameter "context"
    .parameter "intent"

    .prologue
    const/4 v3, 0x0

    .line 505
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 506
    .local v0, action:Ljava/lang/String;
    iget-boolean v1, p0, Lcom/miui/player/ui/MusicBrowserActivity;->mIsRefreshMediaProvider:Z

    .line 507
    .local v1, isRefreshMediaProvider:Z
    if-nez v1, :cond_1

    .line 516
    :cond_0
    :goto_0
    return-void

    .line 510
    :cond_1
    const-string v2, "android.intent.action.MEDIA_SCANNER_FINISHED"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 511
    const v2, 0x7f08004d

    invoke-static {p1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 512
    iput-boolean v3, p0, Lcom/miui/player/ui/MusicBrowserActivity;->mIsRefreshMediaProvider:Z

    goto :goto_0

    .line 513
    :cond_2
    const-string v2, "android.intent.action.MEDIA_SCANNER_STARTED"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 514
    const v2, 0x7f08004f

    invoke-static {p1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method

.method public refreshAfterRecovery()V
    .locals 1

    .prologue
    .line 479
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/player/ui/MusicBrowserActivity;->mNeedRefresh:Z

    .line 480
    invoke-direct {p0}, Lcom/miui/player/ui/MusicBrowserActivity;->updateItemNum()V

    .line 481
    invoke-super {p0}, Lcom/miui/player/ui/BaseActivity;->refreshAfterRecovery()V

    .line 482
    return-void
.end method

.method public refreshBeforeRecovery()V
    .locals 1

    .prologue
    .line 486
    iget-boolean v0, p0, Lcom/miui/player/ui/MusicBrowserActivity;->mNeedRefresh:Z

    if-eqz v0, :cond_0

    .line 487
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/player/ui/MusicBrowserActivity;->mNeedRefresh:Z

    .line 488
    invoke-direct {p0}, Lcom/miui/player/ui/MusicBrowserActivity;->updateItemNum()V

    .line 490
    :cond_0
    invoke-super {p0}, Lcom/miui/player/ui/BaseActivity;->refreshBeforeRecovery()V

    .line 491
    return-void
.end method

.method public refreshFolderPlaylistId()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    .line 471
    invoke-virtual {p0}, Lcom/miui/player/ui/MusicBrowserActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/miui/player/helper/FolderProvider;->instance(Landroid/content/Context;)Lcom/miui/player/helper/FolderProvider;

    move-result-object v1

    .line 472
    .local v1, folderProvider:Lcom/miui/player/helper/FolderProvider;
    sget-object v2, Lcom/miui/player/ui/MusicBrowserActivity;->sNumArr:[I

    invoke-virtual {v1}, Lcom/miui/player/helper/FolderProvider;->getFolderCount()I

    move-result v3

    aput v3, v2, v6

    .line 473
    const v2, 0x7f080045

    invoke-virtual {p0, v2}, Lcom/miui/player/ui/MusicBrowserActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    sget-object v5, Lcom/miui/player/ui/MusicBrowserActivity;->sNumArr:[I

    aget v5, v5, v6

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 474
    .local v0, folderNumStr:Ljava/lang/String;
    iget-object v2, p0, Lcom/miui/player/ui/MusicBrowserActivity;->mFoldertabNum:Landroid/widget/TextView;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 475
    return-void
.end method
