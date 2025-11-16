class RouteNames {
  // Main Navigation Routes
  static const String home = '/';
  static const String teamList = '/teams';
  static const String history = '/history';
  static const String settings = '/settings';

  // Team Routes
  static const String createTeam = '/teams/create';
  static const String teamDetails = '/teams/:id';
  static const String addPlayer = '/teams/:id/add-player';

  // Game Routes
  static const String gameSetup = '/game/setup';
  static const String lineupSelect = '/game/lineup';
  static const String gameLive = '/game/live/:id';
  static const String gameSummary = '/game/summary/:id';

  // Stats Routes
  static const String playerStats = '/stats/player/:id';
}
