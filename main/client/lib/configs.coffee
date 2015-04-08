@defaultAvatarUrl = '/images/default_avatar.png'


@loadingMore = new ReactiveVar(false)

@AppConfig =
  appName: 'Dive Bar'

@SessionKeys =
  currentTab: 'ionTab.current'
  listQuery: 'listQuery'


Comments.ui.config
  limit: 5
  loadMoreCount: 10
