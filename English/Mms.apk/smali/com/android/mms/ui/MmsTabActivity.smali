.class public Lcom/android/mms/ui/MmsTabActivity;
.super Landroid/app/TabActivity;
.source "MmsTabActivity.java"

# interfaces
.implements Landroid/widget/EditableListView$EditModeListener;
.implements Landroid/widget/TabHost$OnTabChangeListener;


# instance fields
.field private mNewMessage:Landroid/widget/ImageTextButton;

.field private mTabHost:Landroid/widget/TabHost;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Landroid/app/TabActivity;-><init>()V

    return-void
.end method

.method private setupBookmarkTab()V
    .locals 4

    .prologue
    .line 64
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 65
    const-class v1, Lcom/android/mms/ui/Bookmark;

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 66
    iget-object v1, p0, Lcom/android/mms/ui/MmsTabActivity;->mTabHost:Landroid/widget/TabHost;

    iget-object v2, p0, Lcom/android/mms/ui/MmsTabActivity;->mTabHost:Landroid/widget/TabHost;

    const-string v3, "bookmark"

    invoke-virtual {v2, v3}, Landroid/widget/TabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v2

    const v3, 0x7f090131

    invoke-virtual {p0, v3}, Lcom/android/mms/ui/MmsTabActivity;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TabHost$TabSpec;->setIndicator(Ljava/lang/CharSequence;)Landroid/widget/TabHost$TabSpec;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/content/Intent;)Landroid/widget/TabHost$TabSpec;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    .line 68
    return-void
.end method

.method private setupConversationTab()V
    .locals 4

    .prologue
    .line 57
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 58
    .local v0, intent:Landroid/content/Intent;
    const-class v1, Lcom/android/mms/ui/ConversationList;

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 59
    iget-object v1, p0, Lcom/android/mms/ui/MmsTabActivity;->mTabHost:Landroid/widget/TabHost;

    iget-object v2, p0, Lcom/android/mms/ui/MmsTabActivity;->mTabHost:Landroid/widget/TabHost;

    const-string v3, "conversation"

    invoke-virtual {v2, v3}, Landroid/widget/TabHost;->newTabSpec(Ljava/lang/String;)Landroid/widget/TabHost$TabSpec;

    move-result-object v2

    const v3, 0x7f090002

    invoke-virtual {p0, v3}, Lcom/android/mms/ui/MmsTabActivity;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TabHost$TabSpec;->setIndicator(Ljava/lang/CharSequence;)Landroid/widget/TabHost$TabSpec;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/content/Intent;)Landroid/widget/TabHost$TabSpec;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    .line 61
    return-void
.end method


# virtual methods
.method public onCheckStateChanged(Landroid/widget/EditableListView$EditableListViewCheckable;)V
    .locals 0
    .parameter "checkable"

    .prologue
    .line 101
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .parameter "icicle"

    .prologue
    .line 22
    invoke-super {p0, p1}, Landroid/app/TabActivity;->onCreate(Landroid/os/Bundle;)V

    .line 23
    invoke-static {p0}, Lcom/android/mms/ui/MessageUtils;->loadFontSizeConfiguration(Landroid/content/Context;)V

    .line 25
    const v0, 0x7f030033

    invoke-virtual {p0, v0}, Lcom/android/mms/ui/MmsTabActivity;->setContentView(I)V

    .line 27
    invoke-virtual {p0}, Lcom/android/mms/ui/MmsTabActivity;->getTabHost()Landroid/widget/TabHost;

    move-result-object v0

    iput-object v0, p0, Lcom/android/mms/ui/MmsTabActivity;->mTabHost:Landroid/widget/TabHost;

    .line 28
    iget-object v0, p0, Lcom/android/mms/ui/MmsTabActivity;->mTabHost:Landroid/widget/TabHost;

    invoke-virtual {v0, p0}, Landroid/widget/TabHost;->setOnTabChangedListener(Landroid/widget/TabHost$OnTabChangeListener;)V

    .line 29
    const v0, 0x7f0d009b

    invoke-virtual {p0, v0}, Lcom/android/mms/ui/MmsTabActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageTextButton;

    iput-object v0, p0, Lcom/android/mms/ui/MmsTabActivity;->mNewMessage:Landroid/widget/ImageTextButton;

    .line 32
    invoke-direct {p0}, Lcom/android/mms/ui/MmsTabActivity;->setupConversationTab()V

    .line 33
    invoke-direct {p0}, Lcom/android/mms/ui/MmsTabActivity;->setupBookmarkTab()V

    .line 36
    iget-object v0, p0, Lcom/android/mms/ui/MmsTabActivity;->mNewMessage:Landroid/widget/ImageTextButton;

    new-instance v1, Lcom/android/mms/ui/MmsTabActivity$1;

    invoke-direct {v1, p0}, Lcom/android/mms/ui/MmsTabActivity$1;-><init>(Lcom/android/mms/ui/MmsTabActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageTextButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 48
    return-void
.end method

.method public onEnterEditMode()V
    .locals 2

    .prologue
    .line 91
    iget-object v0, p0, Lcom/android/mms/ui/MmsTabActivity;->mNewMessage:Landroid/widget/ImageTextButton;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageTextButton;->setVisibility(I)V

    .line 92
    return-void
.end method

.method public onExitEditMode()V
    .locals 2

    .prologue
    .line 96
    iget-object v0, p0, Lcom/android/mms/ui/MmsTabActivity;->mNewMessage:Landroid/widget/ImageTextButton;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageTextButton;->setVisibility(I)V

    .line 97
    return-void
.end method

.method protected onResume()V
    .locals 0

    .prologue
    .line 52
    invoke-super {p0}, Landroid/app/TabActivity;->onResume()V

    .line 53
    invoke-static {}, Lcom/android/mms/ui/NewMessagePopupActivity;->dismiss()V

    .line 54
    return-void
.end method

.method public onTabChanged(Ljava/lang/String;)V
    .locals 2
    .parameter "tabId"

    .prologue
    .line 79
    invoke-virtual {p0}, Lcom/android/mms/ui/MmsTabActivity;->getLocalActivityManager()Landroid/app/LocalActivityManager;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/app/LocalActivityManager;->getActivity(Ljava/lang/String;)Landroid/app/Activity;

    move-result-object v0

    .line 80
    .local v0, activity:Landroid/app/Activity;
    if-eqz v0, :cond_0

    .line 81
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V

    .line 83
    const-string v1, "conversation"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 84
    check-cast v0, Lcom/android/mms/ui/ConversationList;

    .end local v0           #activity:Landroid/app/Activity;
    invoke-virtual {v0, p0}, Lcom/android/mms/ui/ConversationList;->addEditModeListener(Landroid/widget/EditableListView$EditModeListener;)V

    .line 87
    :cond_0
    return-void
.end method
