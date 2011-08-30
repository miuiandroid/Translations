.class public Lcom/miui/player/MusicUtils;
.super Ljava/lang/Object;
.source "MusicUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/player/MusicUtils$ScanInfo;,
        Lcom/miui/player/MusicUtils$NavigationListener;,
        Lcom/miui/player/MusicUtils$ServiceBinder;,
        Lcom/miui/player/MusicUtils$OnDialogCallback;,
        Lcom/miui/player/MusicUtils$Defs;
    }
.end annotation


# static fields
.field private static final ESCAPE_CHAR:C = '\\'

.field public static final ESCAPE_CLAUSE:Ljava/lang/String; = " ESCAPE \'\\\'"

.field private static final INVALID_CHAR:[C = null

.field private static final KiloBytes:J = 0x400L

.field private static final MigBytes:J = 0x100000L

.field private static final TAG:Ljava/lang/String; = "MusicUtils"

.field private static mLastSdStatus:Ljava/lang/String;

.field private static sConnectionMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Landroid/content/Context;",
            "Lcom/miui/player/MusicUtils$ServiceBinder;",
            ">;"
        }
    .end annotation
.end field

.field private static final sEmptyList:[J

.field private static sFormatBuilder:Ljava/lang/StringBuilder;

.field private static sFormatter:Ljava/util/Formatter;

.field public static sService:Lcom/miui/player/IMediaPlaybackService;

.field private static final sTimeArgs:[Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 175
    const/4 v0, 0x0

    sput-object v0, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    .line 177
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/miui/player/MusicUtils;->sConnectionMap:Ljava/util/HashMap;

    .line 283
    const/4 v0, 0x0

    new-array v0, v0, [J

    sput-object v0, Lcom/miui/player/MusicUtils;->sEmptyList:[J

    .line 1030
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sput-object v0, Lcom/miui/player/MusicUtils;->sFormatBuilder:Ljava/lang/StringBuilder;

    .line 1032
    new-instance v0, Ljava/util/Formatter;

    sget-object v1, Lcom/miui/player/MusicUtils;->sFormatBuilder:Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/util/Formatter;-><init>(Ljava/lang/Appendable;Ljava/util/Locale;)V

    sput-object v0, Lcom/miui/player/MusicUtils;->sFormatter:Ljava/util/Formatter;

    .line 1034
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/Object;

    sput-object v0, Lcom/miui/player/MusicUtils;->sTimeArgs:[Ljava/lang/Object;

    .line 1758
    const/4 v0, 0x3

    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Lcom/miui/player/MusicUtils;->INVALID_CHAR:[C

    return-void

    nop

    :array_0
    .array-data 0x2
        0x25t 0x0t
        0x3ft 0x0t
        0x5ft 0x0t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1528
    return-void
.end method

.method public static addOnlineToPlaylist(Landroid/content/Context;Lcom/xiaomi/common2/musicsearch/MusicInfoSongList$SongItem;J)V
    .locals 2
    .parameter "context"
    .parameter "songItem"
    .parameter "playlistId"

    .prologue
    .line 745
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/xiaomi/common2/musicsearch/MusicInfoSongList$SongItem;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-static {p0, v0, p2, p3}, Lcom/miui/player/MusicUtils;->addOnlineToPlaylist(Landroid/content/Context;[Lcom/xiaomi/common2/musicsearch/MusicInfoSongList$SongItem;J)V

    .line 748
    return-void
.end method

.method public static addOnlineToPlaylist(Landroid/content/Context;[Lcom/xiaomi/common2/musicsearch/MusicInfoSongList$SongItem;J)V
    .locals 9
    .parameter "context"
    .parameter "songItems"
    .parameter "playlistId"

    .prologue
    .line 791
    if-eqz p1, :cond_0

    array-length v7, p1

    if-nez v7, :cond_2

    .line 792
    :cond_0
    const-string v7, "MusicBase"

    const-string v8, "ListSelection null"

    invoke-static {v7, v8}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 821
    :cond_1
    :goto_0
    return-void

    .line 794
    :cond_2
    invoke-static {p2, p3}, Lcom/miui/player/provider/PlayerStore$MiuiPlaylists$Members;->getMembersUri(J)Landroid/net/Uri;

    move-result-object v5

    .line 796
    .local v5, uri:Landroid/net/Uri;
    invoke-static {p0, v5}, Lcom/miui/player/provider/PlayerProviderUtils;->getRecordCount(Landroid/content/Context;Landroid/net/Uri;)I

    move-result v0

    .line 798
    .local v0, base:I
    invoke-static {p0, v5}, Lcom/miui/player/MusicUtils;->getExistOnLineIdList(Landroid/content/Context;Landroid/net/Uri;)Ljava/util/ArrayList;

    move-result-object v1

    .line 799
    .local v1, existOnlineIdlist:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-static {p1, v1}, Lcom/miui/player/MusicUtils;->getOnlineAddList([Lcom/xiaomi/common2/musicsearch/MusicInfoSongList$SongItem;Ljava/util/ArrayList;)[Lcom/xiaomi/common2/musicsearch/MusicInfoSongList$SongItem;

    move-result-object p1

    .line 800
    if-eqz p1, :cond_1

    .line 803
    invoke-static {p0, p1, v0}, Lcom/miui/player/provider/PlayerProviderUtils;->createMemberInfoByProviderId(Landroid/content/Context;[Lcom/xiaomi/common2/musicsearch/MusicInfoSongList$SongItem;I)Ljava/util/ArrayList;

    move-result-object v4

    .line 806
    .local v4, res:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/content/ContentValues;>;"
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v7

    new-array v6, v7, [Landroid/content/ContentValues;

    .line 807
    .local v6, values:[Landroid/content/ContentValues;
    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 808
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    invoke-virtual {v7, v5, v6}, Landroid/content/ContentResolver;->bulkInsert(Landroid/net/Uri;[Landroid/content/ContentValues;)I

    .line 810
    array-length v7, p1

    invoke-static {p0, p2, p3, v7}, Lcom/miui/player/MusicUtils;->notifyAddToPlaylist(Landroid/content/Context;JI)V

    .line 812
    invoke-static {p2, p3}, Lcom/miui/player/helper/FavoritePlaylist;->isFavoritePlaylistId(J)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 813
    array-length v7, p1

    new-array v3, v7, [Ljava/lang/String;

    .line 814
    .local v3, providerIds:[Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, i:I
    :goto_1
    array-length v7, p1

    if-ge v2, v7, :cond_3

    .line 815
    aget-object v7, p1, v2

    iget-object v7, v7, Lcom/xiaomi/common2/musicsearch/MusicInfoSongList$SongItem;->Id:Ljava/lang/String;

    aput-object v7, v3, v2

    .line 814
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 818
    :cond_3
    invoke-static {p0, v3}, Lcom/miui/player/helper/FavoritePlaylist;->add(Landroid/content/Context;[Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static addToCurrentPlaylist(Landroid/content/Context;[J)V
    .locals 9
    .parameter "context"
    .parameter "list"

    .prologue
    .line 694
    sget-object v0, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    if-eqz v0, :cond_0

    if-nez p1, :cond_1

    .line 733
    .end local p0
    .end local p1
    :cond_0
    :goto_0
    return-void

    .line 698
    .restart local p0
    .restart local p1
    :cond_1
    :try_start_0
    array-length v0, p1

    .line 699
    .local v0, addlen:I
    sget-object v1, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    invoke-interface {v1}, Lcom/miui/player/IMediaPlaybackService;->getQueue()[J

    move-result-object v1

    .line 700
    .local v1, currentList:[J
    if-eqz v1, :cond_4

    array-length v2, v1

    if-lez v2, :cond_4

    .line 701
    const/4 v2, 0x0

    .local v2, i:I
    :goto_1
    array-length v3, p1

    if-ge v2, v3, :cond_4

    if-lez v0, :cond_4

    .line 702
    aget-wide v4, p1, v2

    .line 703
    .local v4, tmp:J
    const/4 v3, 0x0

    .local v3, j:I
    :goto_2
    array-length v6, v1

    if-ge v3, v6, :cond_2

    .line 704
    aget-wide v6, v1, v3

    cmp-long v6, v6, v4

    if-nez v6, :cond_3

    .line 705
    add-int/lit8 v0, v0, -0x1

    .line 706
    const-wide/16 v3, -0x1

    aput-wide v3, p1, v2

    .line 701
    .end local v3           #j:I
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 703
    .restart local v3       #j:I
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .end local v2           #i:I
    .end local v3           #j:I
    .end local v4           #tmp:J
    :cond_4
    move v1, v0

    .line 713
    .end local v0           #addlen:I
    .local v1, addlen:I
    if-lez v1, :cond_6

    .line 714
    move-object v0, p1

    .line 715
    .local v0, addList:[J
    array-length v2, p1

    if-eq v1, v2, :cond_5

    .line 716
    new-array v0, v1, [J

    .line 717
    const/4 v3, 0x0

    .line 718
    .restart local v3       #j:I
    const/4 v2, 0x0

    .restart local v2       #i:I
    move v4, v3

    .end local v3           #j:I
    .local v4, j:I
    :goto_3
    array-length v3, p1

    if-ge v2, v3, :cond_5

    if-ge v4, v1, :cond_5

    .line 719
    aget-wide v5, p1, v2

    .line 720
    .local v5, tmp:J
    const-wide/16 v7, -0x1

    cmp-long v3, v5, v7

    if-eqz v3, :cond_7

    .line 721
    add-int/lit8 v3, v4, 0x1

    .end local v4           #j:I
    .restart local v3       #j:I
    aget-wide v5, p1, v2

    .end local v5           #tmp:J
    aput-wide v5, v0, v4

    .line 718
    :goto_4
    add-int/lit8 v2, v2, 0x1

    move v4, v3

    .end local v3           #j:I
    .restart local v4       #j:I
    goto :goto_3

    .line 726
    .end local v2           #i:I
    .end local v4           #j:I
    :cond_5
    sget-object v1, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    .end local v1           #addlen:I
    const/4 v2, 0x3

    invoke-interface {v1, v0, v2}, Lcom/miui/player/IMediaPlaybackService;->enqueue([JI)V

    .line 728
    .end local v0           #addList:[J
    :cond_6
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f090003

    array-length v2, p1

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    array-length p1, p1

    .end local p1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v3, v4

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 730
    .local p1, message:Ljava/lang/String;
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    .end local p0
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 731
    .end local p1           #message:Ljava/lang/String;
    :catch_0
    move-exception p0

    goto :goto_0

    .restart local v0       #addList:[J
    .restart local v1       #addlen:I
    .restart local v2       #i:I
    .restart local v4       #j:I
    .restart local v5       #tmp:J
    .restart local p0
    .local p1, list:[J
    :cond_7
    move v3, v4

    .end local v4           #j:I
    .restart local v3       #j:I
    goto :goto_4
.end method

.method public static addToMiuiAudioFolder(Landroid/content/Context;Ljava/util/HashSet;)V
    .locals 7
    .parameter "context"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1373
    .local p1, selectFolder:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/String;>;"
    invoke-virtual {p1}, Ljava/util/HashSet;->size()I

    move-result v5

    if-nez v5, :cond_0

    .line 1387
    :goto_0
    return-void

    .line 1377
    :cond_0
    invoke-virtual {p1}, Ljava/util/HashSet;->size()I

    move-result v5

    new-array v4, v5, [Landroid/content/ContentValues;

    .line 1378
    .local v4, values:[Landroid/content/ContentValues;
    const/4 v2, 0x0

    .line 1379
    .local v2, index:I
    invoke-virtual {p1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 1380
    .local v3, path:Ljava/lang/String;
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 1381
    .local v0, cv:Landroid/content/ContentValues;
    const-string v5, "folder_path"

    invoke-virtual {v0, v5, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1382
    aput-object v0, v4, v2

    .line 1383
    add-int/lit8 v2, v2, 0x1

    .line 1384
    goto :goto_1

    .line 1386
    .end local v0           #cv:Landroid/content/ContentValues;
    .end local v3           #path:Ljava/lang/String;
    :cond_1
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    sget-object v6, Lcom/miui/player/provider/PlayerStore$MiuiAudioFolder;->EXTERNAL_URI:Landroid/net/Uri;

    invoke-virtual {v5, v6, v4}, Landroid/content/ContentResolver;->bulkInsert(Landroid/net/Uri;[Landroid/content/ContentValues;)I

    goto :goto_0
.end method

.method public static addToPlaylist(Landroid/content/Context;JJ)V
    .locals 3
    .parameter "context"
    .parameter "id"
    .parameter "playlistid"

    .prologue
    const/4 v2, 0x1

    .line 824
    new-array v0, v2, [J

    const/4 v1, 0x0

    aput-wide p1, v0, v1

    invoke-static {p0, v0, p3, p4, v2}, Lcom/miui/player/MusicUtils;->addToPlaylist(Landroid/content/Context;[JJZ)V

    .line 827
    return-void
.end method

.method public static addToPlaylist(Landroid/content/Context;[JJZ)V
    .locals 6
    .parameter "context"
    .parameter "ids"
    .parameter "playlistId"
    .parameter "needNotify"

    .prologue
    .line 876
    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move v4, p4

    invoke-static/range {v0 .. v5}, Lcom/miui/player/MusicUtils;->addToPlaylist(Landroid/content/Context;[JJZZ)V

    .line 877
    return-void
.end method

.method public static addToPlaylist(Landroid/content/Context;[JJZZ)V
    .locals 10
    .parameter "context"
    .parameter "ids"
    .parameter "playlistId"
    .parameter "needNotify"
    .parameter "needFilter"

    .prologue
    .line 881
    if-eqz p1, :cond_0

    array-length v8, p1

    if-nez v8, :cond_2

    .line 884
    :cond_0
    const-string v8, "MusicBase"

    const-string v9, "ListSelection null"

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 915
    :cond_1
    return-void

    .line 886
    :cond_2
    invoke-static {p2, p3}, Lcom/miui/player/provider/PlayerStore$MiuiPlaylists$Members;->getMembersUri(J)Landroid/net/Uri;

    move-result-object v6

    .line 887
    .local v6, uri:Landroid/net/Uri;
    invoke-static {p0, v6}, Lcom/miui/player/provider/PlayerProviderUtils;->getRecordCount(Landroid/content/Context;Landroid/net/Uri;)I

    move-result v1

    .line 888
    .local v1, base:I
    if-eqz p5, :cond_3

    .line 889
    invoke-static {p1, v6, p0}, Lcom/miui/player/MusicUtils;->getLocalAddAudioList([JLandroid/net/Uri;Landroid/content/Context;)[J

    move-result-object v0

    .line 890
    .local v0, addAudioIdList:[J
    if-eqz v0, :cond_1

    .line 893
    move-object p1, v0

    .line 895
    .end local v0           #addAudioIdList:[J
    :cond_3
    invoke-static {p0, p1, v1}, Lcom/miui/player/provider/PlayerProviderUtils;->createMemberInfoById(Landroid/content/Context;[JI)Ljava/util/ArrayList;

    move-result-object v5

    .line 897
    .local v5, res:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/content/ContentValues;>;"
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v8

    new-array v7, v8, [Landroid/content/ContentValues;

    .line 898
    .local v7, values:[Landroid/content/ContentValues;
    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 899
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    invoke-virtual {v8, v6, v7}, Landroid/content/ContentResolver;->bulkInsert(Landroid/net/Uri;[Landroid/content/ContentValues;)I

    .line 900
    if-eqz p4, :cond_4

    .line 901
    array-length v8, p1

    invoke-static {p0, p2, p3, v8}, Lcom/miui/player/MusicUtils;->notifyAddToPlaylist(Landroid/content/Context;JI)V

    .line 904
    :cond_4
    invoke-static {p2, p3}, Lcom/miui/player/helper/FavoritePlaylist;->isFavoritePlaylistId(J)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 905
    invoke-static {p0, p1}, Lcom/miui/player/helper/FavoritePlaylist;->add(Landroid/content/Context;[J)Z

    move-result v8

    if-nez v8, :cond_1

    .line 906
    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :cond_5
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/ContentValues;

    .line 907
    .local v2, cv:Landroid/content/ContentValues;
    const-string v8, "online_id"

    invoke-virtual {v2, v8}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 908
    .local v4, providerId:Ljava/lang/String;
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_5

    .line 909
    invoke-static {p0, v4}, Lcom/miui/player/helper/FavoritePlaylist;->add(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static bindToService(Landroid/content/Context;)Z
    .locals 1
    .parameter "context"

    .prologue
    .line 180
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/miui/player/MusicUtils;->bindToService(Landroid/content/Context;Landroid/content/ServiceConnection;)Z

    move-result v0

    return v0
.end method

.method public static bindToService(Landroid/content/Context;Landroid/content/ServiceConnection;)Z
    .locals 4
    .parameter "context"
    .parameter "callback"

    .prologue
    const-class v3, Lcom/miui/player/MediaPlaybackService;

    .line 184
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/miui/player/MediaPlaybackService;

    invoke-direct {v1, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 185
    new-instance v0, Lcom/miui/player/MusicUtils$ServiceBinder;

    invoke-direct {v0, p1}, Lcom/miui/player/MusicUtils$ServiceBinder;-><init>(Landroid/content/ServiceConnection;)V

    .line 186
    .local v0, sb:Lcom/miui/player/MusicUtils$ServiceBinder;
    sget-object v1, Lcom/miui/player/MusicUtils;->sConnectionMap:Ljava/util/HashMap;

    invoke-virtual {v1, p0, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 187
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    const-class v2, Lcom/miui/player/MediaPlaybackService;

    invoke-virtual {v1, p0, v3}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v0, v2}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v1

    return v1
.end method

.method public static clearPlaylist(Landroid/content/Context;I)V
    .locals 4
    .parameter "context"
    .parameter "plid"

    .prologue
    const/4 v3, 0x0

    .line 445
    int-to-long v1, p1

    invoke-static {v1, v2}, Lcom/miui/player/provider/PlayerStore$MiuiPlaylists$Members;->getMembersUri(J)Landroid/net/Uri;

    move-result-object v0

    .line 446
    .local v0, uri:Landroid/net/Uri;
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {v1, v0, v3, v3}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 447
    return-void
.end method

.method public static clearPlaylistLocalLib(Landroid/content/Context;I)V
    .locals 6
    .parameter "context"
    .parameter "plid"

    .prologue
    .line 451
    int-to-long v2, p1

    invoke-static {v2, v3}, Lcom/miui/player/provider/PlayerStore$MiuiPlaylists$Members;->getMembersUri(J)Landroid/net/Uri;

    move-result-object v0

    .line 452
    .local v0, uri:Landroid/net/Uri;
    const-string v2, "%s < %d"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "audio_id"

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const v5, 0x1fffffff

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 454
    .local v1, where:Ljava/lang/String;
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v0, v1, v3}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 455
    return-void
.end method

.method public static clearQueue()V
    .locals 3

    .prologue
    .line 1168
    :try_start_0
    sget-object v0, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    const/4 v1, 0x0

    const v2, 0x7fffffff

    invoke-interface {v0, v1, v2}, Lcom/miui/player/IMediaPlaybackService;->removeTracks(II)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1171
    :goto_0
    return-void

    .line 1169
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public static createEqualizerConfig(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;
    .locals 8
    .parameter "context"
    .parameter "name"
    .parameter "data"

    .prologue
    const/4 v7, 0x0

    .line 2123
    const/4 v2, 0x0

    .line 2124
    .local v2, uri:Landroid/net/Uri;
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 2125
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 2126
    .local v1, resolver:Landroid/content/ContentResolver;
    new-instance v3, Landroid/content/ContentValues;

    const/4 v4, 0x2

    invoke-direct {v3, v4}, Landroid/content/ContentValues;-><init>(I)V

    .line 2127
    .local v3, values:Landroid/content/ContentValues;
    const-string v4, "name"

    invoke-virtual {v3, v4, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2128
    const-string v4, "_data"

    invoke-virtual {v3, v4, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2130
    invoke-static {p0, p1}, Lcom/miui/player/MusicUtils;->idForEqualizer(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    .line 2131
    .local v0, id:I
    if-ltz v0, :cond_1

    .line 2132
    sget-object v4, Lcom/miui/player/provider/PlayerStore$MiuiEqualizer;->EXTERNAL_URI:Landroid/net/Uri;

    int-to-long v5, v0

    invoke-static {v4, v5, v6}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v2

    .line 2133
    invoke-virtual {v1, v2, v3, v7, v7}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2139
    .end local v0           #id:I
    .end local v1           #resolver:Landroid/content/ContentResolver;
    .end local v3           #values:Landroid/content/ContentValues;
    :cond_0
    :goto_0
    return-object v2

    .line 2135
    .restart local v0       #id:I
    .restart local v1       #resolver:Landroid/content/ContentResolver;
    .restart local v3       #values:Landroid/content/ContentValues;
    :cond_1
    sget-object v4, Lcom/miui/player/provider/PlayerStore$MiuiEqualizer;->EXTERNAL_URI:Landroid/net/Uri;

    invoke-virtual {v1, v4, v3}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v2

    goto :goto_0
.end method

.method public static createPlaylist(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/net/Uri;
    .locals 8
    .parameter "context"
    .parameter "name"
    .parameter "path"
    .parameter "clear"

    .prologue
    .line 477
    const/4 v3, 0x0

    .line 478
    .local v3, uri:Landroid/net/Uri;
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 479
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    .line 480
    .local v2, resolver:Landroid/content/ContentResolver;
    const/4 v0, -0x1

    .line 481
    .local v0, id:I
    if-nez p2, :cond_1

    .line 482
    const/4 v5, 0x2

    new-array v5, v5, [J

    fill-array-data v5, :array_0

    invoke-static {p0, p1, v5}, Lcom/miui/player/MusicUtils;->idForplaylist(Landroid/content/Context;Ljava/lang/String;[J)I

    move-result v0

    .line 490
    :goto_0
    if-ltz v0, :cond_2

    .line 491
    sget-object v5, Lcom/miui/player/provider/PlayerStore$MiuiPlaylists;->EXTERNAL_URI:Landroid/net/Uri;

    int-to-long v6, v0

    invoke-static {v5, v6, v7}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v3

    .line 492
    if-eqz p3, :cond_0

    .line 493
    invoke-static {p0, v0}, Lcom/miui/player/MusicUtils;->clearPlaylist(Landroid/content/Context;I)V

    .line 511
    .end local v0           #id:I
    .end local v2           #resolver:Landroid/content/ContentResolver;
    :cond_0
    :goto_1
    return-object v3

    .line 488
    .restart local v0       #id:I
    .restart local v2       #resolver:Landroid/content/ContentResolver;
    :cond_1
    invoke-static {p0, p2}, Lcom/miui/player/MusicUtils;->idForPlaylistByPath(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    goto :goto_0

    .line 496
    :cond_2
    new-instance v4, Landroid/content/ContentValues;

    const/4 v5, 0x1

    invoke-direct {v4, v5}, Landroid/content/ContentValues;-><init>(I)V

    .line 497
    .local v4, values:Landroid/content/ContentValues;
    const-string v5, "name"

    invoke-virtual {v4, v5, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 498
    const/4 v1, 0x0

    .line 499
    .local v1, playlistType:I
    const-string v5, "$$miui"

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 500
    const/4 v1, 0x3

    .line 502
    :cond_3
    if-eqz p2, :cond_4

    .line 503
    const/4 v1, 0x1

    .line 505
    :cond_4
    const-string v5, "list_type"

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 506
    const-string v5, "folder_path"

    invoke-virtual {v4, v5, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 507
    sget-object v5, Lcom/miui/player/provider/PlayerStore$MiuiPlaylists;->EXTERNAL_URI:Landroid/net/Uri;

    invoke-virtual {v2, v5, v4}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v3

    goto :goto_1

    .line 482
    nop

    :array_0
    .array-data 0x8
        0x0t 0x0t 0x0t 0x0t 0x0t 0x0t 0x0t 0x0t
        0x3t 0x0t 0x0t 0x0t 0x0t 0x0t 0x0t 0x0t
    .end array-data
.end method

.method public static createPlaylist(Landroid/content/Context;Ljava/lang/String;Z)Landroid/net/Uri;
    .locals 1
    .parameter "context"
    .parameter "name"
    .parameter "clear"

    .prologue
    .line 472
    const/4 v0, 0x0

    invoke-static {p0, p1, v0, p2}, Lcom/miui/player/MusicUtils;->createPlaylist(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public static deletePlaylist(Landroid/content/Context;I)V
    .locals 4
    .parameter "context"
    .parameter "plid"

    .prologue
    .line 459
    const/4 v0, 0x1

    new-array v0, v0, [J

    const/4 v1, 0x0

    int-to-long v2, p1

    aput-wide v2, v0, v1

    invoke-static {p0, v0}, Lcom/miui/player/MusicUtils;->deletePlaylist(Landroid/content/Context;[J)V

    .line 463
    return-void
.end method

.method public static deletePlaylist(Landroid/content/Context;[J)V
    .locals 4
    .parameter "context"
    .parameter "plidlist"

    .prologue
    .line 466
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "_id IN "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p1}, Lcom/miui/player/provider/PlayerProviderUtils;->concatIdsAsSet([J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 468
    .local v0, inClause:Ljava/lang/String;
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Lcom/miui/player/provider/PlayerStore$MiuiPlaylists;->EXTERNAL_URI:Landroid/net/Uri;

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 469
    return-void
.end method

.method public static deleteTrackByName(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 13
    .parameter "context"
    .parameter "path"
    .parameter "onlineId"

    .prologue
    const/4 v10, 0x1

    const/4 v12, 0x0

    .line 575
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 604
    :cond_0
    :goto_0
    return-void

    .line 579
    :cond_1
    new-array v2, v10, [Ljava/lang/String;

    const-string v0, "_id"

    aput-object v0, v2, v12

    .line 582
    .local v2, PROJECTION:[Ljava/lang/String;
    const-string v9, "_data=?"

    .line 584
    .local v9, where:Ljava/lang/String;
    new-array v4, v10, [Ljava/lang/String;

    aput-object p1, v4, v12

    .line 588
    .local v4, ARGS:[Ljava/lang/String;
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/MediaStore$Audio$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    const-string v3, "_data=?"

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 590
    .local v6, c:Landroid/database/Cursor;
    if-eqz v6, :cond_0

    .line 591
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 592
    invoke-interface {v6, v12}, Landroid/database/Cursor;->getInt(I)I

    move-result v8

    .line 594
    .local v8, id:I
    :try_start_0
    sget-object v0, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    if-eqz v0, :cond_2

    if-eqz p2, :cond_2

    sget-object v0, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    invoke-interface {v0}, Lcom/miui/player/IMediaPlaybackService;->getOnlineId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 595
    sget-object v0, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    invoke-interface {v0}, Lcom/miui/player/IMediaPlaybackService;->next()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 600
    :cond_2
    :goto_1
    new-array v0, v10, [J

    int-to-long v10, v8

    aput-wide v10, v0, v12

    invoke-static {p0, v0}, Lcom/miui/player/MusicUtils;->deleteTracks(Landroid/content/Context;[J)V

    .line 602
    .end local v8           #id:I
    :cond_3
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto :goto_0

    .line 597
    .restart local v8       #id:I
    :catch_0
    move-exception v0

    move-object v7, v0

    .line 598
    .local v7, e:Landroid/os/RemoteException;
    invoke-virtual {v7}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_1
.end method

.method public static deleteTracks(Landroid/content/Context;[J)V
    .locals 10
    .parameter "context"
    .parameter "list"

    .prologue
    .line 608
    const/4 v0, 0x6

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "_id"

    aput-object v1, v2, v0

    const/4 v0, 0x1

    const-string v1, "_data"

    aput-object v1, v2, v0

    const/4 v0, 0x2

    const-string v1, "album_id"

    aput-object v1, v2, v0

    const/4 v0, 0x3

    const-string v1, "artist"

    aput-object v1, v2, v0

    const/4 v0, 0x4

    const-string v1, "title"

    aput-object v1, v2, v0

    const/4 v0, 0x5

    const-string v1, "album"

    aput-object v1, v2, v0

    .line 613
    .local v2, cols:[Ljava/lang/String;
    invoke-static {p1}, Lcom/miui/player/provider/PlayerProviderUtils;->concatIdsAsSet([J)Ljava/lang/String;

    move-result-object v0

    .line 614
    .local v0, idSet:Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "_id IN "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .end local v0           #idSet:Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 615
    .local v9, where:Ljava/lang/String;
    sget-object v1, Landroid/provider/MediaStore$Audio$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-static {p0, v9}, Lcom/miui/player/MusicUtils;->wrapWithBlacklist(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    invoke-static/range {v0 .. v5}, Lcom/miui/player/MusicUtils;->query(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4

    .line 618
    .local v4, c:Landroid/database/Cursor;
    if-eqz v4, :cond_4

    .line 619
    const-string v0, "artist"

    invoke-interface {v4, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    .line 620
    .local v3, artistCol:I
    const-string v0, "title"

    invoke-interface {v4, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v8

    .line 621
    .local v8, titleCol:I
    const-string v0, "album"

    invoke-interface {v4, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    .line 622
    .local v1, albumCol:I
    const-string v0, "_data"

    invoke-interface {v4, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v5

    .line 627
    .local v5, dataCol:I
    :try_start_0
    invoke-interface {v4}, Landroid/database/Cursor;->moveToFirst()Z

    .line 628
    .end local v2           #cols:[Ljava/lang/String;
    :goto_0
    invoke-interface {v4}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v0

    if-nez v0, :cond_1

    .line 630
    invoke-interface {v4, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 631
    .local v6, title:Ljava/lang/String;
    invoke-interface {v4, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 632
    .local v2, artist:Ljava/lang/String;
    invoke-interface {v4, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 634
    .local v0, album:Ljava/lang/String;
    invoke-static {v6, v0, v2}, Lcom/miui/player/helper/MusicMetaManager;->deleteRelateFiles(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 637
    const/4 v0, 0x0

    invoke-interface {v4, v0}, Landroid/database/Cursor;->getLong(I)J

    .end local v0           #album:Ljava/lang/String;
    move-result-wide v6

    .line 638
    .local v6, id:J
    sget-object v0, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    if-eqz v0, :cond_0

    .line 639
    sget-object v0, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    invoke-interface {v0, v6, v7}, Lcom/miui/player/IMediaPlaybackService;->removeTrack(J)I

    .line 642
    :cond_0
    invoke-static {p0, v6, v7}, Lcom/miui/player/helper/FavoritePlaylist;->remove(Landroid/content/Context;J)V

    .line 644
    invoke-interface {v4}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 646
    .end local v2           #artist:Ljava/lang/String;
    .end local v6           #id:J
    :catch_0
    move-exception v0

    .line 650
    :cond_1
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 651
    .local v0, res:Landroid/content/ContentResolver;
    sget-object v1, Landroid/provider/MediaStore$Audio$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    .end local v1           #albumCol:I
    invoke-virtual {v9}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 654
    .end local v3           #artistCol:I
    invoke-interface {v4}, Landroid/database/Cursor;->moveToFirst()Z

    .line 655
    .end local v0           #res:Landroid/content/ContentResolver;
    :goto_1
    invoke-interface {v4}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v0

    if-nez v0, :cond_3

    .line 656
    invoke-interface {v4, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 657
    .local v1, name:Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 660
    .local v0, f:Ljava/io/File;
    :try_start_1
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v0

    .end local v0           #f:Ljava/io/File;
    if-nez v0, :cond_2

    .line 663
    const-string v0, "MusicUtils"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to delete file "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .end local v1           #name:Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 666
    :cond_2
    invoke-interface {v4}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    .line 667
    :catch_1
    move-exception v0

    .line 668
    .local v0, ex:Ljava/lang/SecurityException;
    invoke-interface {v4}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_1

    .line 671
    .end local v0           #ex:Ljava/lang/SecurityException;
    :cond_3
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 674
    .end local v5           #dataCol:I
    .end local v8           #titleCol:I
    :cond_4
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f090002

    array-length v2, p1

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    array-length v5, p1

    .end local v4           #c:Landroid/database/Cursor;
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 677
    .local v0, message:Ljava/lang/String;
    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .end local v0           #message:Ljava/lang/String;
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 681
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "content://media"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 683
    invoke-static {p0, p1}, Lcom/miui/player/provider/PlayerProviderUtils;->synchronizeMiuiPlaylist(Landroid/content/Context;[J)V

    .line 684
    return-void
.end method

.method public static displayDatabaseError(Landroid/app/Activity;Lcom/miui/player/MusicUtils$OnDialogCallback;)V
    .locals 11
    .parameter "a"
    .parameter "l"

    .prologue
    const/16 v10, 0x8

    const/4 v9, 0x0

    .line 958
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v2

    .line 959
    .local v2, status:Ljava/lang/String;
    const v3, 0x7f080023

    .line 960
    .local v3, title:I
    const v1, 0x7f080024

    .line 962
    .local v1, message:I
    const-string v6, "shared"

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    const-string v6, "unmounted"

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 963
    :cond_0
    const v3, 0x7f080021

    .line 964
    const v1, 0x7f080022

    .line 980
    :cond_1
    :goto_0
    invoke-virtual {p0, v3}, Landroid/app/Activity;->setTitle(I)V

    .line 981
    const v6, 0x7f0c009b

    invoke-virtual {p0, v6}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    .line 982
    .local v5, v:Landroid/view/View;
    if-eqz v5, :cond_2

    .line 983
    invoke-virtual {v5, v9}, Landroid/view/View;->setVisibility(I)V

    .line 984
    move-object v0, v5

    check-cast v0, Landroid/widget/TextView;

    move-object v4, v0

    .line 985
    .local v4, tv:Landroid/widget/TextView;
    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setText(I)V

    .line 987
    .end local v4           #tv:Landroid/widget/TextView;
    :cond_2
    const v6, 0x7f0c009a

    invoke-virtual {p0, v6}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    .line 988
    if-eqz v5, :cond_3

    .line 989
    invoke-virtual {v5, v9}, Landroid/view/View;->setVisibility(I)V

    .line 991
    :cond_3
    const v6, 0x102000a

    invoke-virtual {p0, v6}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    .line 992
    if-eqz v5, :cond_4

    .line 993
    invoke-virtual {v5, v10}, Landroid/view/View;->setVisibility(I)V

    .line 996
    :cond_4
    const v6, 0x7f0c000d

    invoke-virtual {p0, v6}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    .line 997
    if-eqz v5, :cond_5

    .line 998
    invoke-virtual {v5, v10}, Landroid/view/View;->setVisibility(I)V

    .line 1001
    :cond_5
    return-void

    .line 965
    .end local v5           #v:Landroid/view/View;
    :cond_6
    const-string v6, "removed"

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_7

    .line 966
    const v3, 0x7f08001f

    .line 967
    const v1, 0x7f080020

    goto :goto_0

    .line 968
    :cond_7
    const-string v6, "mounted"

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_8

    .line 973
    const-string v6, ""

    invoke-virtual {p0, v6}, Landroid/app/Activity;->setTitle(Ljava/lang/CharSequence;)V

    .line 974
    new-instance v6, Lcom/miui/player/ui/ScanningProgress;

    const/4 v7, 0x2

    invoke-direct {v6, p0, p1, v7}, Lcom/miui/player/ui/ScanningProgress;-><init>(Landroid/app/Activity;Lcom/miui/player/MusicUtils$OnDialogCallback;I)V

    invoke-virtual {v6}, Lcom/miui/player/ui/ScanningProgress;->show()V

    goto :goto_0

    .line 975
    :cond_8
    sget-object v6, Lcom/miui/player/MusicUtils;->mLastSdStatus:Ljava/lang/String;

    invoke-static {v6, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 976
    sput-object v2, Lcom/miui/player/MusicUtils;->mLastSdStatus:Ljava/lang/String;

    .line 977
    const-string v6, "MusicUtils"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "sd card: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0
.end method

.method public static filterSQL(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .parameter "rawSql"

    .prologue
    .line 1766
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    move-object v3, p0

    .line 1782
    :goto_0
    return-object v3

    .line 1770
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 1772
    .local v2, ret:Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v1, v3, :cond_2

    .line 1773
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 1774
    .local v0, c:C
    invoke-static {v0}, Lcom/miui/player/MusicUtils;->isValidSQLChar(C)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1775
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1772
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1777
    :cond_1
    const/16 v3, 0x5c

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1778
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 1782
    .end local v0           #c:C
    :cond_2
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_0
.end method

.method public static getAlbumCount(Landroid/content/Context;Ljava/lang/String;)I
    .locals 9
    .parameter "context"
    .parameter "artistId"

    .prologue
    const/4 v8, 0x0

    .line 1931
    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const-string v0, "_id"

    aput-object v0, v2, v8

    .line 1937
    .local v2, cols:[Ljava/lang/String;
    if-eqz p1, :cond_0

    .line 1938
    const-string v0, "external"

    invoke-static {p1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-static {v0, v4, v5}, Landroid/provider/MediaStore$Audio$Artists$Albums;->getContentUri(Ljava/lang/String;J)Landroid/net/Uri;

    move-result-object v1

    .line 1939
    .local v1, uri:Landroid/net/Uri;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " audio.album_id  IN "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lcom/miui/player/MusicUtils;->getValidAlbumIdSetAsStr(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1944
    .local v3, inClause:Ljava/lang/String;
    :goto_0
    const/4 v4, 0x0

    const-string v5, "album_key"

    move-object v0, p0

    invoke-static/range {v0 .. v5}, Lcom/miui/player/MusicUtils;->query(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 1947
    .local v7, cursor:Landroid/database/Cursor;
    if-nez v7, :cond_1

    move v0, v8

    .line 1953
    :goto_1
    return v0

    .line 1941
    .end local v1           #uri:Landroid/net/Uri;
    .end local v3           #inClause:Ljava/lang/String;
    .end local v7           #cursor:Landroid/database/Cursor;
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "_id IN "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lcom/miui/player/MusicUtils;->getValidAlbumIdSetAsStr(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1942
    .restart local v3       #inClause:Ljava/lang/String;
    sget-object v1, Landroid/provider/MediaStore$Audio$Albums;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    .restart local v1       #uri:Landroid/net/Uri;
    goto :goto_0

    .line 1951
    .restart local v7       #cursor:Landroid/database/Cursor;
    :cond_1
    invoke-interface {v7}, Landroid/database/Cursor;->getCount()I

    move-result v6

    .line 1952
    .local v6, count:I
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    move v0, v6

    .line 1953
    goto :goto_1
.end method

.method public static getAllSongs(Landroid/content/Context;)[J
    .locals 8
    .parameter "context"

    .prologue
    const/4 v4, 0x0

    .line 385
    sget-object v1, Landroid/provider/MediaStore$Audio$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v3, "_id"

    aput-object v3, v2, v0

    invoke-static {p0}, Lcom/miui/player/MusicUtils;->wrapWithBlacklist(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    move-object v0, p0

    move-object v5, v4

    invoke-static/range {v0 .. v5}, Lcom/miui/player/MusicUtils;->query(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 391
    .local v6, c:Landroid/database/Cursor;
    if-eqz v6, :cond_0

    .line 392
    invoke-static {v6}, Lcom/miui/player/MusicUtils;->getSongListForCursor(Landroid/database/Cursor;)[J

    move-result-object v7

    .line 393
    .local v7, list:[J
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    move-object v0, v7

    .line 396
    .end local v7           #list:[J
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/miui/player/MusicUtils;->sEmptyList:[J

    goto :goto_0
.end method

.method public static getArrFromSet(Ljava/util/HashSet;)[J
    .locals 6
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/Long;",
            ">;)[J"
        }
    .end annotation

    .prologue
    .line 1890
    .local p0, set:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/Long;>;"
    invoke-virtual {p0}, Ljava/util/HashSet;->size()I

    move-result v4

    new-array v1, v4, [J

    .line 1891
    .local v1, audioList:[J
    const/4 v3, 0x0

    .line 1892
    .local v3, index:I
    invoke-virtual {p0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    .line 1893
    .local v0, audioId:Ljava/lang/Long;
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    aput-wide v4, v1, v3

    .line 1894
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1896
    .end local v0           #audioId:Ljava/lang/Long;
    :cond_0
    return-object v1
.end method

.method public static getArtistCount(Landroid/content/Context;)I
    .locals 13
    .parameter "context"

    .prologue
    const/4 v12, 0x0

    .line 1957
    const-string v6, " AND "

    .line 1958
    .local v6, AND:Ljava/lang/String;
    const-string v7, " IN "

    .line 1959
    .local v7, IN:Ljava/lang/String;
    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const-string v0, "count(*)"

    aput-object v0, v2, v12

    .line 1963
    .local v2, cols:[Ljava/lang/String;
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    .line 1964
    .local v11, where:Ljava/lang/StringBuilder;
    const-string v0, "artist != \'\'"

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1965
    invoke-static {p0}, Lcom/miui/player/MusicUtils;->getValidArtistIdSetAsStr(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v8

    .line 1966
    .local v8, artistSet:Ljava/lang/String;
    const-string v0, " AND "

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1967
    const-string v0, "_id"

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1968
    const-string v0, " IN "

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1969
    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1971
    sget-object v1, Landroid/provider/MediaStore$Audio$Artists;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const-string v5, "artist_key"

    move-object v0, p0

    invoke-static/range {v0 .. v5}, Lcom/miui/player/MusicUtils;->query(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 1974
    .local v10, cursor:Landroid/database/Cursor;
    const/4 v9, 0x0

    .line 1975
    .local v9, count:I
    if-eqz v10, :cond_1

    .line 1976
    invoke-interface {v10}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1977
    invoke-interface {v10, v12}, Landroid/database/Cursor;->getInt(I)I

    move-result v9

    .line 1979
    :cond_0
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 1981
    :cond_1
    return v9
.end method

.method public static getAudioIdColumnIndex(Landroid/database/Cursor;)I
    .locals 3
    .parameter "c"

    .prologue
    .line 1459
    const/4 v1, -0x1

    .line 1462
    .local v1, index:I
    :try_start_0
    const-string v2, "audio_id"

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 1468
    :goto_0
    return v1

    .line 1463
    :catch_0
    move-exception v2

    move-object v0, v2

    .line 1465
    .local v0, ex:Ljava/lang/IllegalArgumentException;
    const-string v2, "_id"

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v1

    goto :goto_0
.end method

.method public static getCurrentAlbumId()J
    .locals 2

    .prologue
    .line 230
    sget-object v0, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    if-eqz v0, :cond_0

    .line 232
    :try_start_0
    sget-object v0, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    invoke-interface {v0}, Lcom/miui/player/IMediaPlaybackService;->getAlbumId()J
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v0

    .line 236
    :goto_0
    return-wide v0

    .line 233
    :catch_0
    move-exception v0

    .line 236
    :cond_0
    const-wide/16 v0, -0x1

    goto :goto_0
.end method

.method public static getCurrentArtistId()J
    .locals 2

    .prologue
    .line 240
    sget-object v0, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    if-eqz v0, :cond_0

    .line 242
    :try_start_0
    sget-object v0, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    invoke-interface {v0}, Lcom/miui/player/IMediaPlaybackService;->getArtistId()J
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v0

    .line 246
    :goto_0
    return-wide v0

    .line 243
    :catch_0
    move-exception v0

    .line 246
    :cond_0
    const-wide/16 v0, -0x1

    goto :goto_0
.end method

.method public static getCurrentAudioId()J
    .locals 2

    .prologue
    .line 250
    sget-object v0, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    if-eqz v0, :cond_0

    .line 252
    :try_start_0
    sget-object v0, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    invoke-interface {v0}, Lcom/miui/player/IMediaPlaybackService;->getAudioId()J
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v0

    .line 256
    :goto_0
    return-wide v0

    .line 253
    :catch_0
    move-exception v0

    .line 256
    :cond_0
    const-wide/16 v0, -0x1

    goto :goto_0
.end method

.method public static getCurrentAudioPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 260
    sget-object v0, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    if-eqz v0, :cond_0

    .line 262
    :try_start_0
    sget-object v0, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    invoke-interface {v0}, Lcom/miui/player/IMediaPlaybackService;->getAbsolutePath()Ljava/lang/String;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 266
    :goto_0
    return-object v0

    .line 263
    :catch_0
    move-exception v0

    .line 266
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static getExistOnLineIdList(Landroid/content/Context;Landroid/net/Uri;)Ljava/util/ArrayList;
    .locals 10
    .parameter "context"
    .parameter "uri"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/net/Uri;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    const/4 v3, 0x0

    .line 751
    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const-string v0, "online_id"

    aput-object v0, v2, v9

    .line 754
    .local v2, cols:[Ljava/lang/String;
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    move-object v1, p1

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 755
    .local v6, cursor:Landroid/database/Cursor;
    if-eqz v6, :cond_2

    .line 756
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 757
    .local v7, existOnlineIdList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_0
    :goto_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 758
    invoke-interface {v6, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 759
    .local v8, onlineId:Ljava/lang/String;
    if-eqz v8, :cond_0

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 760
    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 763
    .end local v8           #onlineId:Ljava/lang/String;
    :cond_1
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    move-object v0, v7

    .line 766
    .end local v7           #existOnlineIdList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    :goto_1
    return-object v0

    :cond_2
    move-object v0, v3

    goto :goto_1
.end method

.method private static getFilterNowPlayingArr(Landroid/content/Context;[J)Ljava/util/HashSet;
    .locals 13
    .parameter "context"
    .parameter "audioArr"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "[J)",
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v12, 0x0

    const-string v1, "_id"

    .line 1682
    const/4 v10, 0x0

    .line 1683
    .local v10, ret:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/Long;>;"
    if-eqz p1, :cond_0

    array-length v0, p1

    if-nez v0, :cond_1

    .line 1684
    :cond_0
    new-instance v10, Ljava/util/HashSet;

    .end local v10           #ret:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/Long;>;"
    invoke-direct {v10, v12}, Ljava/util/HashSet;-><init>(I)V

    .line 1713
    .restart local v10       #ret:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/Long;>;"
    :goto_0
    return-object v10

    .line 1686
    :cond_1
    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const-string v0, "_id"

    aput-object v1, v2, v12

    .line 1690
    .local v2, cols:[Ljava/lang/String;
    invoke-static {p1}, Lcom/miui/player/provider/PlayerProviderUtils;->concatIdsAsSet([J)Ljava/lang/String;

    move-result-object v8

    .line 1691
    .local v8, audioIdSet:Ljava/lang/String;
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    .line 1692
    .local v11, whereBuilder:Ljava/lang/StringBuilder;
    const-string v0, "title"

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1693
    const-string v0, " != \'\' AND "

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1694
    const-string v0, "_id"

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1695
    const-string v0, " IN "

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1696
    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1698
    sget-object v1, Landroid/provider/MediaStore$Audio$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/miui/player/MusicUtils;->wrapWithBlacklist(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const-string v5, "title_key"

    move-object v0, p0

    invoke-static/range {v0 .. v5}, Lcom/miui/player/MusicUtils;->query(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 1702
    .local v9, cursor:Landroid/database/Cursor;
    if-eqz v9, :cond_3

    .line 1703
    new-instance v10, Ljava/util/HashSet;

    .end local v10           #ret:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/Long;>;"
    invoke-interface {v9}, Landroid/database/Cursor;->getCount()I

    move-result v0

    invoke-direct {v10, v0}, Ljava/util/HashSet;-><init>(I)V

    .line 1704
    .restart local v10       #ret:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/Long;>;"
    :goto_1
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1705
    invoke-interface {v9, v12}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    .line 1706
    .local v6, audioId:J
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v10, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 1708
    .end local v6           #audioId:J
    :cond_2
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    goto :goto_0

    .line 1710
    :cond_3
    new-instance v10, Ljava/util/HashSet;

    .end local v10           #ret:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/Long;>;"
    invoke-direct {v10, v12}, Ljava/util/HashSet;-><init>(I)V

    .restart local v10       #ret:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/Long;>;"
    goto :goto_0
.end method

.method public static getFolderAudioListId(Landroid/content/Context;Ljava/lang/String;)[J
    .locals 7
    .parameter "context"
    .parameter "path"

    .prologue
    .line 1642
    const/4 v0, 0x2

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "_id"

    aput-object v1, v2, v0

    const/4 v0, 0x1

    const-string v1, "_data"

    aput-object v1, v2, v0

    .line 1646
    .local v2, ccols:[Ljava/lang/String;
    invoke-static {p1}, Lcom/miui/player/MusicUtils;->filterSQL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1647
    .local p1, escapedPath:Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "%s LIKE \"%%%s%%\""

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "_data"

    aput-object v5, v3, v4

    const/4 v4, 0x1

    aput-object p1, v3, v4

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ESCAPE \'\\\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1649
    .local v0, likeClause:Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "%s NOT LIKE \"%%%s%%/%%\""

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string v6, "_data"

    aput-object v6, v4, v5

    const/4 v5, 0x1

    aput-object p1, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .end local p1           #escapedPath:Ljava/lang/String;
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, " ESCAPE \'\\\'"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1651
    .local p1, notlikeClause:Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .end local v0           #likeClause:Ljava/lang/String;
    const-string v1, " AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    .end local p1           #notlikeClause:Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1652
    .local p1, where:Ljava/lang/String;
    sget-object v1, Landroid/provider/MediaStore$Audio$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-static {p0, p1}, Lcom/miui/player/MusicUtils;->wrapWithBlacklist(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const-string v5, "title_key"

    move-object v0, p0

    invoke-static/range {v0 .. v5}, Lcom/miui/player/MusicUtils;->query(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    .line 1656
    .local p0, cursor:Landroid/database/Cursor;
    if-nez p0, :cond_0

    .line 1657
    const/4 p0, 0x0

    .line 1672
    .end local v2           #ccols:[Ljava/lang/String;
    .end local p0           #cursor:Landroid/database/Cursor;
    .end local p1           #where:Ljava/lang/String;
    :goto_0
    return-object p0

    .line 1659
    .restart local v2       #ccols:[Ljava/lang/String;
    .restart local p0       #cursor:Landroid/database/Cursor;
    .restart local p1       #where:Ljava/lang/String;
    :cond_0
    invoke-interface {p0}, Landroid/database/Cursor;->getCount()I

    move-result v0

    .line 1660
    .local v0, len:I
    new-array v1, v0, [J

    .line 1663
    .local v1, list:[J
    const/4 p1, 0x0

    .end local v2           #ccols:[Ljava/lang/String;
    .local p1, i:I
    :goto_1
    if-ge p1, v0, :cond_1

    .line 1664
    :try_start_0
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    .line 1665
    const/4 v2, 0x0

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    aput-wide v2, v1, p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1663
    add-int/lit8 p1, p1, 0x1

    goto :goto_1

    .line 1669
    :cond_1
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    .end local p1           #i:I
    :goto_2
    move-object p0, v1

    .line 1672
    goto :goto_0

    .line 1667
    .restart local p1       #i:I
    :catch_0
    move-exception p1

    .line 1669
    .end local p1           #i:I
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    goto :goto_2

    .restart local p1       #i:I
    :catchall_0
    move-exception p1

    .end local p1           #i:I
    invoke-interface {p0}, Landroid/database/Cursor;->close()V

    throw p1
.end method

.method public static getFormatedSizeString(J)Ljava/lang/String;
    .locals 6
    .parameter "size"

    .prologue
    const/4 v5, 0x0

    .line 1194
    const-wide/16 v1, 0x0

    cmp-long v1, p0, v1

    if-gtz v1, :cond_0

    .line 1195
    :try_start_0
    const-string v1, "0 B"

    .line 1204
    :goto_0
    return-object v1

    .line 1197
    :cond_0
    const-wide/32 v1, 0x100000

    cmp-long v1, p0, v1

    if-gez v1, :cond_1

    .line 1198
    const-string v1, "%1.1f K"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    long-to-float v4, p0

    add-float/2addr v4, v5

    const/high16 v5, 0x4480

    div-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 1200
    :cond_1
    const-string v1, "%1.1f M"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    long-to-float v4, p0

    add-float/2addr v4, v5

    const/high16 v5, 0x4980

    div-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    .line 1202
    :catch_0
    move-exception v1

    move-object v0, v1

    .line 1203
    .local v0, ex:Ljava/lang/Exception;
    const-string v1, "MusicUtils"

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1204
    const-string v1, "Unknown"

    goto :goto_0
.end method

.method private static getLocalAddAudioList([JLandroid/net/Uri;Landroid/content/Context;)[J
    .locals 6
    .parameter "addAudioIdList"
    .parameter "uri"
    .parameter "context"

    .prologue
    .line 831
    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "audio_id"

    aput-object v1, v2, v0

    .line 835
    .local v2, cols:[Ljava/lang/String;
    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const-string v5, "audio_id"

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    .line 840
    .local p1, cursor:Landroid/database/Cursor;
    if-nez p1, :cond_1

    .line 871
    .end local v2           #cols:[Ljava/lang/String;
    .end local p0
    .end local p1           #cursor:Landroid/database/Cursor;
    .end local p2
    :cond_0
    :goto_0
    return-object p0

    .line 843
    .restart local v2       #cols:[Ljava/lang/String;
    .restart local p0
    .restart local p1       #cursor:Landroid/database/Cursor;
    .restart local p2
    :cond_1
    invoke-static {p1}, Lcom/miui/player/MusicUtils;->getSongListForCursor(Landroid/database/Cursor;)[J

    move-result-object v0

    .line 844
    .local v0, existAudioIdList:[J
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 845
    if-eqz v0, :cond_0

    array-length p1, v0

    .end local p1           #cursor:Landroid/database/Cursor;
    if-eqz p1, :cond_0

    .line 849
    const-wide/16 p1, -0x1

    .line 850
    .end local p2
    .local p1, INVALID_AUDIO_ID:J
    array-length p1, p0

    .line 851
    .local p1, addCount:I
    const/4 p2, 0x0

    .local p2, i:I
    :goto_1
    array-length v1, p0

    if-ge p2, v1, :cond_3

    .line 852
    aget-wide v1, p0, p2

    invoke-static {v0, v1, v2}, Ljava/util/Arrays;->binarySearch([JJ)I

    move-result v1

    if-ltz v1, :cond_2

    .line 853
    const-wide/16 v1, -0x1

    aput-wide v1, p0, p2

    .line 854
    add-int/lit8 p1, p1, -0x1

    .line 851
    :cond_2
    add-int/lit8 p2, p2, 0x1

    goto :goto_1

    .line 858
    :cond_3
    if-gtz p1, :cond_4

    .line 859
    const/4 p0, 0x0

    goto :goto_0

    .line 861
    :cond_4
    array-length p2, p0

    .end local p2           #i:I
    if-eq p1, p2, :cond_0

    .line 865
    new-array v1, p1, [J

    .line 866
    .local v1, localAddAudioIdArr:[J
    const/4 p2, 0x0

    .line 867
    .local p2, index:I
    const/4 p1, 0x0

    .end local v0           #existAudioIdList:[J
    .end local v2           #cols:[Ljava/lang/String;
    .local p1, i:I
    :goto_2
    array-length v0, v1

    if-ge p1, v0, :cond_6

    .line 868
    aget-wide v2, p0, p1

    const-wide/16 v4, -0x1

    cmp-long v0, v2, v4

    if-eqz v0, :cond_5

    .line 869
    add-int/lit8 v0, p2, 0x1

    .end local p2           #index:I
    .local v0, index:I
    aget-wide v2, p0, p1

    aput-wide v2, v1, p2

    move p2, v0

    .line 867
    .end local v0           #index:I
    .restart local p2       #index:I
    :cond_5
    add-int/lit8 p1, p1, 0x1

    goto :goto_2

    :cond_6
    move-object p0, v1

    .line 871
    goto :goto_0
.end method

.method public static getLocalSongListForPlaylist(Landroid/content/Context;J)[J
    .locals 5
    .parameter "context"
    .parameter "plid"

    .prologue
    .line 353
    const-string v1, "%s < %d"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string v4, "audio_id"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const v4, 0x1fffffff

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 355
    .local v0, where:Ljava/lang/String;
    invoke-static {p0, p1, p2, v0}, Lcom/miui/player/MusicUtils;->getSongListForPlaylist(Landroid/content/Context;JLjava/lang/String;)[J

    move-result-object v1

    return-object v1
.end method

.method private static getOnlineAddList([Lcom/xiaomi/common2/musicsearch/MusicInfoSongList$SongItem;Ljava/util/ArrayList;)[Lcom/xiaomi/common2/musicsearch/MusicInfoSongList$SongItem;
    .locals 5
    .parameter "songItems"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/xiaomi/common2/musicsearch/MusicInfoSongList$SongItem;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)[",
            "Lcom/xiaomi/common2/musicsearch/MusicInfoSongList$SongItem;"
        }
    .end annotation

    .prologue
    .line 771
    .local p1, existOnlineList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 772
    .local v3, songItemList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/xiaomi/common2/musicsearch/MusicInfoSongList$SongItem;>;"
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    array-length v4, p0

    if-ge v0, v4, :cond_2

    .line 773
    aget-object v4, p0, v0

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    if-eqz p1, :cond_1

    aget-object v4, p0, v0

    iget-object v4, v4, Lcom/xiaomi/common2/musicsearch/MusicInfoSongList$SongItem;->Id:Ljava/lang/String;

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 772
    :cond_0
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 777
    :cond_1
    aget-object v4, p0, v0

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 779
    :cond_2
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 780
    .local v1, size:I
    if-lez v1, :cond_4

    .line 781
    new-array v2, v1, [Lcom/xiaomi/common2/musicsearch/MusicInfoSongList$SongItem;

    .line 782
    .local v2, songItemArr:[Lcom/xiaomi/common2/musicsearch/MusicInfoSongList$SongItem;
    const/4 v0, 0x0

    .end local p0
    :goto_2
    if-ge v0, v1, :cond_3

    .line 783
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/xiaomi/common2/musicsearch/MusicInfoSongList$SongItem;

    aput-object p0, v2, v0

    .line 782
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_3
    move-object v4, v2

    .line 787
    .end local v2           #songItemArr:[Lcom/xiaomi/common2/musicsearch/MusicInfoSongList$SongItem;
    :goto_3
    return-object v4

    .restart local p0
    :cond_4
    const/4 v4, 0x0

    goto :goto_3
.end method

.method public static getPlaylistCount(Landroid/content/Context;)I
    .locals 11
    .parameter "context"

    .prologue
    const/4 v1, 0x1

    const/4 v10, 0x0

    const-string v5, "name"

    .line 1985
    const-string v6, " AND "

    .line 1986
    .local v6, AND:Ljava/lang/String;
    new-array v2, v1, [Ljava/lang/String;

    const-string v0, "count(*)"

    aput-object v0, v2, v10

    .line 1989
    .local v2, cols:[Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 1990
    .local v9, where:Ljava/lang/StringBuilder;
    const-string v0, "name"

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1991
    const-string v0, " != \'\'"

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1992
    const-string v0, " AND "

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1993
    const-string v0, "list_type"

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1994
    const-string v0, " != "

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1995
    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1997
    const/4 v8, 0x0

    .line 1999
    .local v8, cursor:Landroid/database/Cursor;
    const/4 v7, 0x1

    .line 2001
    .local v7, count:I
    sget-object v1, Lcom/miui/player/provider/PlayerStore$MiuiPlaylists;->EXTERNAL_URI:Landroid/net/Uri;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const-string v0, "name"

    move-object v0, p0

    invoke-static/range {v0 .. v5}, Lcom/miui/player/MusicUtils;->query(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 2003
    if-eqz v8, :cond_1

    .line 2004
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2005
    invoke-interface {v8, v10}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    add-int/2addr v7, v0

    .line 2007
    :cond_0
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 2009
    :cond_1
    return v7
.end method

.method public static getSongCount(Landroid/content/Context;Ljava/lang/String;)I
    .locals 11
    .parameter "context"
    .parameter "artistId"

    .prologue
    const/4 v10, 0x0

    .line 1900
    const-string v6, " AND "

    .line 1901
    .local v6, AND:Ljava/lang/String;
    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const-string v0, "count(*)"

    aput-object v0, v2, v10

    .line 1905
    .local v2, cols:[Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 1906
    .local v9, where:Ljava/lang/StringBuilder;
    const-string v0, "title"

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1907
    const-string v0, " != \'\' "

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1908
    if-eqz p1, :cond_0

    .line 1909
    const-string v0, " AND "

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1910
    const-string v0, "artist_id"

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1911
    const-string v0, "="

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1912
    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1915
    :cond_0
    sget-object v1, Landroid/provider/MediaStore$Audio$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/miui/player/MusicUtils;->wrapWithBlacklist(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const-string v5, "album_key"

    move-object v0, p0

    invoke-static/range {v0 .. v5}, Lcom/miui/player/MusicUtils;->query(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 1919
    .local v8, cursor:Landroid/database/Cursor;
    const/4 v7, 0x0

    .line 1920
    .local v7, count:I
    if-eqz v8, :cond_2

    .line 1921
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1922
    invoke-interface {v8, v10}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    .line 1924
    :cond_1
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 1927
    :cond_2
    return v7
.end method

.method public static getSongListForAlbum(Landroid/content/Context;J)[J
    .locals 9
    .parameter "context"
    .parameter "id"

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 330
    new-array v2, v5, [Ljava/lang/String;

    const-string v0, "_id"

    aput-object v0, v2, v4

    .line 333
    .local v2, ccols:[Ljava/lang/String;
    const-string v0, "%s = %d"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const-string v3, "album_id"

    aput-object v3, v1, v4

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v5

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    .line 336
    .local v8, where:Ljava/lang/String;
    sget-object v1, Landroid/provider/MediaStore$Audio$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-static {p0, v8}, Lcom/miui/player/MusicUtils;->wrapWithBlacklist(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const-string v5, "track"

    move-object v0, p0

    invoke-static/range {v0 .. v5}, Lcom/miui/player/MusicUtils;->query(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 343
    .local v6, cursor:Landroid/database/Cursor;
    if-eqz v6, :cond_0

    .line 344
    invoke-static {v6}, Lcom/miui/player/MusicUtils;->getSongListForCursor(Landroid/database/Cursor;)[J

    move-result-object v7

    .line 345
    .local v7, list:[J
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    move-object v0, v7

    .line 348
    .end local v7           #list:[J
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/miui/player/MusicUtils;->sEmptyList:[J

    goto :goto_0
.end method

.method public static getSongListForArtist(Landroid/content/Context;J)[J
    .locals 11
    .parameter "context"
    .parameter "id"

    .prologue
    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v4, 0x0

    .line 308
    new-array v2, v9, [Ljava/lang/String;

    const-string v0, "_id"

    aput-object v0, v2, v4

    .line 312
    .local v2, ccols:[Ljava/lang/String;
    const-string v0, "%s = %d"

    new-array v1, v10, [Ljava/lang/Object;

    const-string v3, "artist_id"

    aput-object v3, v1, v4

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v9

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    .line 313
    .local v8, where:Ljava/lang/String;
    const-string v0, "%s,%s"

    new-array v1, v10, [Ljava/lang/Object;

    const-string v3, "album_key"

    aput-object v3, v1, v4

    const-string v3, "track"

    aput-object v3, v1, v9

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 314
    .local v5, sortKey:Ljava/lang/String;
    sget-object v1, Landroid/provider/MediaStore$Audio$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-static {p0, v8}, Lcom/miui/player/MusicUtils;->wrapWithBlacklist(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    move-object v0, p0

    invoke-static/range {v0 .. v5}, Lcom/miui/player/MusicUtils;->query(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 321
    .local v6, cursor:Landroid/database/Cursor;
    if-eqz v6, :cond_0

    .line 322
    invoke-static {v6}, Lcom/miui/player/MusicUtils;->getSongListForCursor(Landroid/database/Cursor;)[J

    move-result-object v7

    .line 323
    .local v7, list:[J
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    move-object v0, v7

    .line 326
    .end local v7           #list:[J
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/miui/player/MusicUtils;->sEmptyList:[J

    goto :goto_0
.end method

.method public static getSongListForCursor(Landroid/database/Cursor;)[J
    .locals 7
    .parameter "cursor"

    .prologue
    .line 286
    if-nez p0, :cond_0

    .line 287
    sget-object v5, Lcom/miui/player/MusicUtils;->sEmptyList:[J

    .line 304
    :goto_0
    return-object v5

    .line 289
    :cond_0
    invoke-interface {p0}, Landroid/database/Cursor;->getCount()I

    move-result v2

    .line 290
    .local v2, len:I
    if-nez v2, :cond_1

    .line 291
    sget-object v5, Lcom/miui/player/MusicUtils;->sEmptyList:[J

    goto :goto_0

    .line 294
    :cond_1
    new-array v3, v2, [J

    .line 295
    .local v3, list:[J
    invoke-interface {p0}, Landroid/database/Cursor;->getPosition()I

    move-result v4

    .line 296
    .local v4, position:I
    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    .line 297
    invoke-static {p0}, Lcom/miui/player/MusicUtils;->getAudioIdColumnIndex(Landroid/database/Cursor;)I

    move-result v0

    .line 298
    .local v0, colidx:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    if-ge v1, v2, :cond_2

    .line 299
    invoke-interface {p0, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v5

    aput-wide v5, v3, v1

    .line 300
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    .line 298
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 302
    :cond_2
    invoke-interface {p0, v4}, Landroid/database/Cursor;->moveToPosition(I)Z

    move-object v5, v3

    .line 304
    goto :goto_0
.end method

.method public static getSongListForPlaylist(Landroid/content/Context;JLjava/lang/String;)[J
    .locals 8
    .parameter "context"
    .parameter "plid"
    .parameter "where"

    .prologue
    .line 359
    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v3, "audio_id"

    aput-object v3, v2, v0

    .line 363
    .local v2, ccols:[Ljava/lang/String;
    invoke-static {p1, p2}, Lcom/miui/player/provider/PlayerStore$MiuiPlaylists$Members;->getMembersUri(J)Landroid/net/Uri;

    move-result-object v1

    .line 365
    .local v1, uri:Landroid/net/Uri;
    const/4 v4, 0x0

    const-string v5, "play_order"

    move-object v0, p0

    move-object v3, p3

    invoke-static/range {v0 .. v5}, Lcom/miui/player/MusicUtils;->query(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 368
    .local v6, cursor:Landroid/database/Cursor;
    if-eqz v6, :cond_0

    .line 369
    invoke-static {v6}, Lcom/miui/player/MusicUtils;->getSongListForCursor(Landroid/database/Cursor;)[J

    move-result-object v7

    .line 370
    .local v7, list:[J
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    move-object v0, v7

    .line 374
    .end local v7           #list:[J
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/miui/player/MusicUtils;->sEmptyList:[J

    goto :goto_0
.end method

.method public static getSuggestionName(Ljava/lang/String;Landroid/database/Cursor;I)Ljava/lang/String;
    .locals 10
    .parameter "template"
    .parameter "cursor"
    .parameter "nameIdx"

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 2088
    if-nez p1, :cond_0

    .line 2089
    const/4 v6, 0x0

    .line 2118
    :goto_0
    return-object v6

    .line 2092
    :cond_0
    invoke-interface {p1}, Landroid/database/Cursor;->getPosition()I

    move-result v4

    .line 2093
    .local v4, pos:I
    const/4 v2, 0x1

    .line 2094
    .local v2, num:I
    new-array v6, v9, [Ljava/lang/Object;

    add-int/lit8 v3, v2, 0x1

    .end local v2           #num:I
    .local v3, num:I
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-static {p0, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 2103
    .local v5, suggestedname:Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, done:Z
    move v2, v3

    .line 2104
    .end local v3           #num:I
    .restart local v2       #num:I
    :cond_1
    if-nez v0, :cond_3

    .line 2105
    const/4 v0, 0x1

    .line 2106
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    .line 2107
    :goto_1
    invoke-interface {p1}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v6

    if-nez v6, :cond_1

    .line 2108
    invoke-interface {p1, p2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 2109
    .local v1, name:Ljava/lang/String;
    invoke-virtual {v1, v5}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v6

    if-nez v6, :cond_2

    .line 2110
    new-array v6, v9, [Ljava/lang/Object;

    add-int/lit8 v3, v2, 0x1

    .end local v2           #num:I
    .restart local v3       #num:I
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-static {p0, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 2111
    const/4 v0, 0x0

    move v2, v3

    .line 2113
    .end local v3           #num:I
    .restart local v2       #num:I
    :cond_2
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_1

    .line 2117
    .end local v1           #name:Ljava/lang/String;
    :cond_3
    invoke-interface {p1, v4}, Landroid/database/Cursor;->moveToPosition(I)Z

    move-object v6, v5

    .line 2118
    goto :goto_0
.end method

.method public static getValidAlbumIdSet(Landroid/content/Context;)Ljava/util/Set;
    .locals 3
    .parameter "context"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1861
    invoke-static {p0}, Lcom/miui/player/MusicUtils;->queryValidAlbumIdCursor(Landroid/content/Context;)Landroid/database/Cursor;

    move-result-object v0

    .line 1862
    .local v0, cursor:Landroid/database/Cursor;
    const/4 v2, 0x0

    invoke-static {v0, v2}, Lcom/miui/player/MusicUtils;->getValueSetFromCursor(Landroid/database/Cursor;I)Ljava/util/Set;

    move-result-object v1

    .line 1863
    .local v1, ret:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/Integer;>;"
    if-eqz v0, :cond_0

    .line 1864
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 1867
    :cond_0
    return-object v1
.end method

.method public static getValidAlbumIdSetAsStr(Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .parameter "context"

    .prologue
    .line 1851
    invoke-static {p0}, Lcom/miui/player/MusicUtils;->queryValidAlbumIdCursor(Landroid/content/Context;)Landroid/database/Cursor;

    move-result-object v1

    .line 1852
    .local v1, cursor:Landroid/database/Cursor;
    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/miui/player/provider/PlayerProviderUtils;->concatIdsAsSet(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v0

    .line 1854
    .local v0, albumSet:Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 1855
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 1857
    :cond_0
    return-object v0
.end method

.method public static getValidArtistIdSet(Landroid/content/Context;)Ljava/util/Set;
    .locals 3
    .parameter "context"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1831
    invoke-static {p0}, Lcom/miui/player/MusicUtils;->queryValidArtistIdCursor(Landroid/content/Context;)Landroid/database/Cursor;

    move-result-object v0

    .line 1832
    .local v0, cursor:Landroid/database/Cursor;
    const/4 v2, 0x0

    invoke-static {v0, v2}, Lcom/miui/player/MusicUtils;->getValueSetFromCursor(Landroid/database/Cursor;I)Ljava/util/Set;

    move-result-object v1

    .line 1833
    .local v1, ret:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/Integer;>;"
    if-eqz v0, :cond_0

    .line 1834
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 1837
    :cond_0
    return-object v1
.end method

.method public static getValidArtistIdSetAsStr(Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .parameter "context"

    .prologue
    .line 1821
    invoke-static {p0}, Lcom/miui/player/MusicUtils;->queryValidArtistIdCursor(Landroid/content/Context;)Landroid/database/Cursor;

    move-result-object v1

    .line 1822
    .local v1, cursor:Landroid/database/Cursor;
    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/miui/player/provider/PlayerProviderUtils;->concatIdsAsSet(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v0

    .line 1823
    .local v0, artistSet:Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 1824
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 1827
    :cond_0
    return-object v0
.end method

.method public static getValidAudioIdSet(Landroid/content/Context;)Ljava/util/Set;
    .locals 10
    .parameter "context"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 1872
    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const-string v0, "_id"

    aput-object v0, v2, v9

    .line 1876
    .local v2, cols:[Ljava/lang/String;
    const-string v8, "title != \'\'"

    .line 1877
    .local v8, where:Ljava/lang/String;
    sget-object v1, Landroid/provider/MediaStore$Audio$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-static {p0, v8}, Lcom/miui/player/MusicUtils;->wrapWithBlacklist(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const-string v5, "title_key"

    move-object v0, p0

    invoke-static/range {v0 .. v5}, Lcom/miui/player/MusicUtils;->query(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 1881
    .local v6, cursor:Landroid/database/Cursor;
    invoke-static {v6, v9}, Lcom/miui/player/MusicUtils;->getValueSetFromCursor(Landroid/database/Cursor;I)Ljava/util/Set;

    move-result-object v7

    .line 1882
    .local v7, ret:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/Integer;>;"
    if-eqz v6, :cond_0

    .line 1883
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1886
    :cond_0
    return-object v7
.end method

.method private static getValueSetFromCursor(Landroid/database/Cursor;I)Ljava/util/Set;
    .locals 2
    .parameter "c"
    .parameter "colIdx"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            "I)",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1796
    const/4 v0, 0x0

    .line 1797
    .local v0, ret:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/Integer;>;"
    if-eqz p0, :cond_0

    .line 1798
    new-instance v0, Ljava/util/HashSet;

    .end local v0           #ret:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/Integer;>;"
    invoke-interface {p0}, Landroid/database/Cursor;->getCount()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(I)V

    .line 1799
    .restart local v0       #ret:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/Integer;>;"
    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    :goto_0
    invoke-interface {p0}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v1

    if-nez v1, :cond_1

    .line 1800
    invoke-interface {p0, p1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 1799
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_0

    .line 1803
    :cond_0
    new-instance v0, Ljava/util/HashSet;

    .end local v0           #ret:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/Integer;>;"
    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(I)V

    .line 1806
    .restart local v0       #ret:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/Integer;>;"
    :cond_1
    return-object v0
.end method

.method public static hideDatabaseError(Landroid/app/Activity;Z)V
    .locals 4
    .parameter "a"
    .parameter "alphabetScroller"

    .prologue
    const/16 v3, 0x8

    const/4 v2, 0x0

    .line 1004
    const v1, 0x7f0c009b

    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 1005
    .local v0, v:Landroid/view/View;
    if-eqz v0, :cond_0

    .line 1006
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 1008
    :cond_0
    const v1, 0x7f0c009a

    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 1009
    if-eqz v0, :cond_1

    .line 1010
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 1012
    :cond_1
    const v1, 0x102000a

    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 1013
    if-eqz v0, :cond_2

    .line 1014
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 1016
    :cond_2
    if-eqz p1, :cond_3

    .line 1017
    const v1, 0x7f0c000d

    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 1018
    if-eqz v0, :cond_3

    .line 1019
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 1022
    :cond_3
    return-void
.end method

.method public static idForEqualizer(Landroid/content/Context;Ljava/lang/String;)I
    .locals 9
    .parameter "context"
    .parameter "name"

    .prologue
    const/4 v4, 0x1

    const/4 v8, 0x0

    .line 2070
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/miui/player/provider/PlayerStore$MiuiEqualizer;->EXTERNAL_URI:Landroid/net/Uri;

    new-array v2, v4, [Ljava/lang/String;

    const-string v3, "_id"

    aput-object v3, v2, v8

    const-string v3, "name=?"

    new-array v4, v4, [Ljava/lang/String;

    aput-object p1, v4, v8

    const-string v5, "name"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 2076
    .local v6, c:Landroid/database/Cursor;
    const/4 v7, -0x1

    .line 2077
    .local v7, id:I
    if-eqz v6, :cond_1

    .line 2078
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    .line 2079
    invoke-interface {v6}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2080
    invoke-interface {v6, v8}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    .line 2082
    :cond_0
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 2084
    :cond_1
    return v7
.end method

.method public static idForPlaylistByPath(Landroid/content/Context;Ljava/lang/String;)I
    .locals 10
    .parameter "context"
    .parameter "path"

    .prologue
    const/4 v1, 0x1

    const/4 v9, 0x0

    .line 552
    new-array v2, v1, [Ljava/lang/String;

    const-string v0, "_id"

    aput-object v0, v2, v9

    .line 555
    .local v2, projection:[Ljava/lang/String;
    const-string v8, "folder_path=?"

    .line 556
    .local v8, where:Ljava/lang/String;
    new-array v4, v1, [Ljava/lang/String;

    aput-object p1, v4, v9

    .line 560
    .local v4, args:[Ljava/lang/String;
    sget-object v1, Lcom/miui/player/provider/PlayerStore$MiuiPlaylists;->EXTERNAL_URI:Landroid/net/Uri;

    const-string v3, "folder_path=?"

    const-string v5, "folder_path"

    move-object v0, p0

    invoke-static/range {v0 .. v5}, Lcom/miui/player/MusicUtils;->query(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 563
    .local v6, c:Landroid/database/Cursor;
    const/4 v7, -0x1

    .line 564
    .local v7, id:I
    if-eqz v6, :cond_1

    .line 565
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    .line 566
    invoke-interface {v6}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v0

    if-nez v0, :cond_0

    .line 567
    invoke-interface {v6, v9}, Landroid/database/Cursor;->getInt(I)I

    move-result v7

    .line 569
    :cond_0
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 571
    :cond_1
    return v7
.end method

.method public static idForplaylist(Landroid/content/Context;Ljava/lang/String;I)I
    .locals 4
    .parameter "context"
    .parameter "name"
    .parameter "type"

    .prologue
    .line 515
    const/4 v0, 0x1

    new-array v0, v0, [J

    const/4 v1, 0x0

    int-to-long v2, p2

    aput-wide v2, v0, v1

    invoke-static {p0, p1, v0}, Lcom/miui/player/MusicUtils;->idForplaylist(Landroid/content/Context;Ljava/lang/String;[J)I

    move-result v0

    return v0
.end method

.method public static idForplaylist(Landroid/content/Context;Ljava/lang/String;[J)I
    .locals 12
    .parameter "context"
    .parameter "name"
    .parameter "type"

    .prologue
    const/4 v1, 0x1

    const/4 v11, 0x0

    const-string v5, "name"

    .line 521
    const-string v6, " AND "

    .line 522
    .local v6, AND:Ljava/lang/String;
    const-string v7, " IN "

    .line 523
    .local v7, IN:Ljava/lang/String;
    new-array v2, v1, [Ljava/lang/String;

    const-string v0, "_id"

    aput-object v0, v2, v11

    .line 526
    .local v2, projection:[Ljava/lang/String;
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 527
    .local v10, where:Ljava/lang/StringBuilder;
    const-string v0, "name"

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 528
    const-string v0, "=?"

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 529
    const-string v0, " AND "

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 530
    const-string v0, "list_type"

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 531
    const-string v0, " IN "

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 532
    invoke-static {p2}, Lcom/miui/player/provider/PlayerProviderUtils;->concatIdsAsSet([J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 533
    new-array v4, v1, [Ljava/lang/String;

    aput-object p1, v4, v11

    .line 537
    .local v4, args:[Ljava/lang/String;
    sget-object v1, Lcom/miui/player/provider/PlayerStore$MiuiPlaylists;->EXTERNAL_URI:Landroid/net/Uri;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v0, "name"

    move-object v0, p0

    invoke-static/range {v0 .. v5}, Lcom/miui/player/MusicUtils;->query(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 540
    .local v8, c:Landroid/database/Cursor;
    const/4 v9, -0x1

    .line 541
    .local v9, id:I
    if-eqz v8, :cond_1

    .line 542
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    .line 543
    invoke-interface {v8}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v0

    if-nez v0, :cond_0

    .line 544
    invoke-interface {v8, v11}, Landroid/database/Cursor;->getInt(I)I

    move-result v9

    .line 546
    :cond_0
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 548
    :cond_1
    return v9
.end method

.method public static isMusicLoaded()Z
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 274
    sget-object v0, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    if-eqz v0, :cond_1

    .line 276
    :try_start_0
    sget-object v0, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    invoke-interface {v0}, Lcom/miui/player/IMediaPlaybackService;->getPath()Ljava/lang/String;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 280
    :goto_0
    return v0

    :cond_0
    move v0, v1

    .line 276
    goto :goto_0

    .line 277
    :catch_0
    move-exception v0

    :cond_1
    move v0, v1

    .line 280
    goto :goto_0
.end method

.method public static isOneShot()Z
    .locals 1

    .prologue
    .line 1631
    :try_start_0
    sget-object v0, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    invoke-interface {v0}, Lcom/miui/player/IMediaPlaybackService;->isOneShot()Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    if-eqz v0, :cond_0

    .line 1632
    const/4 v0, 0x1

    .line 1637
    :goto_0
    return v0

    .line 1634
    :catch_0
    move-exception v0

    .line 1637
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isPlaying()Z
    .locals 1

    .prologue
    .line 1620
    :try_start_0
    sget-object v0, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    invoke-interface {v0}, Lcom/miui/player/IMediaPlaybackService;->isPlaying()Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    if-eqz v0, :cond_0

    .line 1621
    const/4 v0, 0x1

    .line 1626
    :goto_0
    return v0

    .line 1623
    :catch_0
    move-exception v0

    .line 1626
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isUriAllInBlacklist(Landroid/content/Context;Landroid/net/Uri;)Z
    .locals 8
    .parameter "context"
    .parameter "uri"

    .prologue
    const/4 v2, 0x0

    .line 1360
    const/4 v7, 0x1

    .line 1361
    .local v7, ret:Z
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-static {p0}, Lcom/miui/player/MusicUtils;->wrapWithBlacklist(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    move-object v1, p1

    move-object v4, v2

    move-object v5, v2

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 1364
    .local v6, c:Landroid/database/Cursor;
    if-eqz v6, :cond_0

    .line 1365
    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    move v7, v0

    .line 1366
    :goto_0
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1369
    :cond_0
    return v7

    .line 1365
    :cond_1
    const/4 v0, 0x0

    move v7, v0

    goto :goto_0
.end method

.method private static isValidSQLChar(C)Z
    .locals 5
    .parameter "c"

    .prologue
    .line 1786
    sget-object v0, Lcom/miui/player/MusicUtils;->INVALID_CHAR:[C

    .local v0, arr$:[C
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-char v1, v0, v2

    .line 1787
    .local v1, cc:C
    if-ne v1, p0, :cond_0

    .line 1788
    const/4 v4, 0x0

    .line 1792
    .end local v1           #cc:C
    :goto_1
    return v4

    .line 1786
    .restart local v1       #cc:C
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1792
    .end local v1           #cc:C
    :cond_1
    const/4 v4, 0x1

    goto :goto_1
.end method

.method public static makeAlbumsSongsLabel(Landroid/content/Context;IIZ)Ljava/lang/String;
    .locals 8
    .parameter "context"
    .parameter "numalbums"
    .parameter "numsongs"
    .parameter "isUnknown"

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 154
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 156
    .local v2, songs_albums:Ljava/lang/StringBuilder;
    if-ne p2, v7, :cond_0

    .line 157
    const/high16 v3, 0x7f08

    invoke-virtual {p0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 172
    :goto_0
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 159
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 160
    .local v1, r:Landroid/content/res/Resources;
    if-nez p3, :cond_1

    .line 161
    const v3, 0x7f090001

    invoke-virtual {v1, v3, p1}, Landroid/content/res/Resources;->getQuantityText(II)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 162
    .local v0, f:Ljava/lang/String;
    sget-object v3, Lcom/miui/player/MusicUtils;->sFormatBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 163
    sget-object v3, Lcom/miui/player/MusicUtils;->sFormatter:Ljava/util/Formatter;

    new-array v4, v7, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-virtual {v3, v0, v4}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    .line 164
    sget-object v3, Lcom/miui/player/MusicUtils;->sFormatBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 165
    const v3, 0x7f080046

    invoke-virtual {p0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    .end local v0           #f:Ljava/lang/String;
    :cond_1
    const/high16 v3, 0x7f09

    invoke-virtual {v1, v3, p2}, Landroid/content/res/Resources;->getQuantityText(II)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 168
    .restart local v0       #f:Ljava/lang/String;
    sget-object v3, Lcom/miui/player/MusicUtils;->sFormatBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 169
    sget-object v3, Lcom/miui/player/MusicUtils;->sFormatter:Ljava/util/Formatter;

    new-array v4, v7, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-virtual {v3, v0, v4}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    .line 170
    sget-object v3, Lcom/miui/player/MusicUtils;->sFormatBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method public static makeContextMenuTitle(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Landroid/view/View;
    .locals 6
    .parameter "context"
    .parameter "tr"
    .parameter "ar"
    .parameter "al"
    .parameter "isLocal"

    .prologue
    .line 2014
    invoke-static {p0, p2, p3}, Lcom/miui/player/helper/MediaInfo;->getDescript(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    .line 2015
    .local v0, descript:Ljava/lang/CharSequence;
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v3

    const v4, 0x7f030036

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 2016
    .local v1, menuHeader:Landroid/view/View;
    const v3, 0x7f0c0022

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    .end local p0
    check-cast p0, Landroid/widget/TextView;

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2017
    const v3, 0x7f0c00b4

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/TextView;

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 2018
    if-eqz p4, :cond_0

    const v3, 0x7f080032

    move v2, v3

    .line 2019
    .local v2, statusId:I
    :goto_0
    const v3, 0x7f0c00b3

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/TextView;

    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 2020
    return-object v1

    .line 2018
    .end local v2           #statusId:I
    :cond_0
    const v3, 0x7f080031

    move v2, v3

    goto :goto_0
.end method

.method public static makePlaylistMenu(Landroid/content/Context;Landroid/view/SubMenu;)V
    .locals 13
    .parameter "context"
    .parameter "sub"

    .prologue
    const/4 v12, 0x3

    const/4 v9, 0x2

    const/4 v11, 0x1

    const/4 v10, 0x0

    const-string v5, "name"

    .line 410
    new-array v2, v9, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v1, v2, v10

    const-string v1, "name"

    aput-object v5, v2, v11

    .line 413
    .local v2, cols:[Ljava/lang/String;
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 414
    .local v0, resolver:Landroid/content/ContentResolver;
    const-string v1, "%s != \'\' AND (%s = %d OR %s = %d)"

    const/4 v4, 0x5

    new-array v4, v4, [Ljava/lang/Object;

    const-string v8, "name"

    aput-object v5, v4, v10

    const-string v8, "list_type"

    aput-object v8, v4, v11

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v4, v9

    const-string v8, "list_type"

    aput-object v8, v4, v12

    const/4 v8, 0x4

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v4, v8

    invoke-static {v1, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 420
    .local v3, whereclause:Ljava/lang/String;
    invoke-static {v3, v10}, Lcom/miui/player/helper/FavoritePlaylist;->filter(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v3

    .line 421
    invoke-static {v3, v10}, Lcom/miui/player/provider/PlayerProviderUtils;->filterNowPlaying(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v3

    .line 422
    sget-object v1, Lcom/miui/player/provider/PlayerStore$MiuiPlaylists;->EXTERNAL_URI:Landroid/net/Uri;

    const/4 v4, 0x0

    const-string v8, "name"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 427
    .local v6, cur:Landroid/database/Cursor;
    invoke-interface {p1}, Landroid/view/SubMenu;->clear()V

    .line 428
    const/16 v1, 0x19

    const v4, 0x7f08002e

    invoke-interface {p1, v11, v1, v10, v4}, Landroid/view/SubMenu;->add(IIII)Landroid/view/MenuItem;

    .line 429
    const/16 v1, 0x16

    const v4, 0x7f08002f

    invoke-interface {p1, v11, v1, v10, v4}, Landroid/view/SubMenu;->add(IIII)Landroid/view/MenuItem;

    .line 430
    if-eqz v6, :cond_0

    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-lez v1, :cond_0

    .line 431
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    .line 432
    :goto_0
    invoke-interface {v6}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v1

    if-nez v1, :cond_0

    .line 433
    new-instance v7, Landroid/content/Intent;

    invoke-direct {v7}, Landroid/content/Intent;-><init>()V

    .line 434
    .local v7, intent:Landroid/content/Intent;
    const-string v1, "playlist"

    invoke-interface {v6, v10}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-virtual {v7, v1, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 435
    const/16 v1, 0x15

    invoke-interface {v6, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {p1, v11, v1, v10, v4}, Landroid/view/SubMenu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, v7}, Landroid/view/MenuItem;->setIntent(Landroid/content/Intent;)Landroid/view/MenuItem;

    .line 436
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_0

    .line 439
    .end local v7           #intent:Landroid/content/Intent;
    :cond_0
    if-eqz v6, :cond_1

    .line 440
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 442
    :cond_1
    return-void
.end method

.method public static makeTimeString(Landroid/content/Context;J)Ljava/lang/String;
    .locals 1
    .parameter "context"
    .parameter "secs"

    .prologue
    .line 1037
    const v0, 0x7f0800ea

    invoke-static {p0, p1, p2, v0}, Lcom/miui/player/MusicUtils;->makeTimeString(Landroid/content/Context;JI)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static makeTimeString(Landroid/content/Context;JI)Ljava/lang/String;
    .locals 9
    .parameter "context"
    .parameter "secs"
    .parameter "resid"

    .prologue
    const-wide/16 v7, 0xe10

    const/4 v4, 0x0

    const-wide/16 v5, 0x3c

    .line 1041
    cmp-long v2, p1, v7

    if-gez v2, :cond_0

    move v2, p3

    :goto_0
    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 1048
    .local v0, durationformat:Ljava/lang/String;
    sget-object v2, Lcom/miui/player/MusicUtils;->sFormatBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 1050
    sget-object v1, Lcom/miui/player/MusicUtils;->sTimeArgs:[Ljava/lang/Object;

    .line 1051
    .local v1, timeArgs:[Ljava/lang/Object;
    div-long v2, p1, v7

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v1, v4

    .line 1052
    const/4 v2, 0x1

    div-long v3, p1, v5

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    .line 1053
    const/4 v2, 0x2

    div-long v3, p1, v5

    rem-long/2addr v3, v5

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    .line 1054
    const/4 v2, 0x3

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    .line 1055
    const/4 v2, 0x4

    rem-long v3, p1, v5

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    .line 1057
    sget-object v2, Lcom/miui/player/MusicUtils;->sFormatter:Ljava/util/Formatter;

    invoke-virtual {v2, v0, v1}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Formatter;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 1041
    .end local v0           #durationformat:Ljava/lang/String;
    .end local v1           #timeArgs:[Ljava/lang/Object;
    :cond_0
    const v2, 0x7f0800ec

    goto :goto_0
.end method

.method public static notifyAddToPlaylist(Landroid/content/Context;JI)V
    .locals 6
    .parameter "context"
    .parameter "playlistId"
    .parameter "size"

    .prologue
    const/4 v5, 0x0

    .line 736
    invoke-static {p1, p2}, Lcom/miui/player/helper/FavoritePlaylist;->isFavoritePlaylistId(J)Z

    move-result v2

    if-eqz v2, :cond_0

    const v2, 0x7f090004

    move v1, v2

    .line 738
    .local v1, msgId:I
    :goto_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-virtual {v2, v1, p3, v3}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 741
    .local v0, message:Ljava/lang/String;
    invoke-static {p0, v0, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 742
    return-void

    .line 736
    .end local v0           #message:Ljava/lang/String;
    .end local v1           #msgId:I
    :cond_0
    const v2, 0x7f090003

    move v1, v2

    goto :goto_0
.end method

.method public static playAll(Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 1
    .parameter "context"
    .parameter "cursor"

    .prologue
    const/4 v0, 0x0

    .line 1065
    invoke-static {p0, p1, v0, v0}, Lcom/miui/player/MusicUtils;->playAll(Landroid/content/Context;Landroid/database/Cursor;IZ)V

    .line 1066
    return-void
.end method

.method public static playAll(Landroid/content/Context;Landroid/database/Cursor;I)V
    .locals 1
    .parameter "context"
    .parameter "cursor"
    .parameter "position"

    .prologue
    .line 1069
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/miui/player/MusicUtils;->playAll(Landroid/content/Context;Landroid/database/Cursor;IZ)V

    .line 1070
    return-void
.end method

.method private static playAll(Landroid/content/Context;Landroid/database/Cursor;IZ)V
    .locals 1
    .parameter "context"
    .parameter "cursor"
    .parameter "position"
    .parameter "force_shuffle"

    .prologue
    .line 1114
    invoke-static {p1}, Lcom/miui/player/MusicUtils;->getSongListForCursor(Landroid/database/Cursor;)[J

    move-result-object v0

    .line 1115
    .local v0, list:[J
    invoke-static {p0, v0, p2, p3}, Lcom/miui/player/MusicUtils;->playAll(Landroid/content/Context;[JIZ)V

    .line 1116
    return-void
.end method

.method public static playAll(Landroid/content/Context;[JI)V
    .locals 1
    .parameter "context"
    .parameter "list"
    .parameter "position"

    .prologue
    .line 1073
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/miui/player/MusicUtils;->playAll(Landroid/content/Context;[JIZ)V

    .line 1074
    return-void
.end method

.method private static playAll(Landroid/content/Context;[JIZ)V
    .locals 10
    .parameter "context"
    .parameter "list"
    .parameter "position"
    .parameter "force_shuffle"

    .prologue
    const/4 v9, -0x1

    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 1119
    invoke-static {}, Lcom/miui/player/helper/Global;->isSDCardBusy()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 1120
    const v5, 0x7f080021

    invoke-static {p0, v5, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/Toast;->show()V

    .line 1164
    .end local p0
    :cond_0
    :goto_0
    return-void

    .line 1123
    .restart local p0
    :cond_1
    array-length v5, p1

    if-eqz v5, :cond_2

    sget-object v5, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    if-nez v5, :cond_3

    .line 1124
    :cond_2
    const-string v5, "MusicUtils"

    const-string v6, "attempt to play empty song list"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1126
    const v5, 0x7f080033

    new-array v6, v7, [Ljava/lang/Object;

    array-length v7, p1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-virtual {p0, v5, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 1127
    .local v3, message:Ljava/lang/String;
    invoke-static {p0, v3, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 1131
    .end local v3           #message:Ljava/lang/String;
    :cond_3
    if-eqz p3, :cond_4

    .line 1132
    :try_start_0
    sget-object v5, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    const/4 v6, 0x1

    invoke-interface {v5, v6}, Lcom/miui/player/IMediaPlaybackService;->setShuffleMode(I)V

    .line 1133
    sget-object v5, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    invoke-interface {v5}, Lcom/miui/player/IMediaPlaybackService;->getRepeatMode()I

    move-result v5

    const/4 v6, 0x2

    if-ne v5, v6, :cond_4

    .line 1134
    sget-object v5, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    const/4 v6, 0x1

    invoke-interface {v5, v6}, Lcom/miui/player/IMediaPlaybackService;->setRepeatMode(I)V

    .line 1137
    :cond_4
    sget-object v5, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    invoke-interface {v5}, Lcom/miui/player/IMediaPlaybackService;->getAudioId()J

    move-result-wide v0

    .line 1138
    .local v0, curid:J
    sget-object v5, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    invoke-interface {v5}, Lcom/miui/player/IMediaPlaybackService;->getQueuePosition()I

    move-result v2

    .line 1139
    .local v2, curpos:I
    if-eq p2, v9, :cond_5

    if-ne v2, p2, :cond_5

    aget-wide v5, p1, p2

    cmp-long v5, v0, v5

    if-nez v5, :cond_5

    .line 1143
    sget-object v5, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    invoke-interface {v5}, Lcom/miui/player/IMediaPlaybackService;->getQueue()[J

    move-result-object v4

    .line 1144
    .local v4, playlist:[J
    invoke-static {p1, v4}, Ljava/util/Arrays;->equals([J[J)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v5

    if-eqz v5, :cond_5

    .line 1158
    instance-of v5, p0, Landroid/app/Activity;

    if-eqz v5, :cond_0

    .line 1159
    invoke-static {}, Lcom/miui/player/MusicUtils;->isMusicLoaded()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 1160
    check-cast p0, Landroid/app/Activity;

    .end local p0
    invoke-static {p0, v7}, Lcom/miui/player/drawerActivityGroup/MainActivityGroup;->startDrawerChild(Landroid/app/Activity;Z)Z

    goto :goto_0

    .line 1150
    .end local v4           #playlist:[J
    .restart local p0
    :cond_5
    if-gez p2, :cond_6

    .line 1151
    const/4 p2, 0x0

    .line 1154
    :cond_6
    const/4 v5, 0x0

    :try_start_1
    invoke-static {p0, p1, v5}, Lcom/miui/player/provider/PlayerProviderUtils;->updateNowplayingList(Landroid/content/Context;[JZ)[J

    move-result-object p1

    .line 1155
    sget-object v5, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    if-eqz p3, :cond_7

    move v6, v9

    :goto_1
    invoke-interface {v5, p1, v6}, Lcom/miui/player/IMediaPlaybackService;->open([JI)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    .line 1158
    instance-of v5, p0, Landroid/app/Activity;

    if-eqz v5, :cond_0

    .line 1159
    invoke-static {}, Lcom/miui/player/MusicUtils;->isMusicLoaded()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 1160
    check-cast p0, Landroid/app/Activity;

    .end local p0
    invoke-static {p0, v7}, Lcom/miui/player/drawerActivityGroup/MainActivityGroup;->startDrawerChild(Landroid/app/Activity;Z)Z

    goto/16 :goto_0

    .restart local p0
    :cond_7
    move v6, p2

    .line 1155
    goto :goto_1

    .line 1156
    .end local v0           #curid:J
    .end local v2           #curpos:I
    :catch_0
    move-exception v5

    .line 1158
    instance-of v5, p0, Landroid/app/Activity;

    if-eqz v5, :cond_0

    .line 1159
    invoke-static {}, Lcom/miui/player/MusicUtils;->isMusicLoaded()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 1160
    check-cast p0, Landroid/app/Activity;

    .end local p0
    invoke-static {p0, v7}, Lcom/miui/player/drawerActivityGroup/MainActivityGroup;->startDrawerChild(Landroid/app/Activity;Z)Z

    goto/16 :goto_0

    .line 1158
    .restart local p0
    :catchall_0
    move-exception v5

    instance-of v6, p0, Landroid/app/Activity;

    if-eqz v6, :cond_8

    .line 1159
    invoke-static {}, Lcom/miui/player/MusicUtils;->isMusicLoaded()Z

    move-result v6

    if-eqz v6, :cond_8

    .line 1160
    check-cast p0, Landroid/app/Activity;

    .end local p0
    invoke-static {p0, v7}, Lcom/miui/player/drawerActivityGroup/MainActivityGroup;->startDrawerChild(Landroid/app/Activity;Z)Z

    :cond_8
    throw v5
.end method

.method public static playAll(Landroid/content/Context;[Lcom/xiaomi/common2/musicsearch/MusicInfoSongList$SongItem;IZ)V
    .locals 7
    .parameter "context"
    .parameter "songItems"
    .parameter "position"
    .parameter "force_shuffle"

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 1078
    invoke-static {}, Lcom/miui/player/helper/Global;->isSDCardBusy()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1079
    const v3, 0x7f080021

    invoke-static {p0, v3, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    .line 1111
    .end local p0
    :cond_0
    :goto_0
    return-void

    .line 1082
    .restart local p0
    :cond_1
    array-length v3, p1

    if-eqz v3, :cond_2

    sget-object v3, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    if-nez v3, :cond_3

    .line 1083
    :cond_2
    const-string v3, "MusicUtils"

    const-string v4, "attempt to play empty song list"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1085
    const v3, 0x7f080033

    new-array v4, v5, [Ljava/lang/Object;

    array-length v5, p1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-virtual {p0, v3, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 1086
    .local v2, message:Ljava/lang/String;
    invoke-static {p0, v2, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 1090
    .end local v2           #message:Ljava/lang/String;
    :cond_3
    if-eqz p3, :cond_4

    .line 1091
    :try_start_0
    sget-object v3, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    const/4 v4, 0x1

    invoke-interface {v3, v4}, Lcom/miui/player/IMediaPlaybackService;->setShuffleMode(I)V

    .line 1092
    sget-object v3, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    invoke-interface {v3}, Lcom/miui/player/IMediaPlaybackService;->getRepeatMode()I

    move-result v3

    const/4 v4, 0x2

    if-ne v3, v4, :cond_4

    .line 1093
    sget-object v3, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    const/4 v4, 0x1

    invoke-interface {v3, v4}, Lcom/miui/player/IMediaPlaybackService;->setRepeatMode(I)V

    .line 1097
    :cond_4
    if-gez p2, :cond_5

    .line 1098
    const/4 p2, 0x0

    .line 1101
    :cond_5
    const/4 v3, 0x0

    invoke-static {p0, p1, v3}, Lcom/miui/player/provider/PlayerProviderUtils;->updateNowplayingList(Landroid/content/Context;[Lcom/xiaomi/common2/musicsearch/MusicInfoSongList$SongItem;Z)[J

    move-result-object v1

    .line 1102
    .local v1, list:[J
    sget-object v3, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    if-eqz p3, :cond_6

    const/4 v4, -0x1

    :goto_1
    invoke-interface {v3, v1, v4}, Lcom/miui/player/IMediaPlaybackService;->open([JI)V

    .line 1103
    instance-of v3, p0, Landroid/app/Activity;

    if-eqz v3, :cond_0

    .line 1104
    invoke-static {}, Lcom/miui/player/MusicUtils;->isMusicLoaded()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1105
    check-cast p0, Landroid/app/Activity;

    .end local p0
    const/4 v3, 0x1

    invoke-static {p0, v3}, Lcom/miui/player/drawerActivityGroup/MainActivityGroup;->startDrawerChild(Landroid/app/Activity;Z)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1108
    .end local v1           #list:[J
    :catch_0
    move-exception v3

    move-object v0, v3

    .line 1109
    .local v0, ex:Landroid/os/RemoteException;
    invoke-virtual {v0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0

    .end local v0           #ex:Landroid/os/RemoteException;
    .restart local v1       #list:[J
    .restart local p0
    :cond_6
    move v4, p2

    .line 1102
    goto :goto_1
.end method

.method public static playFolder(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .parameter "context"
    .parameter "path"

    .prologue
    .line 1676
    invoke-static {p0, p1}, Lcom/miui/player/MusicUtils;->getFolderAudioListId(Landroid/content/Context;Ljava/lang/String;)[J

    move-result-object v0

    .line 1677
    .local v0, list:[J
    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/miui/player/MusicUtils;->playAll(Landroid/content/Context;[JI)V

    .line 1679
    return-void
.end method

.method public static playPlaylist(Landroid/content/Context;J)V
    .locals 3
    .parameter "context"
    .parameter "plid"

    .prologue
    .line 378
    const/4 v1, 0x0

    invoke-static {p0, p1, p2, v1}, Lcom/miui/player/MusicUtils;->getSongListForPlaylist(Landroid/content/Context;JLjava/lang/String;)[J

    move-result-object v0

    .line 379
    .local v0, list:[J
    if-eqz v0, :cond_0

    array-length v1, v0

    if-lez v1, :cond_0

    .line 380
    const/4 v1, -0x1

    const/4 v2, 0x0

    invoke-static {p0, v0, v1, v2}, Lcom/miui/player/MusicUtils;->playAll(Landroid/content/Context;[JIZ)V

    .line 382
    :cond_0
    return-void
.end method

.method public static query(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 7
    .parameter "context"
    .parameter "uri"
    .parameter "projection"
    .parameter "selection"
    .parameter "selectionArgs"
    .parameter "sortOrder"

    .prologue
    .line 952
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-static/range {v0 .. v6}, Lcom/miui/player/MusicUtils;->query(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;I)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method public static query(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;I)Landroid/database/Cursor;
    .locals 8
    .parameter "context"
    .parameter "uri"
    .parameter "projection"
    .parameter "selection"
    .parameter "selectionArgs"
    .parameter "sortOrder"
    .parameter "limit"

    .prologue
    const/4 v7, 0x0

    .line 935
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 937
    .local v0, resolver:Landroid/content/ContentResolver;
    if-nez v0, :cond_0

    move-object v1, v7

    .line 945
    .end local v0           #resolver:Landroid/content/ContentResolver;
    :goto_0
    return-object v1

    .line 940
    .restart local v0       #resolver:Landroid/content/ContentResolver;
    :cond_0
    if-lez p6, :cond_1

    .line 941
    invoke-virtual {p1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "limit"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    :cond_1
    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    .line 943
    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    .line 944
    .end local v0           #resolver:Landroid/content/ContentResolver;
    :catch_0
    move-exception v1

    move-object v6, v1

    .local v6, ex:Ljava/lang/UnsupportedOperationException;
    move-object v1, v7

    .line 945
    goto :goto_0
.end method

.method private static queryValidAlbumIdCursor(Landroid/content/Context;)Landroid/database/Cursor;
    .locals 7
    .parameter "context"

    .prologue
    .line 1841
    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "distinct album_id"

    aput-object v1, v2, v0

    .line 1844
    .local v2, cols:[Ljava/lang/String;
    const-string v6, "title != \'\'"

    .line 1845
    .local v6, whereclause:Ljava/lang/String;
    sget-object v1, Landroid/provider/MediaStore$Audio$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-static {p0, v6}, Lcom/miui/player/MusicUtils;->wrapWithBlacklist(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const-string v5, "album_id"

    move-object v0, p0

    invoke-static/range {v0 .. v5}, Lcom/miui/player/MusicUtils;->query(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method private static queryValidArtistIdCursor(Landroid/content/Context;)Landroid/database/Cursor;
    .locals 7
    .parameter "context"

    .prologue
    .line 1810
    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "distinct artist_id"

    aput-object v1, v2, v0

    .line 1814
    .local v2, cols:[Ljava/lang/String;
    const-string v6, "title != \'\'"

    .line 1815
    .local v6, whereclause:Ljava/lang/String;
    sget-object v1, Landroid/provider/MediaStore$Audio$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-static {p0, v6}, Lcom/miui/player/MusicUtils;->wrapWithBlacklist(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const-string v5, "artist_id"

    move-object v0, p0

    invoke-static/range {v0 .. v5}, Lcom/miui/player/MusicUtils;->query(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method

.method public static quitMediaPlay(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    .line 1390
    sget-object v1, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    if-eqz v1, :cond_0

    .line 1392
    :try_start_0
    sget-object v1, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    invoke-interface {v1}, Lcom/miui/player/IMediaPlaybackService;->quit()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1399
    :goto_0
    const/4 v1, 0x0

    invoke-static {p0, v1}, Lcom/miui/player/helper/SleepModeManager;->setSelectTime(Landroid/content/Context;I)V

    .line 1400
    const-string v1, "com.miui.music.quit"

    invoke-static {p0, v1}, Lcom/miui/player/helper/SleepModeManager;->deleteTimer(Landroid/content/Context;Ljava/lang/String;)V

    .line 1401
    return-void

    .line 1396
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.miui.player.musicservicecommand.quit"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1397
    .local v0, intent:Landroid/content/Intent;
    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    goto :goto_0

    .line 1393
    .end local v0           #intent:Landroid/content/Intent;
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public static recycleCursorAdapter(Landroid/widget/SimpleCursorAdapter;Landroid/database/DataSetObserver;)V
    .locals 1
    .parameter "adapter"
    .parameter "observer"

    .prologue
    .line 2038
    if-eqz p0, :cond_0

    .line 2040
    :try_start_0
    invoke-virtual {p0, p1}, Landroid/widget/SimpleCursorAdapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    .line 2041
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/widget/SimpleCursorAdapter;->changeCursor(Landroid/database/Cursor;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2046
    :cond_0
    :goto_0
    return-void

    .line 2042
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public static removeFromPlaylist(Landroid/content/Context;Ljava/lang/String;JJ)V
    .locals 1
    .parameter "context"
    .parameter "playlistId"
    .parameter "memberId"
    .parameter "audioId"

    .prologue
    .line 918
    invoke-static {p1}, Lcom/miui/player/helper/FavoritePlaylist;->isFavoritePlaylistId(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 919
    invoke-static {p0, p4, p5}, Lcom/miui/player/helper/FavoritePlaylist;->remove(Landroid/content/Context;J)V

    .line 921
    :cond_0
    invoke-static {p0, p1, p2, p3}, Lcom/miui/player/provider/PlayerProviderUtils;->removeFromPlaylist(Landroid/content/Context;Ljava/lang/String;J)V

    .line 922
    return-void
.end method

.method public static removeFromPlaylist(Landroid/content/Context;Ljava/lang/String;JLjava/lang/String;)V
    .locals 1
    .parameter "context"
    .parameter "playlistId"
    .parameter "memberId"
    .parameter "providerId"

    .prologue
    .line 926
    invoke-static {p1}, Lcom/miui/player/helper/FavoritePlaylist;->isFavoritePlaylistId(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 927
    invoke-static {p0, p4}, Lcom/miui/player/helper/FavoritePlaylist;->remove(Landroid/content/Context;Ljava/lang/String;)V

    .line 929
    :cond_0
    invoke-static {p0, p1, p2, p3}, Lcom/miui/player/provider/PlayerProviderUtils;->removeFromPlaylist(Landroid/content/Context;Ljava/lang/String;J)V

    .line 930
    return-void
.end method

.method public static scanBackward(IJLcom/miui/player/MusicUtils$ScanInfo;)V
    .locals 12
    .parameter "repcnt"
    .parameter "delta"
    .parameter "scanInfo"

    .prologue
    const-wide/16 v6, 0x1388

    const-wide/16 v10, 0x0

    .line 1539
    sget-object v4, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    if-nez v4, :cond_0

    .line 1577
    :goto_0
    return-void

    .line 1544
    :cond_0
    if-nez p0, :cond_1

    .line 1545
    :try_start_0
    sget-object v4, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    invoke-interface {v4}, Lcom/miui/player/IMediaPlaybackService;->position()J

    move-result-wide v4

    iput-wide v4, p3, Lcom/miui/player/MusicUtils$ScanInfo;->startSeekPos:J

    .line 1546
    const-wide/16 v4, 0x0

    iput-wide v4, p3, Lcom/miui/player/MusicUtils$ScanInfo;->lastEventTime:J

    .line 1547
    const/4 v4, 0x0

    iput-boolean v4, p3, Lcom/miui/player/MusicUtils$ScanInfo;->isSeeking:Z

    goto :goto_0

    .line 1575
    :catch_0
    move-exception v4

    goto :goto_0

    .line 1549
    :cond_1
    const/4 v4, 0x1

    iput-boolean v4, p3, Lcom/miui/player/MusicUtils$ScanInfo;->isSeeking:Z

    .line 1550
    cmp-long v4, p1, v6

    if-gez v4, :cond_5

    .line 1552
    const-wide/16 v4, 0xa

    mul-long/2addr p1, v4

    .line 1557
    :goto_1
    iget-wide v4, p3, Lcom/miui/player/MusicUtils$ScanInfo;->startSeekPos:J

    sub-long v2, v4, p1

    .line 1558
    .local v2, newpos:J
    cmp-long v4, v2, v10

    if-gez v4, :cond_2

    .line 1560
    sget-object v4, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    invoke-interface {v4}, Lcom/miui/player/IMediaPlaybackService;->prev()V

    .line 1561
    sget-object v4, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    invoke-interface {v4}, Lcom/miui/player/IMediaPlaybackService;->duration()J

    move-result-wide v0

    .line 1562
    .local v0, duration:J
    iget-wide v4, p3, Lcom/miui/player/MusicUtils$ScanInfo;->startSeekPos:J

    add-long/2addr v4, v0

    iput-wide v4, p3, Lcom/miui/player/MusicUtils$ScanInfo;->startSeekPos:J

    .line 1563
    add-long/2addr v2, v0

    .line 1565
    .end local v0           #duration:J
    :cond_2
    iget-wide v4, p3, Lcom/miui/player/MusicUtils$ScanInfo;->lastEventTime:J

    sub-long v4, p1, v4

    const-wide/16 v6, 0xfa

    cmp-long v4, v4, v6

    if-gtz v4, :cond_3

    if-gez p0, :cond_4

    .line 1566
    :cond_3
    sget-object v4, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    invoke-interface {v4, v2, v3}, Lcom/miui/player/IMediaPlaybackService;->seek(J)J

    .line 1567
    iput-wide p1, p3, Lcom/miui/player/MusicUtils$ScanInfo;->lastEventTime:J

    .line 1569
    :cond_4
    if-ltz p0, :cond_6

    .line 1570
    iput-wide v2, p3, Lcom/miui/player/MusicUtils$ScanInfo;->posOverride:J

    goto :goto_0

    .line 1555
    .end local v2           #newpos:J
    :cond_5
    const-wide/32 v4, 0xc350

    sub-long v6, p1, v6

    const-wide/16 v8, 0x28

    mul-long/2addr v6, v8

    add-long p1, v4, v6

    goto :goto_1

    .line 1572
    .restart local v2       #newpos:J
    :cond_6
    const-wide/16 v4, -0x1

    iput-wide v4, p3, Lcom/miui/player/MusicUtils$ScanInfo;->posOverride:J
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0
.end method

.method public static scanForward(IJLcom/miui/player/MusicUtils$ScanInfo;)V
    .locals 10
    .parameter "repcnt"
    .parameter "delta"
    .parameter "scanInfo"

    .prologue
    const-wide/16 v6, 0x1388

    .line 1580
    sget-object v4, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    if-nez v4, :cond_0

    .line 1616
    :goto_0
    return-void

    .line 1583
    :cond_0
    if-nez p0, :cond_1

    .line 1584
    :try_start_0
    sget-object v4, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    invoke-interface {v4}, Lcom/miui/player/IMediaPlaybackService;->position()J

    move-result-wide v4

    iput-wide v4, p3, Lcom/miui/player/MusicUtils$ScanInfo;->startSeekPos:J

    .line 1585
    const-wide/16 v4, 0x0

    iput-wide v4, p3, Lcom/miui/player/MusicUtils$ScanInfo;->lastEventTime:J

    .line 1586
    const/4 v4, 0x0

    iput-boolean v4, p3, Lcom/miui/player/MusicUtils$ScanInfo;->isSeeking:Z

    goto :goto_0

    .line 1614
    :catch_0
    move-exception v4

    goto :goto_0

    .line 1588
    :cond_1
    const/4 v4, 0x1

    iput-boolean v4, p3, Lcom/miui/player/MusicUtils$ScanInfo;->isSeeking:Z

    .line 1589
    cmp-long v4, p1, v6

    if-gez v4, :cond_5

    .line 1591
    const-wide/16 v4, 0xa

    mul-long/2addr p1, v4

    .line 1596
    :goto_1
    iget-wide v4, p3, Lcom/miui/player/MusicUtils$ScanInfo;->startSeekPos:J

    add-long v2, v4, p1

    .line 1597
    .local v2, newpos:J
    sget-object v4, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    invoke-interface {v4}, Lcom/miui/player/IMediaPlaybackService;->duration()J

    move-result-wide v0

    .line 1598
    .local v0, duration:J
    cmp-long v4, v2, v0

    if-ltz v4, :cond_2

    .line 1600
    sget-object v4, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    invoke-interface {v4}, Lcom/miui/player/IMediaPlaybackService;->next()V

    .line 1601
    iget-wide v4, p3, Lcom/miui/player/MusicUtils$ScanInfo;->startSeekPos:J

    sub-long/2addr v4, v0

    iput-wide v4, p3, Lcom/miui/player/MusicUtils$ScanInfo;->startSeekPos:J

    .line 1602
    sub-long/2addr v2, v0

    .line 1604
    :cond_2
    iget-wide v4, p3, Lcom/miui/player/MusicUtils$ScanInfo;->lastEventTime:J

    sub-long v4, p1, v4

    const-wide/16 v6, 0xfa

    cmp-long v4, v4, v6

    if-gtz v4, :cond_3

    if-gez p0, :cond_4

    .line 1605
    :cond_3
    sget-object v4, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    invoke-interface {v4, v2, v3}, Lcom/miui/player/IMediaPlaybackService;->seek(J)J

    .line 1606
    iput-wide p1, p3, Lcom/miui/player/MusicUtils$ScanInfo;->lastEventTime:J

    .line 1608
    :cond_4
    if-ltz p0, :cond_6

    .line 1609
    iput-wide v2, p3, Lcom/miui/player/MusicUtils$ScanInfo;->posOverride:J

    goto :goto_0

    .line 1594
    .end local v0           #duration:J
    .end local v2           #newpos:J
    :cond_5
    const-wide/32 v4, 0xc350

    sub-long v6, p1, v6

    const-wide/16 v8, 0x28

    mul-long/2addr v6, v8

    add-long p1, v4, v6

    goto :goto_1

    .line 1611
    .restart local v0       #duration:J
    .restart local v2       #newpos:J
    :cond_6
    const-wide/16 v4, -0x1

    iput-wide v4, p3, Lcom/miui/player/MusicUtils$ScanInfo;->posOverride:J
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0
.end method

.method public static sendByChooser(Landroid/content/Context;J)V
    .locals 12
    .parameter "context"
    .parameter "id"

    .prologue
    const/4 v11, 0x1

    const/4 v10, 0x0

    const/4 v3, 0x0

    .line 1175
    sget-object v0, Landroid/provider/MediaStore$Audio$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-static {v0, p1, p2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v1

    .line 1176
    .local v1, uri:Landroid/net/Uri;
    const/4 v0, 0x2

    new-array v2, v0, [Ljava/lang/String;

    const-string v0, "title"

    aput-object v0, v2, v10

    const-string v0, "_size"

    aput-object v0, v2, v11

    .line 1177
    .local v2, proj:[Ljava/lang/String;
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 1178
    .local v6, c:Landroid/database/Cursor;
    if-eqz v6, :cond_1

    .line 1179
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1180
    new-instance v8, Landroid/content/Intent;

    const-string v0, "android.intent.action.SEND"

    invoke-direct {v8, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1181
    .local v8, intent:Landroid/content/Intent;
    const-string v0, "android.intent.extra.STREAM"

    invoke-virtual {v8, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1182
    const-string v0, "audio/*"

    invoke-virtual {v8, v3, v0}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 1183
    invoke-interface {v6, v11}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/miui/player/MusicUtils;->getFormatedSizeString(J)Ljava/lang/String;

    move-result-object v7

    .line 1184
    .local v7, descrip:Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v6, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "("

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, ")"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 1185
    .local v9, title:Ljava/lang/String;
    invoke-static {v8, v9}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 1187
    .end local v7           #descrip:Ljava/lang/String;
    .end local v8           #intent:Landroid/content/Intent;
    .end local v9           #title:Ljava/lang/String;
    :cond_0
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1189
    :cond_1
    return-void
.end method

.method public static setBackground(Landroid/view/View;Landroid/graphics/Bitmap;)V
    .locals 20
    .parameter "v"
    .parameter "bm"

    .prologue
    .line 1249
    if-nez p1, :cond_1

    .line 1250
    const/16 p1, 0x0

    invoke-virtual/range {p0 .. p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 1296
    .end local p1
    :cond_0
    :goto_0
    return-void

    .line 1254
    .restart local p1
    :cond_1
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getWidth()I

    move-result v14

    .line 1255
    .local v14, vwidth:I
    invoke-virtual/range {p0 .. p0}, Landroid/view/View;->getHeight()I

    move-result v13

    .line 1256
    .local v13, vheight:I
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    .line 1257
    .local v7, bwidth:I
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    .line 1258
    .local v6, bheight:I
    int-to-float v5, v14

    int-to-float v8, v7

    div-float/2addr v5, v8

    .line 1259
    .local v5, scalex:F
    int-to-float v8, v13

    int-to-float v9, v6

    div-float/2addr v8, v9

    .line 1260
    .local v8, scaley:F
    invoke-static {v5, v8}, Ljava/lang/Math;->max(FF)F

    move-result v5

    .end local v5           #scalex:F
    const v8, 0x3fa66666

    mul-float v12, v5, v8

    .line 1262
    .local v12, scale:F
    sget-object v8, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 1263
    .local v8, config:Landroid/graphics/Bitmap$Config;
    const/4 v5, 0x0

    .line 1265
    .local v5, bg:Landroid/graphics/Bitmap;
    :try_start_0
    invoke-static {v14, v13, v8}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v5

    .line 1266
    new-instance v8, Landroid/graphics/Canvas;

    .end local v8           #config:Landroid/graphics/Bitmap$Config;
    invoke-direct {v8, v5}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 1267
    .local v8, c:Landroid/graphics/Canvas;
    new-instance v11, Landroid/graphics/Paint;

    invoke-direct {v11}, Landroid/graphics/Paint;-><init>()V

    .line 1268
    .local v11, paint:Landroid/graphics/Paint;
    const/4 v9, 0x1

    invoke-virtual {v11, v9}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 1269
    const/4 v9, 0x1

    invoke-virtual {v11, v9}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 1270
    new-instance v10, Landroid/graphics/ColorMatrix;

    invoke-direct {v10}, Landroid/graphics/ColorMatrix;-><init>()V

    .line 1271
    .local v10, greymatrix:Landroid/graphics/ColorMatrix;
    const/4 v9, 0x0

    invoke-virtual {v10, v9}, Landroid/graphics/ColorMatrix;->setSaturation(F)V

    .line 1272
    new-instance v9, Landroid/graphics/ColorMatrix;

    invoke-direct {v9}, Landroid/graphics/ColorMatrix;-><init>()V

    .line 1273
    .local v9, darkmatrix:Landroid/graphics/ColorMatrix;
    const v15, 0x3e99999a

    const v16, 0x3e99999a

    const v17, 0x3e99999a

    const/high16 v18, 0x3f80

    move-object v0, v9

    move v1, v15

    move/from16 v2, v16

    move/from16 v3, v17

    move/from16 v4, v18

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/ColorMatrix;->setScale(FFFF)V

    .line 1274
    invoke-virtual {v10, v9}, Landroid/graphics/ColorMatrix;->postConcat(Landroid/graphics/ColorMatrix;)V

    .line 1275
    new-instance v9, Landroid/graphics/ColorMatrixColorFilter;

    .end local v9           #darkmatrix:Landroid/graphics/ColorMatrix;
    invoke-direct {v9, v10}, Landroid/graphics/ColorMatrixColorFilter;-><init>(Landroid/graphics/ColorMatrix;)V

    .line 1276
    .local v9, filter:Landroid/graphics/ColorFilter;
    invoke-virtual {v11, v9}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 1277
    new-instance v9, Landroid/graphics/Matrix;

    .end local v9           #filter:Landroid/graphics/ColorFilter;
    invoke-direct {v9}, Landroid/graphics/Matrix;-><init>()V

    .line 1278
    .local v9, matrix:Landroid/graphics/Matrix;
    neg-int v7, v7

    div-int/lit8 v7, v7, 0x2

    .end local v7           #bwidth:I
    int-to-float v7, v7

    neg-int v6, v6

    div-int/lit8 v6, v6, 0x2

    .end local v6           #bheight:I
    int-to-float v6, v6

    invoke-virtual {v9, v7, v6}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 1281
    const/high16 v6, 0x4120

    invoke-virtual {v9, v6}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 1282
    invoke-virtual {v9, v12, v12}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 1283
    div-int/lit8 v6, v14, 0x2

    int-to-float v6, v6

    div-int/lit8 v7, v13, 0x2

    int-to-float v7, v7

    invoke-virtual {v9, v6, v7}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 1286
    move-object v0, v8

    move-object/from16 v1, p1

    move-object v2, v9

    move-object v3, v11

    invoke-virtual {v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    .line 1287
    new-instance p1, Landroid/graphics/drawable/BitmapDrawable;

    .end local p1
    move-object/from16 v0, p1

    move-object v1, v5

    invoke-direct {v0, v1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    .line 1288
    .local p1, d:Landroid/graphics/drawable/Drawable;
    const/16 v6, 0x32

    move-object/from16 v0, p1

    move v1, v6

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 1289
    invoke-virtual/range {p0 .. p1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    move-object/from16 p1, v5

    .line 1293
    .end local v5           #bg:Landroid/graphics/Bitmap;
    .end local v8           #c:Landroid/graphics/Canvas;
    .end local v9           #matrix:Landroid/graphics/Matrix;
    .end local v10           #greymatrix:Landroid/graphics/ColorMatrix;
    .end local v11           #paint:Landroid/graphics/Paint;
    .local p1, bg:Landroid/graphics/Bitmap;
    :goto_1
    if-nez p1, :cond_0

    .line 1294
    const/16 p1, 0x0

    invoke-virtual/range {p0 .. p1}, Landroid/view/View;->setBackgroundResource(I)V

    goto/16 :goto_0

    .line 1290
    .end local p1           #bg:Landroid/graphics/Bitmap;
    .restart local v5       #bg:Landroid/graphics/Bitmap;
    :catch_0
    move-exception p1

    move-object/from16 v19, p1

    move-object/from16 p1, v5

    .end local v5           #bg:Landroid/graphics/Bitmap;
    .restart local p1       #bg:Landroid/graphics/Bitmap;
    move-object/from16 v5, v19

    .line 1291
    .local v5, e:Ljava/lang/OutOfMemoryError;
    const/16 p1, 0x0

    goto :goto_1
.end method

.method public static setRingtone(Landroid/content/Context;J)V
    .locals 8
    .parameter "context"
    .parameter "id"

    .prologue
    .line 1210
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    .line 1212
    .local v6, resolver:Landroid/content/ContentResolver;
    sget-object v0, Landroid/provider/MediaStore$Audio$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-static {v0, p1, p2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v7

    .line 1214
    .local v7, ringUri:Landroid/net/Uri;
    :try_start_0
    new-instance v0, Landroid/content/ContentValues;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Landroid/content/ContentValues;-><init>(I)V

    .line 1215
    .local v0, values:Landroid/content/ContentValues;
    const-string v1, "is_ringtone"

    const-string v2, "1"

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1216
    const-string v1, "is_alarm"

    const-string v2, "1"

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1217
    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v6, v7, v0, v1, v2}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1224
    const/4 v0, 0x3

    new-array v2, v0, [Ljava/lang/String;

    .end local v0           #values:Landroid/content/ContentValues;
    const/4 v0, 0x0

    const-string v1, "_id"

    aput-object v1, v2, v0

    const/4 v0, 0x1

    const-string v1, "_data"

    aput-object v1, v2, v0

    const/4 v0, 0x2

    const-string v1, "title"

    aput-object v1, v2, v0

    .line 1229
    .local v2, cols:[Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "_id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    .end local p1
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1230
    .local v3, where:Ljava/lang/String;
    sget-object v1, Landroid/provider/MediaStore$Audio$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    invoke-static/range {v0 .. v5}, Lcom/miui/player/MusicUtils;->query(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    .line 1233
    .local p1, cursor:Landroid/database/Cursor;
    if-eqz p1, :cond_0

    :try_start_1
    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result p2

    const/4 v0, 0x1

    if-ne p2, v0, :cond_0

    .line 1235
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    .line 1236
    const-string p2, "ringtone"

    invoke-virtual {v7}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v6, p2, v0}, Landroid/provider/Settings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    .line 1237
    const p2, 0x7f080029

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .end local v2           #cols:[Ljava/lang/String;
    move-result-object v2

    aput-object v2, v0, v1

    invoke-virtual {p0, p2, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 1238
    .local p2, message:Ljava/lang/String;
    const/4 v0, 0x0

    invoke-static {p0, p2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p0

    .end local p0
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1241
    .end local p2           #message:Ljava/lang/String;
    :cond_0
    if-eqz p1, :cond_1

    .line 1242
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    .line 1245
    .end local v3           #where:Ljava/lang/String;
    .end local p1           #cursor:Landroid/database/Cursor;
    :cond_1
    :goto_0
    return-void

    .line 1218
    .restart local p0
    .local p1, id:J
    :catch_0
    move-exception p0

    .line 1220
    .local p0, ex:Ljava/lang/UnsupportedOperationException;
    const-string p0, "MusicUtils"

    .end local p0           #ex:Ljava/lang/UnsupportedOperationException;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "couldn\'t set ringtone flag for id "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    .end local p1           #id:J
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 1241
    .restart local v3       #where:Ljava/lang/String;
    .local p1, cursor:Landroid/database/Cursor;
    :catchall_0
    move-exception p0

    if-eqz p1, :cond_2

    .line 1242
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    :cond_2
    throw p0
.end method

.method public static setTopTabStyle(Landroid/content/Context;Landroid/view/View;Landroid/widget/TextView;IZZ)V
    .locals 5
    .parameter "context"
    .parameter "layoutView"
    .parameter "v"
    .parameter "textId"
    .parameter "isLeft"
    .parameter "on"

    .prologue
    .line 1427
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f06000c

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    .line 1428
    .local v1, ON_COLOR:I
    const/high16 v0, -0x100

    .line 1430
    .local v0, OFF_COLOR:I
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(I)V

    .line 1431
    if-eqz p5, :cond_0

    move v2, v1

    .line 1432
    .local v2, color:I
    :goto_0
    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 1433
    invoke-virtual {p1, p5}, Landroid/view/View;->setSelected(Z)V

    .line 1435
    const/4 v3, 0x0

    invoke-virtual {p2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1436
    return-void

    .line 1431
    .end local v2           #color:I
    :cond_0
    const/high16 v3, -0x100

    move v2, v3

    goto :goto_0
.end method

.method public static shuffleAll(Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 2
    .parameter "context"
    .parameter "cursor"

    .prologue
    .line 1061
    const/4 v0, -0x1

    const/4 v1, 0x1

    invoke-static {p0, p1, v0, v1}, Lcom/miui/player/MusicUtils;->playAll(Landroid/content/Context;Landroid/database/Cursor;IZ)V

    .line 1062
    return-void
.end method

.method public static unbindFromService(Landroid/content/Context;)V
    .locals 3
    .parameter "context"

    .prologue
    .line 192
    sget-object v1, Lcom/miui/player/MusicUtils;->sConnectionMap:Ljava/util/HashMap;

    invoke-virtual {v1, p0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/player/MusicUtils$ServiceBinder;

    .line 193
    .local v0, sb:Lcom/miui/player/MusicUtils$ServiceBinder;
    if-nez v0, :cond_1

    .line 194
    const-string v1, "MusicUtils"

    const-string v2, "Trying to unbind for unknown Context"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 204
    :cond_0
    :goto_0
    return-void

    .line 197
    :cond_1
    invoke-virtual {p0, v0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 198
    sget-object v1, Lcom/miui/player/MusicUtils;->sConnectionMap:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 202
    const/4 v1, 0x0

    sput-object v1, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    goto :goto_0
.end method

.method public static unregisterReceiverSafe(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V
    .locals 1
    .parameter "context"
    .parameter "receiver"

    .prologue
    .line 2031
    :try_start_0
    invoke-virtual {p0, p1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2035
    :goto_0
    return-void

    .line 2032
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public static updateAlphabetScroller(Landroid/widget/ListView;Landroid/widget/ListAdapter;)V
    .locals 6
    .parameter "lv"
    .parameter "adapter"

    .prologue
    const/4 v5, 0x0

    .line 2049
    invoke-virtual {p0}, Landroid/widget/ListView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 2050
    .local v1, parent:Landroid/view/View;
    const v4, 0x7f0c000d

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/miui/player/ui/view/AlphabetScroller;

    .line 2051
    .local v2, scroller:Lcom/miui/player/ui/view/AlphabetScroller;
    if-nez v2, :cond_0

    .line 2067
    :goto_0
    return-void

    .line 2054
    :cond_0
    const/4 v3, 0x0

    .line 2055
    .local v3, sectionAdapter:Lcom/miui/player/model/SectionCursorAdapter;
    instance-of v4, p1, Lcom/miui/player/model/SectionCursorAdapter;

    if-eqz v4, :cond_1

    .line 2056
    move-object v0, p1

    check-cast v0, Lcom/miui/player/model/SectionCursorAdapter;

    move-object v3, v0

    .line 2058
    :cond_1
    if-eqz v3, :cond_2

    .line 2059
    invoke-virtual {v3}, Lcom/miui/player/model/SectionCursorAdapter;->makeScrollListener()Landroid/widget/AbsListView$OnScrollListener;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/miui/player/ui/view/AlphabetScroller;->wrapScrollListener(Landroid/widget/AbsListView$OnScrollListener;)Landroid/widget/AbsListView$OnScrollListener;

    move-result-object v4

    invoke-virtual {p0, v4}, Landroid/widget/ListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 2060
    invoke-virtual {v2}, Lcom/miui/player/ui/view/AlphabetScroller;->getIndexerChangeListener()Lcom/miui/player/ui/view/AlphabetScroller$OnIndexerChangedListener;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/miui/player/model/SectionCursorAdapter;->setOnIndexerChangedListener(Lcom/miui/player/ui/view/AlphabetScroller$OnIndexerChangedListener;)V

    .line 2061
    invoke-virtual {v2}, Lcom/miui/player/ui/view/AlphabetScroller;->refreshAlphabetBgPos()V

    .line 2062
    invoke-virtual {v2, p0, v3}, Lcom/miui/player/ui/view/AlphabetScroller;->setList(Landroid/widget/AbsListView;Landroid/widget/SectionIndexer;)V

    goto :goto_0

    .line 2064
    :cond_2
    invoke-virtual {p0, v5}, Landroid/widget/ListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    .line 2065
    invoke-virtual {v2, v5, v5}, Lcom/miui/player/ui/view/AlphabetScroller;->setList(Landroid/widget/AbsListView;Landroid/widget/SectionIndexer;)V

    goto :goto_0
.end method

.method public static updateGoHome(Landroid/app/Activity;)V
    .locals 2
    .parameter "a"

    .prologue
    .line 1439
    const v1, 0x7f0c0050

    invoke-virtual {p0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 1440
    .local v0, v:Landroid/view/View;
    if-eqz v0, :cond_0

    .line 1441
    new-instance v1, Lcom/miui/player/MusicUtils$1;

    invoke-direct {v1, p0}, Lcom/miui/player/MusicUtils$1;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1456
    :cond_0
    return-void
.end method

.method public static updateHeaderText(Landroid/app/Activity;ILjava/lang/CharSequence;I)V
    .locals 8
    .parameter "activity"
    .parameter "textViewId"
    .parameter "name"
    .parameter "count"

    .prologue
    const/4 v7, 0x0

    .line 1405
    const v4, 0x7f0c000c

    invoke-virtual {p0, v4}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 1406
    .local v3, titleView:Landroid/view/View;
    if-nez v3, :cond_0

    .line 1422
    :goto_0
    return-void

    .line 1410
    :cond_0
    const v4, 0x7f0c0051

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 1411
    .local v2, titleTextView:Landroid/widget/TextView;
    invoke-virtual {v2, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1412
    invoke-virtual {v3, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 1413
    .local v1, countTextView:Landroid/widget/TextView;
    const v4, 0x7f08004b

    invoke-virtual {p0, v4}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 1414
    .local v0, countStr:Ljava/lang/String;
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1416
    if-gez p3, :cond_1

    .line 1417
    const/4 v4, 0x4

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    .line 1419
    :cond_1
    invoke-virtual {v1, v7}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0
.end method

.method public static updateNowPlayingList(Landroid/content/Context;)V
    .locals 8
    .parameter "context"

    .prologue
    .line 1721
    :try_start_0
    sget-object v0, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    invoke-interface {v0}, Lcom/miui/player/IMediaPlaybackService;->getAudioId()J

    move-result-wide v0

    .line 1722
    .local v0, currentId:J
    sget-object v2, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    invoke-interface {v2}, Lcom/miui/player/IMediaPlaybackService;->getQueue()[J

    move-result-object v2

    .line 1723
    .local v2, oldAudioArr:[J
    invoke-static {p0, v2}, Lcom/miui/player/MusicUtils;->getFilterNowPlayingArr(Landroid/content/Context;[J)Ljava/util/HashSet;

    move-result-object v3

    .line 1724
    .local v3, newAudioIdSet:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/Long;>;"
    invoke-static {v0, v1}, Lcom/miui/player/provider/PlayerProvider;->isOnlineAudio(J)Z

    move-result p0

    .end local p0
    if-nez p0, :cond_0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    invoke-virtual {v3, p0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    .line 1725
    sget-object p0, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    invoke-interface {p0}, Lcom/miui/player/IMediaPlaybackService;->stop()V

    .line 1728
    :cond_0
    const/4 v4, 0x0

    .line 1729
    .local v4, oldAudioIndex:I
    array-length p0, v2

    invoke-virtual {v3}, Ljava/util/HashSet;->size()I

    move-result v0

    .end local v0           #currentId:J
    sub-int/2addr p0, v0

    .line 1730
    .local p0, length:I
    if-nez p0, :cond_2

    .line 1754
    .end local v2           #oldAudioArr:[J
    .end local v3           #newAudioIdSet:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/Long;>;"
    .end local v4           #oldAudioIndex:I
    .end local p0           #length:I
    :cond_1
    :goto_0
    return-void

    .line 1733
    .restart local v2       #oldAudioArr:[J
    .restart local v3       #newAudioIdSet:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/Long;>;"
    .restart local v4       #oldAudioIndex:I
    .restart local p0       #length:I
    :cond_2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1734
    .local v0, deletePosList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    move-object p0, v2

    .local p0, arr$:[J
    array-length v2, p0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    move v6, v4

    .end local v4           #oldAudioIndex:I
    .local v6, oldAudioIndex:I
    :goto_1
    if-ge v1, v2, :cond_4

    aget-wide v4, p0, v1

    .line 1735
    .local v4, oldAudioId:J
    invoke-static {v4, v5}, Lcom/miui/player/provider/PlayerProvider;->isOnlineAudio(J)Z

    move-result v7

    if-nez v7, :cond_3

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    .end local v4           #oldAudioId:J
    invoke-virtual {v3, v4}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 1736
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1738
    :cond_3
    add-int/lit8 v4, v6, 0x1

    .line 1734
    .end local v6           #oldAudioIndex:I
    .local v4, oldAudioIndex:I
    add-int/lit8 v1, v1, 0x1

    move v6, v4

    .end local v4           #oldAudioIndex:I
    .restart local v6       #oldAudioIndex:I
    goto :goto_1

    .line 1740
    :cond_4
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p0

    .end local p0           #arr$:[J
    if-nez p0, :cond_1

    .line 1744
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 1745
    .local v2, size:I
    new-array p0, v2, [I

    .line 1746
    .local p0, deletePosArr:[I
    const/4 v1, 0x0

    .end local v3           #newAudioIdSet:Ljava/util/HashSet;,"Ljava/util/HashSet<Ljava/lang/Long;>;"
    .local v1, index:I
    :goto_2
    if-ge v1, v2, :cond_5

    .line 1747
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    aput v3, p0, v1

    .line 1746
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 1749
    :cond_5
    sget-object v0, Lcom/miui/player/MusicUtils;->sService:Lcom/miui/player/IMediaPlaybackService;

    .end local v0           #deletePosList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-interface {v0, p0}, Lcom/miui/player/IMediaPlaybackService;->removeTracksBatch([I)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1751
    .end local v1           #index:I
    .end local v2           #size:I
    .end local v6           #oldAudioIndex:I
    .end local p0           #deletePosArr:[I
    :catch_0
    move-exception p0

    .line 1752
    .local p0, e:Landroid/os/RemoteException;
    invoke-virtual {p0}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_0
.end method

.method public static wrapWithBlacklist(Landroid/content/Context;)Ljava/lang/String;
    .locals 2
    .parameter "context"

    .prologue
    .line 1300
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Lcom/miui/player/MusicUtils;->wrapWithBlacklist(Landroid/content/Context;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static wrapWithBlacklist(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "context"
    .parameter "rawWhereClause"

    .prologue
    .line 1304
    const/4 v0, 0x1

    invoke-static {p0, p1, v0}, Lcom/miui/player/MusicUtils;->wrapWithBlacklist(Landroid/content/Context;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static wrapWithBlacklist(Landroid/content/Context;Ljava/lang/String;Z)Ljava/lang/String;
    .locals 12
    .parameter "context"
    .parameter "rawWhereClause"
    .parameter "isFolderFilter"

    .prologue
    const-string v11, "_data"

    const-string v10, "\'"

    const-string v9, "!=\'"

    const-string v8, " AND "

    .line 1310
    const-string v0, " AND "

    .line 1312
    .local v0, AND_CLAUSE:Ljava/lang/String;
    const-string v7, "min_music_filter_size"

    invoke-static {p0, v7}, Lcom/miui/player/ui/PreferencesActivity;->getPrefAsInteger(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 1315
    .local v1, SIZE_BORDER:I
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 1316
    .local v6, sb:Ljava/lang/StringBuilder;
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 1317
    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1318
    const-string v7, " AND "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1321
    :cond_0
    const-string v7, "_size"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1322
    const-string v7, ">"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1323
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1325
    if-eqz p2, :cond_2

    .line 1326
    invoke-static {p0}, Lcom/miui/player/helper/FolderPathProvider;->instance(Landroid/content/Context;)Lcom/miui/player/helper/FolderPathProvider;

    move-result-object v7

    invoke-virtual {v7}, Lcom/miui/player/helper/FolderPathProvider;->getPathSet()Ljava/lang/String;

    move-result-object v5

    .line 1327
    .local v5, likeClause:Ljava/lang/String;
    if-eqz v5, :cond_2

    .line 1328
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 1329
    const-string v7, " AND "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1331
    :cond_1
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1335
    .end local v5           #likeClause:Ljava/lang/String;
    :cond_2
    invoke-static {}, Lcom/miui/player/helper/AsyncMusicPlayer;->getTempFilePathArr()[Ljava/lang/String;

    move-result-object v2

    .line 1336
    .local v2, filePathArr:[Ljava/lang/String;
    if-eqz v2, :cond_4

    array-length v7, v2

    if-lez v7, :cond_4

    .line 1337
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_3

    .line 1338
    const-string v7, " AND "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1340
    :cond_3
    const-string v7, "_data"

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1341
    const-string v7, "!=\'"

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1342
    const/4 v7, 0x0

    aget-object v7, v2, v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1343
    const-string v7, "\'"

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1345
    array-length v4, v2

    .line 1346
    .local v4, len:I
    const/4 v3, 0x1

    .local v3, i:I
    :goto_0
    if-ge v3, v4, :cond_4

    .line 1347
    const-string v7, " AND "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1348
    const-string v7, "_data"

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1349
    const-string v7, "!=\'"

    invoke-virtual {v6, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1350
    aget-object v7, v2, v3

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1351
    const-string v7, "\'"

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1346
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1355
    .end local v3           #i:I
    .end local v4           #len:I
    :cond_4
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    return-object v7
.end method
