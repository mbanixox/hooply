class AppConstants {
  // Player Positions
  static const List<String> positions = ['PG', 'SG', 'SF', 'PF', 'C'];

  static const Map<String, String> positionNames = {
    'PG': 'Point Guard',
    'SG': 'Shooting Guard',
    'SF': 'Small Forward',
    'PF': 'Power Forward',
    'C': 'Center',
  };

  // Game Event Types
  static const String event2PtMade = '2pt_made';
  static const String event2PtMissed = '2pt_missed';
  static const String event3PtMade = '3pt_made';
  static const String event3PtMissed = '3pt_missed';
  static const String eventFTMade = 'ft_made';
  static const String eventFTMissed = 'ft_missed';
  static const String eventAssist = 'assist';
  static const String eventReboundOff = 'rebound_off';
  static const String eventReboundDef = 'rebound_def';
  static const String eventBlock = 'block';
  static const String eventSteal = 'steal';
  static const String eventTurnover = 'turnover';
  static const String eventFoul = 'foul';
  static const String eventSubstitution = 'substitution';

  // Game Status
  static const String gameStatusInProgress = 'in_progress';
  static const String gameStatusCompleted = 'completed';

  // Default Settings
  static const int defaultQuarterDuration = 12; // minutes
  static const int playersOnCourt = 5;
}
