import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart';

// Teams Table
class Teams extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  DateTimeColumn get createdAt => dateTime()();
}

// Players Table
class Players extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get teamId =>
      integer().references(Teams, #id, onDelete: KeyAction.cascade)();
  TextColumn get name => text()();
  IntColumn get jerseyNumber => integer()();
  TextColumn get position => text()(); // PG, SG, SF, PF, C
  DateTimeColumn get createdAt => dateTime()();
}

// Games Table
class Games extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get teamId =>
      integer().references(Teams, #id, onDelete: KeyAction.cascade)();
  TextColumn get opponentName => text()();
  DateTimeColumn get gameDate => dateTime()();
  TextColumn get status => text()(); // 'in_progress', 'completed'
  IntColumn get quarterDuration => integer()(); // in minutes
  IntColumn get currentQuarter => integer()();
  IntColumn get currentQuarterSeconds =>
      integer()(); // elapsed seconds in current quarter
  BoolColumn get isTimerRunning => boolean()();
  DateTimeColumn get createdAt => dateTime()();
}

// Player Game Stats Table
class PlayerGameStats extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get gameId =>
      integer().references(Games, #id, onDelete: KeyAction.cascade)();
  IntColumn get playerId =>
      integer().references(Players, #id, onDelete: KeyAction.cascade)();

  // Playing status
  BoolColumn get isOnCourt => boolean()();
  IntColumn get minutesPlayed => integer()(); // in seconds

  // Scoring
  IntColumn get twoPointMade => integer()();
  IntColumn get twoPointAttempted => integer()();
  IntColumn get threePointMade => integer()();
  IntColumn get threePointAttempted => integer()();
  IntColumn get freeThrowMade => integer()();
  IntColumn get freeThrowAttempted => integer()();

  // Other stats
  IntColumn get assists => integer()();
  IntColumn get offensiveRebounds => integer()();
  IntColumn get defensiveRebounds => integer()();
  IntColumn get blocks => integer()();
  IntColumn get steals => integer()();
  IntColumn get turnovers => integer()();
  IntColumn get fouls => integer()();

  // Advanced
  IntColumn get plusMinus => integer()();
}

// Game Events Table (for undo functionality)
class GameEvents extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get gameId =>
      integer().references(Games, #id, onDelete: KeyAction.cascade)();
  IntColumn get playerId =>
      integer().references(Players, #id, onDelete: KeyAction.cascade)();
  TextColumn get eventType => text()(); // '2pt_made', '3pt_missed', etc.
  IntColumn get quarter => integer()();
  IntColumn get quarterSeconds => integer()();
  DateTimeColumn get timestamp => dateTime()();
}

// Substitutions Table
class Substitutions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get gameId =>
      integer().references(Games, #id, onDelete: KeyAction.cascade)();
  IntColumn get playerInId => integer().references(Players, #id)();
  IntColumn get playerOutId => integer().references(Players, #id)();
  IntColumn get quarter => integer()();
  IntColumn get quarterSeconds => integer()();
  DateTimeColumn get timestamp => dateTime()();
}

@DriftDatabase(
  tables: [Teams, Players, Games, PlayerGameStats, GameEvents, Substitutions],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'hooply.sqlite'));
    return NativeDatabase(file);
  });
}
