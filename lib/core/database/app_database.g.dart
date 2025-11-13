// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $TeamsTable extends Teams with TableInfo<$TeamsTable, Team> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TeamsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'teams';
  @override
  VerificationContext validateIntegrity(
    Insertable<Team> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Team map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Team(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $TeamsTable createAlias(String alias) {
    return $TeamsTable(attachedDatabase, alias);
  }
}

class Team extends DataClass implements Insertable<Team> {
  final int id;
  final String name;
  final DateTime createdAt;
  const Team({required this.id, required this.name, required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TeamsCompanion toCompanion(bool nullToAbsent) {
    return TeamsCompanion(
      id: Value(id),
      name: Value(name),
      createdAt: Value(createdAt),
    );
  }

  factory Team.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Team(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Team copyWith({int? id, String? name, DateTime? createdAt}) => Team(
    id: id ?? this.id,
    name: name ?? this.name,
    createdAt: createdAt ?? this.createdAt,
  );
  Team copyWithCompanion(TeamsCompanion data) {
    return Team(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Team(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Team &&
          other.id == this.id &&
          other.name == this.name &&
          other.createdAt == this.createdAt);
}

class TeamsCompanion extends UpdateCompanion<Team> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> createdAt;
  const TeamsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  TeamsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required DateTime createdAt,
  }) : name = Value(name),
       createdAt = Value(createdAt);
  static Insertable<Team> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  TeamsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<DateTime>? createdAt,
  }) {
    return TeamsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TeamsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $PlayersTable extends Players with TableInfo<$PlayersTable, Player> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlayersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _teamIdMeta = const VerificationMeta('teamId');
  @override
  late final GeneratedColumn<int> teamId = GeneratedColumn<int>(
    'team_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES teams (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _jerseyNumberMeta = const VerificationMeta(
    'jerseyNumber',
  );
  @override
  late final GeneratedColumn<int> jerseyNumber = GeneratedColumn<int>(
    'jersey_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _positionMeta = const VerificationMeta(
    'position',
  );
  @override
  late final GeneratedColumn<String> position = GeneratedColumn<String>(
    'position',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    teamId,
    name,
    jerseyNumber,
    position,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'players';
  @override
  VerificationContext validateIntegrity(
    Insertable<Player> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('team_id')) {
      context.handle(
        _teamIdMeta,
        teamId.isAcceptableOrUnknown(data['team_id']!, _teamIdMeta),
      );
    } else if (isInserting) {
      context.missing(_teamIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('jersey_number')) {
      context.handle(
        _jerseyNumberMeta,
        jerseyNumber.isAcceptableOrUnknown(
          data['jersey_number']!,
          _jerseyNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_jerseyNumberMeta);
    }
    if (data.containsKey('position')) {
      context.handle(
        _positionMeta,
        position.isAcceptableOrUnknown(data['position']!, _positionMeta),
      );
    } else if (isInserting) {
      context.missing(_positionMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Player map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Player(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      teamId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}team_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      jerseyNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}jersey_number'],
      )!,
      position: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}position'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $PlayersTable createAlias(String alias) {
    return $PlayersTable(attachedDatabase, alias);
  }
}

class Player extends DataClass implements Insertable<Player> {
  final int id;
  final int teamId;
  final String name;
  final int jerseyNumber;
  final String position;
  final DateTime createdAt;
  const Player({
    required this.id,
    required this.teamId,
    required this.name,
    required this.jerseyNumber,
    required this.position,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['team_id'] = Variable<int>(teamId);
    map['name'] = Variable<String>(name);
    map['jersey_number'] = Variable<int>(jerseyNumber);
    map['position'] = Variable<String>(position);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PlayersCompanion toCompanion(bool nullToAbsent) {
    return PlayersCompanion(
      id: Value(id),
      teamId: Value(teamId),
      name: Value(name),
      jerseyNumber: Value(jerseyNumber),
      position: Value(position),
      createdAt: Value(createdAt),
    );
  }

  factory Player.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Player(
      id: serializer.fromJson<int>(json['id']),
      teamId: serializer.fromJson<int>(json['teamId']),
      name: serializer.fromJson<String>(json['name']),
      jerseyNumber: serializer.fromJson<int>(json['jerseyNumber']),
      position: serializer.fromJson<String>(json['position']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'teamId': serializer.toJson<int>(teamId),
      'name': serializer.toJson<String>(name),
      'jerseyNumber': serializer.toJson<int>(jerseyNumber),
      'position': serializer.toJson<String>(position),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Player copyWith({
    int? id,
    int? teamId,
    String? name,
    int? jerseyNumber,
    String? position,
    DateTime? createdAt,
  }) => Player(
    id: id ?? this.id,
    teamId: teamId ?? this.teamId,
    name: name ?? this.name,
    jerseyNumber: jerseyNumber ?? this.jerseyNumber,
    position: position ?? this.position,
    createdAt: createdAt ?? this.createdAt,
  );
  Player copyWithCompanion(PlayersCompanion data) {
    return Player(
      id: data.id.present ? data.id.value : this.id,
      teamId: data.teamId.present ? data.teamId.value : this.teamId,
      name: data.name.present ? data.name.value : this.name,
      jerseyNumber: data.jerseyNumber.present
          ? data.jerseyNumber.value
          : this.jerseyNumber,
      position: data.position.present ? data.position.value : this.position,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Player(')
          ..write('id: $id, ')
          ..write('teamId: $teamId, ')
          ..write('name: $name, ')
          ..write('jerseyNumber: $jerseyNumber, ')
          ..write('position: $position, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, teamId, name, jerseyNumber, position, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Player &&
          other.id == this.id &&
          other.teamId == this.teamId &&
          other.name == this.name &&
          other.jerseyNumber == this.jerseyNumber &&
          other.position == this.position &&
          other.createdAt == this.createdAt);
}

class PlayersCompanion extends UpdateCompanion<Player> {
  final Value<int> id;
  final Value<int> teamId;
  final Value<String> name;
  final Value<int> jerseyNumber;
  final Value<String> position;
  final Value<DateTime> createdAt;
  const PlayersCompanion({
    this.id = const Value.absent(),
    this.teamId = const Value.absent(),
    this.name = const Value.absent(),
    this.jerseyNumber = const Value.absent(),
    this.position = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  PlayersCompanion.insert({
    this.id = const Value.absent(),
    required int teamId,
    required String name,
    required int jerseyNumber,
    required String position,
    required DateTime createdAt,
  }) : teamId = Value(teamId),
       name = Value(name),
       jerseyNumber = Value(jerseyNumber),
       position = Value(position),
       createdAt = Value(createdAt);
  static Insertable<Player> custom({
    Expression<int>? id,
    Expression<int>? teamId,
    Expression<String>? name,
    Expression<int>? jerseyNumber,
    Expression<String>? position,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (teamId != null) 'team_id': teamId,
      if (name != null) 'name': name,
      if (jerseyNumber != null) 'jersey_number': jerseyNumber,
      if (position != null) 'position': position,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  PlayersCompanion copyWith({
    Value<int>? id,
    Value<int>? teamId,
    Value<String>? name,
    Value<int>? jerseyNumber,
    Value<String>? position,
    Value<DateTime>? createdAt,
  }) {
    return PlayersCompanion(
      id: id ?? this.id,
      teamId: teamId ?? this.teamId,
      name: name ?? this.name,
      jerseyNumber: jerseyNumber ?? this.jerseyNumber,
      position: position ?? this.position,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (teamId.present) {
      map['team_id'] = Variable<int>(teamId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (jerseyNumber.present) {
      map['jersey_number'] = Variable<int>(jerseyNumber.value);
    }
    if (position.present) {
      map['position'] = Variable<String>(position.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlayersCompanion(')
          ..write('id: $id, ')
          ..write('teamId: $teamId, ')
          ..write('name: $name, ')
          ..write('jerseyNumber: $jerseyNumber, ')
          ..write('position: $position, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $GamesTable extends Games with TableInfo<$GamesTable, Game> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GamesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _teamIdMeta = const VerificationMeta('teamId');
  @override
  late final GeneratedColumn<int> teamId = GeneratedColumn<int>(
    'team_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES teams (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _opponentNameMeta = const VerificationMeta(
    'opponentName',
  );
  @override
  late final GeneratedColumn<String> opponentName = GeneratedColumn<String>(
    'opponent_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _gameDateMeta = const VerificationMeta(
    'gameDate',
  );
  @override
  late final GeneratedColumn<DateTime> gameDate = GeneratedColumn<DateTime>(
    'game_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quarterDurationMeta = const VerificationMeta(
    'quarterDuration',
  );
  @override
  late final GeneratedColumn<int> quarterDuration = GeneratedColumn<int>(
    'quarter_duration',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currentQuarterMeta = const VerificationMeta(
    'currentQuarter',
  );
  @override
  late final GeneratedColumn<int> currentQuarter = GeneratedColumn<int>(
    'current_quarter',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currentQuarterSecondsMeta =
      const VerificationMeta('currentQuarterSeconds');
  @override
  late final GeneratedColumn<int> currentQuarterSeconds = GeneratedColumn<int>(
    'current_quarter_seconds',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isTimerRunningMeta = const VerificationMeta(
    'isTimerRunning',
  );
  @override
  late final GeneratedColumn<bool> isTimerRunning = GeneratedColumn<bool>(
    'is_timer_running',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_timer_running" IN (0, 1))',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    teamId,
    opponentName,
    gameDate,
    status,
    quarterDuration,
    currentQuarter,
    currentQuarterSeconds,
    isTimerRunning,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'games';
  @override
  VerificationContext validateIntegrity(
    Insertable<Game> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('team_id')) {
      context.handle(
        _teamIdMeta,
        teamId.isAcceptableOrUnknown(data['team_id']!, _teamIdMeta),
      );
    } else if (isInserting) {
      context.missing(_teamIdMeta);
    }
    if (data.containsKey('opponent_name')) {
      context.handle(
        _opponentNameMeta,
        opponentName.isAcceptableOrUnknown(
          data['opponent_name']!,
          _opponentNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_opponentNameMeta);
    }
    if (data.containsKey('game_date')) {
      context.handle(
        _gameDateMeta,
        gameDate.isAcceptableOrUnknown(data['game_date']!, _gameDateMeta),
      );
    } else if (isInserting) {
      context.missing(_gameDateMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('quarter_duration')) {
      context.handle(
        _quarterDurationMeta,
        quarterDuration.isAcceptableOrUnknown(
          data['quarter_duration']!,
          _quarterDurationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_quarterDurationMeta);
    }
    if (data.containsKey('current_quarter')) {
      context.handle(
        _currentQuarterMeta,
        currentQuarter.isAcceptableOrUnknown(
          data['current_quarter']!,
          _currentQuarterMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_currentQuarterMeta);
    }
    if (data.containsKey('current_quarter_seconds')) {
      context.handle(
        _currentQuarterSecondsMeta,
        currentQuarterSeconds.isAcceptableOrUnknown(
          data['current_quarter_seconds']!,
          _currentQuarterSecondsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_currentQuarterSecondsMeta);
    }
    if (data.containsKey('is_timer_running')) {
      context.handle(
        _isTimerRunningMeta,
        isTimerRunning.isAcceptableOrUnknown(
          data['is_timer_running']!,
          _isTimerRunningMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_isTimerRunningMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Game map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Game(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      teamId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}team_id'],
      )!,
      opponentName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}opponent_name'],
      )!,
      gameDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}game_date'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      quarterDuration: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quarter_duration'],
      )!,
      currentQuarter: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}current_quarter'],
      )!,
      currentQuarterSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}current_quarter_seconds'],
      )!,
      isTimerRunning: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_timer_running'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $GamesTable createAlias(String alias) {
    return $GamesTable(attachedDatabase, alias);
  }
}

class Game extends DataClass implements Insertable<Game> {
  final int id;
  final int teamId;
  final String opponentName;
  final DateTime gameDate;
  final String status;
  final int quarterDuration;
  final int currentQuarter;
  final int currentQuarterSeconds;
  final bool isTimerRunning;
  final DateTime createdAt;
  const Game({
    required this.id,
    required this.teamId,
    required this.opponentName,
    required this.gameDate,
    required this.status,
    required this.quarterDuration,
    required this.currentQuarter,
    required this.currentQuarterSeconds,
    required this.isTimerRunning,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['team_id'] = Variable<int>(teamId);
    map['opponent_name'] = Variable<String>(opponentName);
    map['game_date'] = Variable<DateTime>(gameDate);
    map['status'] = Variable<String>(status);
    map['quarter_duration'] = Variable<int>(quarterDuration);
    map['current_quarter'] = Variable<int>(currentQuarter);
    map['current_quarter_seconds'] = Variable<int>(currentQuarterSeconds);
    map['is_timer_running'] = Variable<bool>(isTimerRunning);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  GamesCompanion toCompanion(bool nullToAbsent) {
    return GamesCompanion(
      id: Value(id),
      teamId: Value(teamId),
      opponentName: Value(opponentName),
      gameDate: Value(gameDate),
      status: Value(status),
      quarterDuration: Value(quarterDuration),
      currentQuarter: Value(currentQuarter),
      currentQuarterSeconds: Value(currentQuarterSeconds),
      isTimerRunning: Value(isTimerRunning),
      createdAt: Value(createdAt),
    );
  }

  factory Game.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Game(
      id: serializer.fromJson<int>(json['id']),
      teamId: serializer.fromJson<int>(json['teamId']),
      opponentName: serializer.fromJson<String>(json['opponentName']),
      gameDate: serializer.fromJson<DateTime>(json['gameDate']),
      status: serializer.fromJson<String>(json['status']),
      quarterDuration: serializer.fromJson<int>(json['quarterDuration']),
      currentQuarter: serializer.fromJson<int>(json['currentQuarter']),
      currentQuarterSeconds: serializer.fromJson<int>(
        json['currentQuarterSeconds'],
      ),
      isTimerRunning: serializer.fromJson<bool>(json['isTimerRunning']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'teamId': serializer.toJson<int>(teamId),
      'opponentName': serializer.toJson<String>(opponentName),
      'gameDate': serializer.toJson<DateTime>(gameDate),
      'status': serializer.toJson<String>(status),
      'quarterDuration': serializer.toJson<int>(quarterDuration),
      'currentQuarter': serializer.toJson<int>(currentQuarter),
      'currentQuarterSeconds': serializer.toJson<int>(currentQuarterSeconds),
      'isTimerRunning': serializer.toJson<bool>(isTimerRunning),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Game copyWith({
    int? id,
    int? teamId,
    String? opponentName,
    DateTime? gameDate,
    String? status,
    int? quarterDuration,
    int? currentQuarter,
    int? currentQuarterSeconds,
    bool? isTimerRunning,
    DateTime? createdAt,
  }) => Game(
    id: id ?? this.id,
    teamId: teamId ?? this.teamId,
    opponentName: opponentName ?? this.opponentName,
    gameDate: gameDate ?? this.gameDate,
    status: status ?? this.status,
    quarterDuration: quarterDuration ?? this.quarterDuration,
    currentQuarter: currentQuarter ?? this.currentQuarter,
    currentQuarterSeconds: currentQuarterSeconds ?? this.currentQuarterSeconds,
    isTimerRunning: isTimerRunning ?? this.isTimerRunning,
    createdAt: createdAt ?? this.createdAt,
  );
  Game copyWithCompanion(GamesCompanion data) {
    return Game(
      id: data.id.present ? data.id.value : this.id,
      teamId: data.teamId.present ? data.teamId.value : this.teamId,
      opponentName: data.opponentName.present
          ? data.opponentName.value
          : this.opponentName,
      gameDate: data.gameDate.present ? data.gameDate.value : this.gameDate,
      status: data.status.present ? data.status.value : this.status,
      quarterDuration: data.quarterDuration.present
          ? data.quarterDuration.value
          : this.quarterDuration,
      currentQuarter: data.currentQuarter.present
          ? data.currentQuarter.value
          : this.currentQuarter,
      currentQuarterSeconds: data.currentQuarterSeconds.present
          ? data.currentQuarterSeconds.value
          : this.currentQuarterSeconds,
      isTimerRunning: data.isTimerRunning.present
          ? data.isTimerRunning.value
          : this.isTimerRunning,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Game(')
          ..write('id: $id, ')
          ..write('teamId: $teamId, ')
          ..write('opponentName: $opponentName, ')
          ..write('gameDate: $gameDate, ')
          ..write('status: $status, ')
          ..write('quarterDuration: $quarterDuration, ')
          ..write('currentQuarter: $currentQuarter, ')
          ..write('currentQuarterSeconds: $currentQuarterSeconds, ')
          ..write('isTimerRunning: $isTimerRunning, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    teamId,
    opponentName,
    gameDate,
    status,
    quarterDuration,
    currentQuarter,
    currentQuarterSeconds,
    isTimerRunning,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Game &&
          other.id == this.id &&
          other.teamId == this.teamId &&
          other.opponentName == this.opponentName &&
          other.gameDate == this.gameDate &&
          other.status == this.status &&
          other.quarterDuration == this.quarterDuration &&
          other.currentQuarter == this.currentQuarter &&
          other.currentQuarterSeconds == this.currentQuarterSeconds &&
          other.isTimerRunning == this.isTimerRunning &&
          other.createdAt == this.createdAt);
}

class GamesCompanion extends UpdateCompanion<Game> {
  final Value<int> id;
  final Value<int> teamId;
  final Value<String> opponentName;
  final Value<DateTime> gameDate;
  final Value<String> status;
  final Value<int> quarterDuration;
  final Value<int> currentQuarter;
  final Value<int> currentQuarterSeconds;
  final Value<bool> isTimerRunning;
  final Value<DateTime> createdAt;
  const GamesCompanion({
    this.id = const Value.absent(),
    this.teamId = const Value.absent(),
    this.opponentName = const Value.absent(),
    this.gameDate = const Value.absent(),
    this.status = const Value.absent(),
    this.quarterDuration = const Value.absent(),
    this.currentQuarter = const Value.absent(),
    this.currentQuarterSeconds = const Value.absent(),
    this.isTimerRunning = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  GamesCompanion.insert({
    this.id = const Value.absent(),
    required int teamId,
    required String opponentName,
    required DateTime gameDate,
    required String status,
    required int quarterDuration,
    required int currentQuarter,
    required int currentQuarterSeconds,
    required bool isTimerRunning,
    required DateTime createdAt,
  }) : teamId = Value(teamId),
       opponentName = Value(opponentName),
       gameDate = Value(gameDate),
       status = Value(status),
       quarterDuration = Value(quarterDuration),
       currentQuarter = Value(currentQuarter),
       currentQuarterSeconds = Value(currentQuarterSeconds),
       isTimerRunning = Value(isTimerRunning),
       createdAt = Value(createdAt);
  static Insertable<Game> custom({
    Expression<int>? id,
    Expression<int>? teamId,
    Expression<String>? opponentName,
    Expression<DateTime>? gameDate,
    Expression<String>? status,
    Expression<int>? quarterDuration,
    Expression<int>? currentQuarter,
    Expression<int>? currentQuarterSeconds,
    Expression<bool>? isTimerRunning,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (teamId != null) 'team_id': teamId,
      if (opponentName != null) 'opponent_name': opponentName,
      if (gameDate != null) 'game_date': gameDate,
      if (status != null) 'status': status,
      if (quarterDuration != null) 'quarter_duration': quarterDuration,
      if (currentQuarter != null) 'current_quarter': currentQuarter,
      if (currentQuarterSeconds != null)
        'current_quarter_seconds': currentQuarterSeconds,
      if (isTimerRunning != null) 'is_timer_running': isTimerRunning,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  GamesCompanion copyWith({
    Value<int>? id,
    Value<int>? teamId,
    Value<String>? opponentName,
    Value<DateTime>? gameDate,
    Value<String>? status,
    Value<int>? quarterDuration,
    Value<int>? currentQuarter,
    Value<int>? currentQuarterSeconds,
    Value<bool>? isTimerRunning,
    Value<DateTime>? createdAt,
  }) {
    return GamesCompanion(
      id: id ?? this.id,
      teamId: teamId ?? this.teamId,
      opponentName: opponentName ?? this.opponentName,
      gameDate: gameDate ?? this.gameDate,
      status: status ?? this.status,
      quarterDuration: quarterDuration ?? this.quarterDuration,
      currentQuarter: currentQuarter ?? this.currentQuarter,
      currentQuarterSeconds:
          currentQuarterSeconds ?? this.currentQuarterSeconds,
      isTimerRunning: isTimerRunning ?? this.isTimerRunning,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (teamId.present) {
      map['team_id'] = Variable<int>(teamId.value);
    }
    if (opponentName.present) {
      map['opponent_name'] = Variable<String>(opponentName.value);
    }
    if (gameDate.present) {
      map['game_date'] = Variable<DateTime>(gameDate.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (quarterDuration.present) {
      map['quarter_duration'] = Variable<int>(quarterDuration.value);
    }
    if (currentQuarter.present) {
      map['current_quarter'] = Variable<int>(currentQuarter.value);
    }
    if (currentQuarterSeconds.present) {
      map['current_quarter_seconds'] = Variable<int>(
        currentQuarterSeconds.value,
      );
    }
    if (isTimerRunning.present) {
      map['is_timer_running'] = Variable<bool>(isTimerRunning.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GamesCompanion(')
          ..write('id: $id, ')
          ..write('teamId: $teamId, ')
          ..write('opponentName: $opponentName, ')
          ..write('gameDate: $gameDate, ')
          ..write('status: $status, ')
          ..write('quarterDuration: $quarterDuration, ')
          ..write('currentQuarter: $currentQuarter, ')
          ..write('currentQuarterSeconds: $currentQuarterSeconds, ')
          ..write('isTimerRunning: $isTimerRunning, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $PlayerGameStatsTable extends PlayerGameStats
    with TableInfo<$PlayerGameStatsTable, PlayerGameStat> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlayerGameStatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _gameIdMeta = const VerificationMeta('gameId');
  @override
  late final GeneratedColumn<int> gameId = GeneratedColumn<int>(
    'game_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES games (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _playerIdMeta = const VerificationMeta(
    'playerId',
  );
  @override
  late final GeneratedColumn<int> playerId = GeneratedColumn<int>(
    'player_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES players (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _isOnCourtMeta = const VerificationMeta(
    'isOnCourt',
  );
  @override
  late final GeneratedColumn<bool> isOnCourt = GeneratedColumn<bool>(
    'is_on_court',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_on_court" IN (0, 1))',
    ),
  );
  static const VerificationMeta _minutesPlayedMeta = const VerificationMeta(
    'minutesPlayed',
  );
  @override
  late final GeneratedColumn<int> minutesPlayed = GeneratedColumn<int>(
    'minutes_played',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _twoPointMadeMeta = const VerificationMeta(
    'twoPointMade',
  );
  @override
  late final GeneratedColumn<int> twoPointMade = GeneratedColumn<int>(
    'two_point_made',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _twoPointAttemptedMeta = const VerificationMeta(
    'twoPointAttempted',
  );
  @override
  late final GeneratedColumn<int> twoPointAttempted = GeneratedColumn<int>(
    'two_point_attempted',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _threePointMadeMeta = const VerificationMeta(
    'threePointMade',
  );
  @override
  late final GeneratedColumn<int> threePointMade = GeneratedColumn<int>(
    'three_point_made',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _threePointAttemptedMeta =
      const VerificationMeta('threePointAttempted');
  @override
  late final GeneratedColumn<int> threePointAttempted = GeneratedColumn<int>(
    'three_point_attempted',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _freeThrowMadeMeta = const VerificationMeta(
    'freeThrowMade',
  );
  @override
  late final GeneratedColumn<int> freeThrowMade = GeneratedColumn<int>(
    'free_throw_made',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _freeThrowAttemptedMeta =
      const VerificationMeta('freeThrowAttempted');
  @override
  late final GeneratedColumn<int> freeThrowAttempted = GeneratedColumn<int>(
    'free_throw_attempted',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _assistsMeta = const VerificationMeta(
    'assists',
  );
  @override
  late final GeneratedColumn<int> assists = GeneratedColumn<int>(
    'assists',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _offensiveReboundsMeta = const VerificationMeta(
    'offensiveRebounds',
  );
  @override
  late final GeneratedColumn<int> offensiveRebounds = GeneratedColumn<int>(
    'offensive_rebounds',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _defensiveReboundsMeta = const VerificationMeta(
    'defensiveRebounds',
  );
  @override
  late final GeneratedColumn<int> defensiveRebounds = GeneratedColumn<int>(
    'defensive_rebounds',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _blocksMeta = const VerificationMeta('blocks');
  @override
  late final GeneratedColumn<int> blocks = GeneratedColumn<int>(
    'blocks',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stealsMeta = const VerificationMeta('steals');
  @override
  late final GeneratedColumn<int> steals = GeneratedColumn<int>(
    'steals',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _turnoversMeta = const VerificationMeta(
    'turnovers',
  );
  @override
  late final GeneratedColumn<int> turnovers = GeneratedColumn<int>(
    'turnovers',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _foulsMeta = const VerificationMeta('fouls');
  @override
  late final GeneratedColumn<int> fouls = GeneratedColumn<int>(
    'fouls',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _plusMinusMeta = const VerificationMeta(
    'plusMinus',
  );
  @override
  late final GeneratedColumn<int> plusMinus = GeneratedColumn<int>(
    'plus_minus',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    gameId,
    playerId,
    isOnCourt,
    minutesPlayed,
    twoPointMade,
    twoPointAttempted,
    threePointMade,
    threePointAttempted,
    freeThrowMade,
    freeThrowAttempted,
    assists,
    offensiveRebounds,
    defensiveRebounds,
    blocks,
    steals,
    turnovers,
    fouls,
    plusMinus,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'player_game_stats';
  @override
  VerificationContext validateIntegrity(
    Insertable<PlayerGameStat> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('game_id')) {
      context.handle(
        _gameIdMeta,
        gameId.isAcceptableOrUnknown(data['game_id']!, _gameIdMeta),
      );
    } else if (isInserting) {
      context.missing(_gameIdMeta);
    }
    if (data.containsKey('player_id')) {
      context.handle(
        _playerIdMeta,
        playerId.isAcceptableOrUnknown(data['player_id']!, _playerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_playerIdMeta);
    }
    if (data.containsKey('is_on_court')) {
      context.handle(
        _isOnCourtMeta,
        isOnCourt.isAcceptableOrUnknown(data['is_on_court']!, _isOnCourtMeta),
      );
    } else if (isInserting) {
      context.missing(_isOnCourtMeta);
    }
    if (data.containsKey('minutes_played')) {
      context.handle(
        _minutesPlayedMeta,
        minutesPlayed.isAcceptableOrUnknown(
          data['minutes_played']!,
          _minutesPlayedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_minutesPlayedMeta);
    }
    if (data.containsKey('two_point_made')) {
      context.handle(
        _twoPointMadeMeta,
        twoPointMade.isAcceptableOrUnknown(
          data['two_point_made']!,
          _twoPointMadeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_twoPointMadeMeta);
    }
    if (data.containsKey('two_point_attempted')) {
      context.handle(
        _twoPointAttemptedMeta,
        twoPointAttempted.isAcceptableOrUnknown(
          data['two_point_attempted']!,
          _twoPointAttemptedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_twoPointAttemptedMeta);
    }
    if (data.containsKey('three_point_made')) {
      context.handle(
        _threePointMadeMeta,
        threePointMade.isAcceptableOrUnknown(
          data['three_point_made']!,
          _threePointMadeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_threePointMadeMeta);
    }
    if (data.containsKey('three_point_attempted')) {
      context.handle(
        _threePointAttemptedMeta,
        threePointAttempted.isAcceptableOrUnknown(
          data['three_point_attempted']!,
          _threePointAttemptedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_threePointAttemptedMeta);
    }
    if (data.containsKey('free_throw_made')) {
      context.handle(
        _freeThrowMadeMeta,
        freeThrowMade.isAcceptableOrUnknown(
          data['free_throw_made']!,
          _freeThrowMadeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_freeThrowMadeMeta);
    }
    if (data.containsKey('free_throw_attempted')) {
      context.handle(
        _freeThrowAttemptedMeta,
        freeThrowAttempted.isAcceptableOrUnknown(
          data['free_throw_attempted']!,
          _freeThrowAttemptedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_freeThrowAttemptedMeta);
    }
    if (data.containsKey('assists')) {
      context.handle(
        _assistsMeta,
        assists.isAcceptableOrUnknown(data['assists']!, _assistsMeta),
      );
    } else if (isInserting) {
      context.missing(_assistsMeta);
    }
    if (data.containsKey('offensive_rebounds')) {
      context.handle(
        _offensiveReboundsMeta,
        offensiveRebounds.isAcceptableOrUnknown(
          data['offensive_rebounds']!,
          _offensiveReboundsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_offensiveReboundsMeta);
    }
    if (data.containsKey('defensive_rebounds')) {
      context.handle(
        _defensiveReboundsMeta,
        defensiveRebounds.isAcceptableOrUnknown(
          data['defensive_rebounds']!,
          _defensiveReboundsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_defensiveReboundsMeta);
    }
    if (data.containsKey('blocks')) {
      context.handle(
        _blocksMeta,
        blocks.isAcceptableOrUnknown(data['blocks']!, _blocksMeta),
      );
    } else if (isInserting) {
      context.missing(_blocksMeta);
    }
    if (data.containsKey('steals')) {
      context.handle(
        _stealsMeta,
        steals.isAcceptableOrUnknown(data['steals']!, _stealsMeta),
      );
    } else if (isInserting) {
      context.missing(_stealsMeta);
    }
    if (data.containsKey('turnovers')) {
      context.handle(
        _turnoversMeta,
        turnovers.isAcceptableOrUnknown(data['turnovers']!, _turnoversMeta),
      );
    } else if (isInserting) {
      context.missing(_turnoversMeta);
    }
    if (data.containsKey('fouls')) {
      context.handle(
        _foulsMeta,
        fouls.isAcceptableOrUnknown(data['fouls']!, _foulsMeta),
      );
    } else if (isInserting) {
      context.missing(_foulsMeta);
    }
    if (data.containsKey('plus_minus')) {
      context.handle(
        _plusMinusMeta,
        plusMinus.isAcceptableOrUnknown(data['plus_minus']!, _plusMinusMeta),
      );
    } else if (isInserting) {
      context.missing(_plusMinusMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlayerGameStat map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlayerGameStat(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      gameId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}game_id'],
      )!,
      playerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}player_id'],
      )!,
      isOnCourt: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_on_court'],
      )!,
      minutesPlayed: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}minutes_played'],
      )!,
      twoPointMade: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}two_point_made'],
      )!,
      twoPointAttempted: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}two_point_attempted'],
      )!,
      threePointMade: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}three_point_made'],
      )!,
      threePointAttempted: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}three_point_attempted'],
      )!,
      freeThrowMade: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}free_throw_made'],
      )!,
      freeThrowAttempted: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}free_throw_attempted'],
      )!,
      assists: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}assists'],
      )!,
      offensiveRebounds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}offensive_rebounds'],
      )!,
      defensiveRebounds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}defensive_rebounds'],
      )!,
      blocks: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}blocks'],
      )!,
      steals: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}steals'],
      )!,
      turnovers: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}turnovers'],
      )!,
      fouls: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}fouls'],
      )!,
      plusMinus: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}plus_minus'],
      )!,
    );
  }

  @override
  $PlayerGameStatsTable createAlias(String alias) {
    return $PlayerGameStatsTable(attachedDatabase, alias);
  }
}

class PlayerGameStat extends DataClass implements Insertable<PlayerGameStat> {
  final int id;
  final int gameId;
  final int playerId;
  final bool isOnCourt;
  final int minutesPlayed;
  final int twoPointMade;
  final int twoPointAttempted;
  final int threePointMade;
  final int threePointAttempted;
  final int freeThrowMade;
  final int freeThrowAttempted;
  final int assists;
  final int offensiveRebounds;
  final int defensiveRebounds;
  final int blocks;
  final int steals;
  final int turnovers;
  final int fouls;
  final int plusMinus;
  const PlayerGameStat({
    required this.id,
    required this.gameId,
    required this.playerId,
    required this.isOnCourt,
    required this.minutesPlayed,
    required this.twoPointMade,
    required this.twoPointAttempted,
    required this.threePointMade,
    required this.threePointAttempted,
    required this.freeThrowMade,
    required this.freeThrowAttempted,
    required this.assists,
    required this.offensiveRebounds,
    required this.defensiveRebounds,
    required this.blocks,
    required this.steals,
    required this.turnovers,
    required this.fouls,
    required this.plusMinus,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['game_id'] = Variable<int>(gameId);
    map['player_id'] = Variable<int>(playerId);
    map['is_on_court'] = Variable<bool>(isOnCourt);
    map['minutes_played'] = Variable<int>(minutesPlayed);
    map['two_point_made'] = Variable<int>(twoPointMade);
    map['two_point_attempted'] = Variable<int>(twoPointAttempted);
    map['three_point_made'] = Variable<int>(threePointMade);
    map['three_point_attempted'] = Variable<int>(threePointAttempted);
    map['free_throw_made'] = Variable<int>(freeThrowMade);
    map['free_throw_attempted'] = Variable<int>(freeThrowAttempted);
    map['assists'] = Variable<int>(assists);
    map['offensive_rebounds'] = Variable<int>(offensiveRebounds);
    map['defensive_rebounds'] = Variable<int>(defensiveRebounds);
    map['blocks'] = Variable<int>(blocks);
    map['steals'] = Variable<int>(steals);
    map['turnovers'] = Variable<int>(turnovers);
    map['fouls'] = Variable<int>(fouls);
    map['plus_minus'] = Variable<int>(plusMinus);
    return map;
  }

  PlayerGameStatsCompanion toCompanion(bool nullToAbsent) {
    return PlayerGameStatsCompanion(
      id: Value(id),
      gameId: Value(gameId),
      playerId: Value(playerId),
      isOnCourt: Value(isOnCourt),
      minutesPlayed: Value(minutesPlayed),
      twoPointMade: Value(twoPointMade),
      twoPointAttempted: Value(twoPointAttempted),
      threePointMade: Value(threePointMade),
      threePointAttempted: Value(threePointAttempted),
      freeThrowMade: Value(freeThrowMade),
      freeThrowAttempted: Value(freeThrowAttempted),
      assists: Value(assists),
      offensiveRebounds: Value(offensiveRebounds),
      defensiveRebounds: Value(defensiveRebounds),
      blocks: Value(blocks),
      steals: Value(steals),
      turnovers: Value(turnovers),
      fouls: Value(fouls),
      plusMinus: Value(plusMinus),
    );
  }

  factory PlayerGameStat.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlayerGameStat(
      id: serializer.fromJson<int>(json['id']),
      gameId: serializer.fromJson<int>(json['gameId']),
      playerId: serializer.fromJson<int>(json['playerId']),
      isOnCourt: serializer.fromJson<bool>(json['isOnCourt']),
      minutesPlayed: serializer.fromJson<int>(json['minutesPlayed']),
      twoPointMade: serializer.fromJson<int>(json['twoPointMade']),
      twoPointAttempted: serializer.fromJson<int>(json['twoPointAttempted']),
      threePointMade: serializer.fromJson<int>(json['threePointMade']),
      threePointAttempted: serializer.fromJson<int>(
        json['threePointAttempted'],
      ),
      freeThrowMade: serializer.fromJson<int>(json['freeThrowMade']),
      freeThrowAttempted: serializer.fromJson<int>(json['freeThrowAttempted']),
      assists: serializer.fromJson<int>(json['assists']),
      offensiveRebounds: serializer.fromJson<int>(json['offensiveRebounds']),
      defensiveRebounds: serializer.fromJson<int>(json['defensiveRebounds']),
      blocks: serializer.fromJson<int>(json['blocks']),
      steals: serializer.fromJson<int>(json['steals']),
      turnovers: serializer.fromJson<int>(json['turnovers']),
      fouls: serializer.fromJson<int>(json['fouls']),
      plusMinus: serializer.fromJson<int>(json['plusMinus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'gameId': serializer.toJson<int>(gameId),
      'playerId': serializer.toJson<int>(playerId),
      'isOnCourt': serializer.toJson<bool>(isOnCourt),
      'minutesPlayed': serializer.toJson<int>(minutesPlayed),
      'twoPointMade': serializer.toJson<int>(twoPointMade),
      'twoPointAttempted': serializer.toJson<int>(twoPointAttempted),
      'threePointMade': serializer.toJson<int>(threePointMade),
      'threePointAttempted': serializer.toJson<int>(threePointAttempted),
      'freeThrowMade': serializer.toJson<int>(freeThrowMade),
      'freeThrowAttempted': serializer.toJson<int>(freeThrowAttempted),
      'assists': serializer.toJson<int>(assists),
      'offensiveRebounds': serializer.toJson<int>(offensiveRebounds),
      'defensiveRebounds': serializer.toJson<int>(defensiveRebounds),
      'blocks': serializer.toJson<int>(blocks),
      'steals': serializer.toJson<int>(steals),
      'turnovers': serializer.toJson<int>(turnovers),
      'fouls': serializer.toJson<int>(fouls),
      'plusMinus': serializer.toJson<int>(plusMinus),
    };
  }

  PlayerGameStat copyWith({
    int? id,
    int? gameId,
    int? playerId,
    bool? isOnCourt,
    int? minutesPlayed,
    int? twoPointMade,
    int? twoPointAttempted,
    int? threePointMade,
    int? threePointAttempted,
    int? freeThrowMade,
    int? freeThrowAttempted,
    int? assists,
    int? offensiveRebounds,
    int? defensiveRebounds,
    int? blocks,
    int? steals,
    int? turnovers,
    int? fouls,
    int? plusMinus,
  }) => PlayerGameStat(
    id: id ?? this.id,
    gameId: gameId ?? this.gameId,
    playerId: playerId ?? this.playerId,
    isOnCourt: isOnCourt ?? this.isOnCourt,
    minutesPlayed: minutesPlayed ?? this.minutesPlayed,
    twoPointMade: twoPointMade ?? this.twoPointMade,
    twoPointAttempted: twoPointAttempted ?? this.twoPointAttempted,
    threePointMade: threePointMade ?? this.threePointMade,
    threePointAttempted: threePointAttempted ?? this.threePointAttempted,
    freeThrowMade: freeThrowMade ?? this.freeThrowMade,
    freeThrowAttempted: freeThrowAttempted ?? this.freeThrowAttempted,
    assists: assists ?? this.assists,
    offensiveRebounds: offensiveRebounds ?? this.offensiveRebounds,
    defensiveRebounds: defensiveRebounds ?? this.defensiveRebounds,
    blocks: blocks ?? this.blocks,
    steals: steals ?? this.steals,
    turnovers: turnovers ?? this.turnovers,
    fouls: fouls ?? this.fouls,
    plusMinus: plusMinus ?? this.plusMinus,
  );
  PlayerGameStat copyWithCompanion(PlayerGameStatsCompanion data) {
    return PlayerGameStat(
      id: data.id.present ? data.id.value : this.id,
      gameId: data.gameId.present ? data.gameId.value : this.gameId,
      playerId: data.playerId.present ? data.playerId.value : this.playerId,
      isOnCourt: data.isOnCourt.present ? data.isOnCourt.value : this.isOnCourt,
      minutesPlayed: data.minutesPlayed.present
          ? data.minutesPlayed.value
          : this.minutesPlayed,
      twoPointMade: data.twoPointMade.present
          ? data.twoPointMade.value
          : this.twoPointMade,
      twoPointAttempted: data.twoPointAttempted.present
          ? data.twoPointAttempted.value
          : this.twoPointAttempted,
      threePointMade: data.threePointMade.present
          ? data.threePointMade.value
          : this.threePointMade,
      threePointAttempted: data.threePointAttempted.present
          ? data.threePointAttempted.value
          : this.threePointAttempted,
      freeThrowMade: data.freeThrowMade.present
          ? data.freeThrowMade.value
          : this.freeThrowMade,
      freeThrowAttempted: data.freeThrowAttempted.present
          ? data.freeThrowAttempted.value
          : this.freeThrowAttempted,
      assists: data.assists.present ? data.assists.value : this.assists,
      offensiveRebounds: data.offensiveRebounds.present
          ? data.offensiveRebounds.value
          : this.offensiveRebounds,
      defensiveRebounds: data.defensiveRebounds.present
          ? data.defensiveRebounds.value
          : this.defensiveRebounds,
      blocks: data.blocks.present ? data.blocks.value : this.blocks,
      steals: data.steals.present ? data.steals.value : this.steals,
      turnovers: data.turnovers.present ? data.turnovers.value : this.turnovers,
      fouls: data.fouls.present ? data.fouls.value : this.fouls,
      plusMinus: data.plusMinus.present ? data.plusMinus.value : this.plusMinus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlayerGameStat(')
          ..write('id: $id, ')
          ..write('gameId: $gameId, ')
          ..write('playerId: $playerId, ')
          ..write('isOnCourt: $isOnCourt, ')
          ..write('minutesPlayed: $minutesPlayed, ')
          ..write('twoPointMade: $twoPointMade, ')
          ..write('twoPointAttempted: $twoPointAttempted, ')
          ..write('threePointMade: $threePointMade, ')
          ..write('threePointAttempted: $threePointAttempted, ')
          ..write('freeThrowMade: $freeThrowMade, ')
          ..write('freeThrowAttempted: $freeThrowAttempted, ')
          ..write('assists: $assists, ')
          ..write('offensiveRebounds: $offensiveRebounds, ')
          ..write('defensiveRebounds: $defensiveRebounds, ')
          ..write('blocks: $blocks, ')
          ..write('steals: $steals, ')
          ..write('turnovers: $turnovers, ')
          ..write('fouls: $fouls, ')
          ..write('plusMinus: $plusMinus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    gameId,
    playerId,
    isOnCourt,
    minutesPlayed,
    twoPointMade,
    twoPointAttempted,
    threePointMade,
    threePointAttempted,
    freeThrowMade,
    freeThrowAttempted,
    assists,
    offensiveRebounds,
    defensiveRebounds,
    blocks,
    steals,
    turnovers,
    fouls,
    plusMinus,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlayerGameStat &&
          other.id == this.id &&
          other.gameId == this.gameId &&
          other.playerId == this.playerId &&
          other.isOnCourt == this.isOnCourt &&
          other.minutesPlayed == this.minutesPlayed &&
          other.twoPointMade == this.twoPointMade &&
          other.twoPointAttempted == this.twoPointAttempted &&
          other.threePointMade == this.threePointMade &&
          other.threePointAttempted == this.threePointAttempted &&
          other.freeThrowMade == this.freeThrowMade &&
          other.freeThrowAttempted == this.freeThrowAttempted &&
          other.assists == this.assists &&
          other.offensiveRebounds == this.offensiveRebounds &&
          other.defensiveRebounds == this.defensiveRebounds &&
          other.blocks == this.blocks &&
          other.steals == this.steals &&
          other.turnovers == this.turnovers &&
          other.fouls == this.fouls &&
          other.plusMinus == this.plusMinus);
}

class PlayerGameStatsCompanion extends UpdateCompanion<PlayerGameStat> {
  final Value<int> id;
  final Value<int> gameId;
  final Value<int> playerId;
  final Value<bool> isOnCourt;
  final Value<int> minutesPlayed;
  final Value<int> twoPointMade;
  final Value<int> twoPointAttempted;
  final Value<int> threePointMade;
  final Value<int> threePointAttempted;
  final Value<int> freeThrowMade;
  final Value<int> freeThrowAttempted;
  final Value<int> assists;
  final Value<int> offensiveRebounds;
  final Value<int> defensiveRebounds;
  final Value<int> blocks;
  final Value<int> steals;
  final Value<int> turnovers;
  final Value<int> fouls;
  final Value<int> plusMinus;
  const PlayerGameStatsCompanion({
    this.id = const Value.absent(),
    this.gameId = const Value.absent(),
    this.playerId = const Value.absent(),
    this.isOnCourt = const Value.absent(),
    this.minutesPlayed = const Value.absent(),
    this.twoPointMade = const Value.absent(),
    this.twoPointAttempted = const Value.absent(),
    this.threePointMade = const Value.absent(),
    this.threePointAttempted = const Value.absent(),
    this.freeThrowMade = const Value.absent(),
    this.freeThrowAttempted = const Value.absent(),
    this.assists = const Value.absent(),
    this.offensiveRebounds = const Value.absent(),
    this.defensiveRebounds = const Value.absent(),
    this.blocks = const Value.absent(),
    this.steals = const Value.absent(),
    this.turnovers = const Value.absent(),
    this.fouls = const Value.absent(),
    this.plusMinus = const Value.absent(),
  });
  PlayerGameStatsCompanion.insert({
    this.id = const Value.absent(),
    required int gameId,
    required int playerId,
    required bool isOnCourt,
    required int minutesPlayed,
    required int twoPointMade,
    required int twoPointAttempted,
    required int threePointMade,
    required int threePointAttempted,
    required int freeThrowMade,
    required int freeThrowAttempted,
    required int assists,
    required int offensiveRebounds,
    required int defensiveRebounds,
    required int blocks,
    required int steals,
    required int turnovers,
    required int fouls,
    required int plusMinus,
  }) : gameId = Value(gameId),
       playerId = Value(playerId),
       isOnCourt = Value(isOnCourt),
       minutesPlayed = Value(minutesPlayed),
       twoPointMade = Value(twoPointMade),
       twoPointAttempted = Value(twoPointAttempted),
       threePointMade = Value(threePointMade),
       threePointAttempted = Value(threePointAttempted),
       freeThrowMade = Value(freeThrowMade),
       freeThrowAttempted = Value(freeThrowAttempted),
       assists = Value(assists),
       offensiveRebounds = Value(offensiveRebounds),
       defensiveRebounds = Value(defensiveRebounds),
       blocks = Value(blocks),
       steals = Value(steals),
       turnovers = Value(turnovers),
       fouls = Value(fouls),
       plusMinus = Value(plusMinus);
  static Insertable<PlayerGameStat> custom({
    Expression<int>? id,
    Expression<int>? gameId,
    Expression<int>? playerId,
    Expression<bool>? isOnCourt,
    Expression<int>? minutesPlayed,
    Expression<int>? twoPointMade,
    Expression<int>? twoPointAttempted,
    Expression<int>? threePointMade,
    Expression<int>? threePointAttempted,
    Expression<int>? freeThrowMade,
    Expression<int>? freeThrowAttempted,
    Expression<int>? assists,
    Expression<int>? offensiveRebounds,
    Expression<int>? defensiveRebounds,
    Expression<int>? blocks,
    Expression<int>? steals,
    Expression<int>? turnovers,
    Expression<int>? fouls,
    Expression<int>? plusMinus,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (gameId != null) 'game_id': gameId,
      if (playerId != null) 'player_id': playerId,
      if (isOnCourt != null) 'is_on_court': isOnCourt,
      if (minutesPlayed != null) 'minutes_played': minutesPlayed,
      if (twoPointMade != null) 'two_point_made': twoPointMade,
      if (twoPointAttempted != null) 'two_point_attempted': twoPointAttempted,
      if (threePointMade != null) 'three_point_made': threePointMade,
      if (threePointAttempted != null)
        'three_point_attempted': threePointAttempted,
      if (freeThrowMade != null) 'free_throw_made': freeThrowMade,
      if (freeThrowAttempted != null)
        'free_throw_attempted': freeThrowAttempted,
      if (assists != null) 'assists': assists,
      if (offensiveRebounds != null) 'offensive_rebounds': offensiveRebounds,
      if (defensiveRebounds != null) 'defensive_rebounds': defensiveRebounds,
      if (blocks != null) 'blocks': blocks,
      if (steals != null) 'steals': steals,
      if (turnovers != null) 'turnovers': turnovers,
      if (fouls != null) 'fouls': fouls,
      if (plusMinus != null) 'plus_minus': plusMinus,
    });
  }

  PlayerGameStatsCompanion copyWith({
    Value<int>? id,
    Value<int>? gameId,
    Value<int>? playerId,
    Value<bool>? isOnCourt,
    Value<int>? minutesPlayed,
    Value<int>? twoPointMade,
    Value<int>? twoPointAttempted,
    Value<int>? threePointMade,
    Value<int>? threePointAttempted,
    Value<int>? freeThrowMade,
    Value<int>? freeThrowAttempted,
    Value<int>? assists,
    Value<int>? offensiveRebounds,
    Value<int>? defensiveRebounds,
    Value<int>? blocks,
    Value<int>? steals,
    Value<int>? turnovers,
    Value<int>? fouls,
    Value<int>? plusMinus,
  }) {
    return PlayerGameStatsCompanion(
      id: id ?? this.id,
      gameId: gameId ?? this.gameId,
      playerId: playerId ?? this.playerId,
      isOnCourt: isOnCourt ?? this.isOnCourt,
      minutesPlayed: minutesPlayed ?? this.minutesPlayed,
      twoPointMade: twoPointMade ?? this.twoPointMade,
      twoPointAttempted: twoPointAttempted ?? this.twoPointAttempted,
      threePointMade: threePointMade ?? this.threePointMade,
      threePointAttempted: threePointAttempted ?? this.threePointAttempted,
      freeThrowMade: freeThrowMade ?? this.freeThrowMade,
      freeThrowAttempted: freeThrowAttempted ?? this.freeThrowAttempted,
      assists: assists ?? this.assists,
      offensiveRebounds: offensiveRebounds ?? this.offensiveRebounds,
      defensiveRebounds: defensiveRebounds ?? this.defensiveRebounds,
      blocks: blocks ?? this.blocks,
      steals: steals ?? this.steals,
      turnovers: turnovers ?? this.turnovers,
      fouls: fouls ?? this.fouls,
      plusMinus: plusMinus ?? this.plusMinus,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (gameId.present) {
      map['game_id'] = Variable<int>(gameId.value);
    }
    if (playerId.present) {
      map['player_id'] = Variable<int>(playerId.value);
    }
    if (isOnCourt.present) {
      map['is_on_court'] = Variable<bool>(isOnCourt.value);
    }
    if (minutesPlayed.present) {
      map['minutes_played'] = Variable<int>(minutesPlayed.value);
    }
    if (twoPointMade.present) {
      map['two_point_made'] = Variable<int>(twoPointMade.value);
    }
    if (twoPointAttempted.present) {
      map['two_point_attempted'] = Variable<int>(twoPointAttempted.value);
    }
    if (threePointMade.present) {
      map['three_point_made'] = Variable<int>(threePointMade.value);
    }
    if (threePointAttempted.present) {
      map['three_point_attempted'] = Variable<int>(threePointAttempted.value);
    }
    if (freeThrowMade.present) {
      map['free_throw_made'] = Variable<int>(freeThrowMade.value);
    }
    if (freeThrowAttempted.present) {
      map['free_throw_attempted'] = Variable<int>(freeThrowAttempted.value);
    }
    if (assists.present) {
      map['assists'] = Variable<int>(assists.value);
    }
    if (offensiveRebounds.present) {
      map['offensive_rebounds'] = Variable<int>(offensiveRebounds.value);
    }
    if (defensiveRebounds.present) {
      map['defensive_rebounds'] = Variable<int>(defensiveRebounds.value);
    }
    if (blocks.present) {
      map['blocks'] = Variable<int>(blocks.value);
    }
    if (steals.present) {
      map['steals'] = Variable<int>(steals.value);
    }
    if (turnovers.present) {
      map['turnovers'] = Variable<int>(turnovers.value);
    }
    if (fouls.present) {
      map['fouls'] = Variable<int>(fouls.value);
    }
    if (plusMinus.present) {
      map['plus_minus'] = Variable<int>(plusMinus.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlayerGameStatsCompanion(')
          ..write('id: $id, ')
          ..write('gameId: $gameId, ')
          ..write('playerId: $playerId, ')
          ..write('isOnCourt: $isOnCourt, ')
          ..write('minutesPlayed: $minutesPlayed, ')
          ..write('twoPointMade: $twoPointMade, ')
          ..write('twoPointAttempted: $twoPointAttempted, ')
          ..write('threePointMade: $threePointMade, ')
          ..write('threePointAttempted: $threePointAttempted, ')
          ..write('freeThrowMade: $freeThrowMade, ')
          ..write('freeThrowAttempted: $freeThrowAttempted, ')
          ..write('assists: $assists, ')
          ..write('offensiveRebounds: $offensiveRebounds, ')
          ..write('defensiveRebounds: $defensiveRebounds, ')
          ..write('blocks: $blocks, ')
          ..write('steals: $steals, ')
          ..write('turnovers: $turnovers, ')
          ..write('fouls: $fouls, ')
          ..write('plusMinus: $plusMinus')
          ..write(')'))
        .toString();
  }
}

class $GameEventsTable extends GameEvents
    with TableInfo<$GameEventsTable, GameEvent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GameEventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _gameIdMeta = const VerificationMeta('gameId');
  @override
  late final GeneratedColumn<int> gameId = GeneratedColumn<int>(
    'game_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES games (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _playerIdMeta = const VerificationMeta(
    'playerId',
  );
  @override
  late final GeneratedColumn<int> playerId = GeneratedColumn<int>(
    'player_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES players (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _eventTypeMeta = const VerificationMeta(
    'eventType',
  );
  @override
  late final GeneratedColumn<String> eventType = GeneratedColumn<String>(
    'event_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quarterMeta = const VerificationMeta(
    'quarter',
  );
  @override
  late final GeneratedColumn<int> quarter = GeneratedColumn<int>(
    'quarter',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quarterSecondsMeta = const VerificationMeta(
    'quarterSeconds',
  );
  @override
  late final GeneratedColumn<int> quarterSeconds = GeneratedColumn<int>(
    'quarter_seconds',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    gameId,
    playerId,
    eventType,
    quarter,
    quarterSeconds,
    timestamp,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'game_events';
  @override
  VerificationContext validateIntegrity(
    Insertable<GameEvent> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('game_id')) {
      context.handle(
        _gameIdMeta,
        gameId.isAcceptableOrUnknown(data['game_id']!, _gameIdMeta),
      );
    } else if (isInserting) {
      context.missing(_gameIdMeta);
    }
    if (data.containsKey('player_id')) {
      context.handle(
        _playerIdMeta,
        playerId.isAcceptableOrUnknown(data['player_id']!, _playerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_playerIdMeta);
    }
    if (data.containsKey('event_type')) {
      context.handle(
        _eventTypeMeta,
        eventType.isAcceptableOrUnknown(data['event_type']!, _eventTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_eventTypeMeta);
    }
    if (data.containsKey('quarter')) {
      context.handle(
        _quarterMeta,
        quarter.isAcceptableOrUnknown(data['quarter']!, _quarterMeta),
      );
    } else if (isInserting) {
      context.missing(_quarterMeta);
    }
    if (data.containsKey('quarter_seconds')) {
      context.handle(
        _quarterSecondsMeta,
        quarterSeconds.isAcceptableOrUnknown(
          data['quarter_seconds']!,
          _quarterSecondsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_quarterSecondsMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GameEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GameEvent(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      gameId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}game_id'],
      )!,
      playerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}player_id'],
      )!,
      eventType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}event_type'],
      )!,
      quarter: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quarter'],
      )!,
      quarterSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quarter_seconds'],
      )!,
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}timestamp'],
      )!,
    );
  }

  @override
  $GameEventsTable createAlias(String alias) {
    return $GameEventsTable(attachedDatabase, alias);
  }
}

class GameEvent extends DataClass implements Insertable<GameEvent> {
  final int id;
  final int gameId;
  final int playerId;
  final String eventType;
  final int quarter;
  final int quarterSeconds;
  final DateTime timestamp;
  const GameEvent({
    required this.id,
    required this.gameId,
    required this.playerId,
    required this.eventType,
    required this.quarter,
    required this.quarterSeconds,
    required this.timestamp,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['game_id'] = Variable<int>(gameId);
    map['player_id'] = Variable<int>(playerId);
    map['event_type'] = Variable<String>(eventType);
    map['quarter'] = Variable<int>(quarter);
    map['quarter_seconds'] = Variable<int>(quarterSeconds);
    map['timestamp'] = Variable<DateTime>(timestamp);
    return map;
  }

  GameEventsCompanion toCompanion(bool nullToAbsent) {
    return GameEventsCompanion(
      id: Value(id),
      gameId: Value(gameId),
      playerId: Value(playerId),
      eventType: Value(eventType),
      quarter: Value(quarter),
      quarterSeconds: Value(quarterSeconds),
      timestamp: Value(timestamp),
    );
  }

  factory GameEvent.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GameEvent(
      id: serializer.fromJson<int>(json['id']),
      gameId: serializer.fromJson<int>(json['gameId']),
      playerId: serializer.fromJson<int>(json['playerId']),
      eventType: serializer.fromJson<String>(json['eventType']),
      quarter: serializer.fromJson<int>(json['quarter']),
      quarterSeconds: serializer.fromJson<int>(json['quarterSeconds']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'gameId': serializer.toJson<int>(gameId),
      'playerId': serializer.toJson<int>(playerId),
      'eventType': serializer.toJson<String>(eventType),
      'quarter': serializer.toJson<int>(quarter),
      'quarterSeconds': serializer.toJson<int>(quarterSeconds),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  GameEvent copyWith({
    int? id,
    int? gameId,
    int? playerId,
    String? eventType,
    int? quarter,
    int? quarterSeconds,
    DateTime? timestamp,
  }) => GameEvent(
    id: id ?? this.id,
    gameId: gameId ?? this.gameId,
    playerId: playerId ?? this.playerId,
    eventType: eventType ?? this.eventType,
    quarter: quarter ?? this.quarter,
    quarterSeconds: quarterSeconds ?? this.quarterSeconds,
    timestamp: timestamp ?? this.timestamp,
  );
  GameEvent copyWithCompanion(GameEventsCompanion data) {
    return GameEvent(
      id: data.id.present ? data.id.value : this.id,
      gameId: data.gameId.present ? data.gameId.value : this.gameId,
      playerId: data.playerId.present ? data.playerId.value : this.playerId,
      eventType: data.eventType.present ? data.eventType.value : this.eventType,
      quarter: data.quarter.present ? data.quarter.value : this.quarter,
      quarterSeconds: data.quarterSeconds.present
          ? data.quarterSeconds.value
          : this.quarterSeconds,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GameEvent(')
          ..write('id: $id, ')
          ..write('gameId: $gameId, ')
          ..write('playerId: $playerId, ')
          ..write('eventType: $eventType, ')
          ..write('quarter: $quarter, ')
          ..write('quarterSeconds: $quarterSeconds, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    gameId,
    playerId,
    eventType,
    quarter,
    quarterSeconds,
    timestamp,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GameEvent &&
          other.id == this.id &&
          other.gameId == this.gameId &&
          other.playerId == this.playerId &&
          other.eventType == this.eventType &&
          other.quarter == this.quarter &&
          other.quarterSeconds == this.quarterSeconds &&
          other.timestamp == this.timestamp);
}

class GameEventsCompanion extends UpdateCompanion<GameEvent> {
  final Value<int> id;
  final Value<int> gameId;
  final Value<int> playerId;
  final Value<String> eventType;
  final Value<int> quarter;
  final Value<int> quarterSeconds;
  final Value<DateTime> timestamp;
  const GameEventsCompanion({
    this.id = const Value.absent(),
    this.gameId = const Value.absent(),
    this.playerId = const Value.absent(),
    this.eventType = const Value.absent(),
    this.quarter = const Value.absent(),
    this.quarterSeconds = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  GameEventsCompanion.insert({
    this.id = const Value.absent(),
    required int gameId,
    required int playerId,
    required String eventType,
    required int quarter,
    required int quarterSeconds,
    required DateTime timestamp,
  }) : gameId = Value(gameId),
       playerId = Value(playerId),
       eventType = Value(eventType),
       quarter = Value(quarter),
       quarterSeconds = Value(quarterSeconds),
       timestamp = Value(timestamp);
  static Insertable<GameEvent> custom({
    Expression<int>? id,
    Expression<int>? gameId,
    Expression<int>? playerId,
    Expression<String>? eventType,
    Expression<int>? quarter,
    Expression<int>? quarterSeconds,
    Expression<DateTime>? timestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (gameId != null) 'game_id': gameId,
      if (playerId != null) 'player_id': playerId,
      if (eventType != null) 'event_type': eventType,
      if (quarter != null) 'quarter': quarter,
      if (quarterSeconds != null) 'quarter_seconds': quarterSeconds,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  GameEventsCompanion copyWith({
    Value<int>? id,
    Value<int>? gameId,
    Value<int>? playerId,
    Value<String>? eventType,
    Value<int>? quarter,
    Value<int>? quarterSeconds,
    Value<DateTime>? timestamp,
  }) {
    return GameEventsCompanion(
      id: id ?? this.id,
      gameId: gameId ?? this.gameId,
      playerId: playerId ?? this.playerId,
      eventType: eventType ?? this.eventType,
      quarter: quarter ?? this.quarter,
      quarterSeconds: quarterSeconds ?? this.quarterSeconds,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (gameId.present) {
      map['game_id'] = Variable<int>(gameId.value);
    }
    if (playerId.present) {
      map['player_id'] = Variable<int>(playerId.value);
    }
    if (eventType.present) {
      map['event_type'] = Variable<String>(eventType.value);
    }
    if (quarter.present) {
      map['quarter'] = Variable<int>(quarter.value);
    }
    if (quarterSeconds.present) {
      map['quarter_seconds'] = Variable<int>(quarterSeconds.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GameEventsCompanion(')
          ..write('id: $id, ')
          ..write('gameId: $gameId, ')
          ..write('playerId: $playerId, ')
          ..write('eventType: $eventType, ')
          ..write('quarter: $quarter, ')
          ..write('quarterSeconds: $quarterSeconds, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }
}

class $SubstitutionsTable extends Substitutions
    with TableInfo<$SubstitutionsTable, Substitution> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubstitutionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _gameIdMeta = const VerificationMeta('gameId');
  @override
  late final GeneratedColumn<int> gameId = GeneratedColumn<int>(
    'game_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES games (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _playerInIdMeta = const VerificationMeta(
    'playerInId',
  );
  @override
  late final GeneratedColumn<int> playerInId = GeneratedColumn<int>(
    'player_in_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES players (id)',
    ),
  );
  static const VerificationMeta _playerOutIdMeta = const VerificationMeta(
    'playerOutId',
  );
  @override
  late final GeneratedColumn<int> playerOutId = GeneratedColumn<int>(
    'player_out_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES players (id)',
    ),
  );
  static const VerificationMeta _quarterMeta = const VerificationMeta(
    'quarter',
  );
  @override
  late final GeneratedColumn<int> quarter = GeneratedColumn<int>(
    'quarter',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quarterSecondsMeta = const VerificationMeta(
    'quarterSeconds',
  );
  @override
  late final GeneratedColumn<int> quarterSeconds = GeneratedColumn<int>(
    'quarter_seconds',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    gameId,
    playerInId,
    playerOutId,
    quarter,
    quarterSeconds,
    timestamp,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'substitutions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Substitution> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('game_id')) {
      context.handle(
        _gameIdMeta,
        gameId.isAcceptableOrUnknown(data['game_id']!, _gameIdMeta),
      );
    } else if (isInserting) {
      context.missing(_gameIdMeta);
    }
    if (data.containsKey('player_in_id')) {
      context.handle(
        _playerInIdMeta,
        playerInId.isAcceptableOrUnknown(
          data['player_in_id']!,
          _playerInIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_playerInIdMeta);
    }
    if (data.containsKey('player_out_id')) {
      context.handle(
        _playerOutIdMeta,
        playerOutId.isAcceptableOrUnknown(
          data['player_out_id']!,
          _playerOutIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_playerOutIdMeta);
    }
    if (data.containsKey('quarter')) {
      context.handle(
        _quarterMeta,
        quarter.isAcceptableOrUnknown(data['quarter']!, _quarterMeta),
      );
    } else if (isInserting) {
      context.missing(_quarterMeta);
    }
    if (data.containsKey('quarter_seconds')) {
      context.handle(
        _quarterSecondsMeta,
        quarterSeconds.isAcceptableOrUnknown(
          data['quarter_seconds']!,
          _quarterSecondsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_quarterSecondsMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Substitution map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Substitution(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      gameId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}game_id'],
      )!,
      playerInId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}player_in_id'],
      )!,
      playerOutId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}player_out_id'],
      )!,
      quarter: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quarter'],
      )!,
      quarterSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quarter_seconds'],
      )!,
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}timestamp'],
      )!,
    );
  }

  @override
  $SubstitutionsTable createAlias(String alias) {
    return $SubstitutionsTable(attachedDatabase, alias);
  }
}

class Substitution extends DataClass implements Insertable<Substitution> {
  final int id;
  final int gameId;
  final int playerInId;
  final int playerOutId;
  final int quarter;
  final int quarterSeconds;
  final DateTime timestamp;
  const Substitution({
    required this.id,
    required this.gameId,
    required this.playerInId,
    required this.playerOutId,
    required this.quarter,
    required this.quarterSeconds,
    required this.timestamp,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['game_id'] = Variable<int>(gameId);
    map['player_in_id'] = Variable<int>(playerInId);
    map['player_out_id'] = Variable<int>(playerOutId);
    map['quarter'] = Variable<int>(quarter);
    map['quarter_seconds'] = Variable<int>(quarterSeconds);
    map['timestamp'] = Variable<DateTime>(timestamp);
    return map;
  }

  SubstitutionsCompanion toCompanion(bool nullToAbsent) {
    return SubstitutionsCompanion(
      id: Value(id),
      gameId: Value(gameId),
      playerInId: Value(playerInId),
      playerOutId: Value(playerOutId),
      quarter: Value(quarter),
      quarterSeconds: Value(quarterSeconds),
      timestamp: Value(timestamp),
    );
  }

  factory Substitution.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Substitution(
      id: serializer.fromJson<int>(json['id']),
      gameId: serializer.fromJson<int>(json['gameId']),
      playerInId: serializer.fromJson<int>(json['playerInId']),
      playerOutId: serializer.fromJson<int>(json['playerOutId']),
      quarter: serializer.fromJson<int>(json['quarter']),
      quarterSeconds: serializer.fromJson<int>(json['quarterSeconds']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'gameId': serializer.toJson<int>(gameId),
      'playerInId': serializer.toJson<int>(playerInId),
      'playerOutId': serializer.toJson<int>(playerOutId),
      'quarter': serializer.toJson<int>(quarter),
      'quarterSeconds': serializer.toJson<int>(quarterSeconds),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  Substitution copyWith({
    int? id,
    int? gameId,
    int? playerInId,
    int? playerOutId,
    int? quarter,
    int? quarterSeconds,
    DateTime? timestamp,
  }) => Substitution(
    id: id ?? this.id,
    gameId: gameId ?? this.gameId,
    playerInId: playerInId ?? this.playerInId,
    playerOutId: playerOutId ?? this.playerOutId,
    quarter: quarter ?? this.quarter,
    quarterSeconds: quarterSeconds ?? this.quarterSeconds,
    timestamp: timestamp ?? this.timestamp,
  );
  Substitution copyWithCompanion(SubstitutionsCompanion data) {
    return Substitution(
      id: data.id.present ? data.id.value : this.id,
      gameId: data.gameId.present ? data.gameId.value : this.gameId,
      playerInId: data.playerInId.present
          ? data.playerInId.value
          : this.playerInId,
      playerOutId: data.playerOutId.present
          ? data.playerOutId.value
          : this.playerOutId,
      quarter: data.quarter.present ? data.quarter.value : this.quarter,
      quarterSeconds: data.quarterSeconds.present
          ? data.quarterSeconds.value
          : this.quarterSeconds,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Substitution(')
          ..write('id: $id, ')
          ..write('gameId: $gameId, ')
          ..write('playerInId: $playerInId, ')
          ..write('playerOutId: $playerOutId, ')
          ..write('quarter: $quarter, ')
          ..write('quarterSeconds: $quarterSeconds, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    gameId,
    playerInId,
    playerOutId,
    quarter,
    quarterSeconds,
    timestamp,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Substitution &&
          other.id == this.id &&
          other.gameId == this.gameId &&
          other.playerInId == this.playerInId &&
          other.playerOutId == this.playerOutId &&
          other.quarter == this.quarter &&
          other.quarterSeconds == this.quarterSeconds &&
          other.timestamp == this.timestamp);
}

class SubstitutionsCompanion extends UpdateCompanion<Substitution> {
  final Value<int> id;
  final Value<int> gameId;
  final Value<int> playerInId;
  final Value<int> playerOutId;
  final Value<int> quarter;
  final Value<int> quarterSeconds;
  final Value<DateTime> timestamp;
  const SubstitutionsCompanion({
    this.id = const Value.absent(),
    this.gameId = const Value.absent(),
    this.playerInId = const Value.absent(),
    this.playerOutId = const Value.absent(),
    this.quarter = const Value.absent(),
    this.quarterSeconds = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  SubstitutionsCompanion.insert({
    this.id = const Value.absent(),
    required int gameId,
    required int playerInId,
    required int playerOutId,
    required int quarter,
    required int quarterSeconds,
    required DateTime timestamp,
  }) : gameId = Value(gameId),
       playerInId = Value(playerInId),
       playerOutId = Value(playerOutId),
       quarter = Value(quarter),
       quarterSeconds = Value(quarterSeconds),
       timestamp = Value(timestamp);
  static Insertable<Substitution> custom({
    Expression<int>? id,
    Expression<int>? gameId,
    Expression<int>? playerInId,
    Expression<int>? playerOutId,
    Expression<int>? quarter,
    Expression<int>? quarterSeconds,
    Expression<DateTime>? timestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (gameId != null) 'game_id': gameId,
      if (playerInId != null) 'player_in_id': playerInId,
      if (playerOutId != null) 'player_out_id': playerOutId,
      if (quarter != null) 'quarter': quarter,
      if (quarterSeconds != null) 'quarter_seconds': quarterSeconds,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  SubstitutionsCompanion copyWith({
    Value<int>? id,
    Value<int>? gameId,
    Value<int>? playerInId,
    Value<int>? playerOutId,
    Value<int>? quarter,
    Value<int>? quarterSeconds,
    Value<DateTime>? timestamp,
  }) {
    return SubstitutionsCompanion(
      id: id ?? this.id,
      gameId: gameId ?? this.gameId,
      playerInId: playerInId ?? this.playerInId,
      playerOutId: playerOutId ?? this.playerOutId,
      quarter: quarter ?? this.quarter,
      quarterSeconds: quarterSeconds ?? this.quarterSeconds,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (gameId.present) {
      map['game_id'] = Variable<int>(gameId.value);
    }
    if (playerInId.present) {
      map['player_in_id'] = Variable<int>(playerInId.value);
    }
    if (playerOutId.present) {
      map['player_out_id'] = Variable<int>(playerOutId.value);
    }
    if (quarter.present) {
      map['quarter'] = Variable<int>(quarter.value);
    }
    if (quarterSeconds.present) {
      map['quarter_seconds'] = Variable<int>(quarterSeconds.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubstitutionsCompanion(')
          ..write('id: $id, ')
          ..write('gameId: $gameId, ')
          ..write('playerInId: $playerInId, ')
          ..write('playerOutId: $playerOutId, ')
          ..write('quarter: $quarter, ')
          ..write('quarterSeconds: $quarterSeconds, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TeamsTable teams = $TeamsTable(this);
  late final $PlayersTable players = $PlayersTable(this);
  late final $GamesTable games = $GamesTable(this);
  late final $PlayerGameStatsTable playerGameStats = $PlayerGameStatsTable(
    this,
  );
  late final $GameEventsTable gameEvents = $GameEventsTable(this);
  late final $SubstitutionsTable substitutions = $SubstitutionsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    teams,
    players,
    games,
    playerGameStats,
    gameEvents,
    substitutions,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'teams',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('players', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'teams',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('games', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'games',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('player_game_stats', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'players',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('player_game_stats', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'games',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('game_events', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'players',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('game_events', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'games',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('substitutions', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$TeamsTableCreateCompanionBuilder =
    TeamsCompanion Function({
      Value<int> id,
      required String name,
      required DateTime createdAt,
    });
typedef $$TeamsTableUpdateCompanionBuilder =
    TeamsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<DateTime> createdAt,
    });

final class $$TeamsTableReferences
    extends BaseReferences<_$AppDatabase, $TeamsTable, Team> {
  $$TeamsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PlayersTable, List<Player>> _playersRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.players,
    aliasName: $_aliasNameGenerator(db.teams.id, db.players.teamId),
  );

  $$PlayersTableProcessedTableManager get playersRefs {
    final manager = $$PlayersTableTableManager(
      $_db,
      $_db.players,
    ).filter((f) => f.teamId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_playersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$GamesTable, List<Game>> _gamesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.games,
    aliasName: $_aliasNameGenerator(db.teams.id, db.games.teamId),
  );

  $$GamesTableProcessedTableManager get gamesRefs {
    final manager = $$GamesTableTableManager(
      $_db,
      $_db.games,
    ).filter((f) => f.teamId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_gamesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TeamsTableFilterComposer extends Composer<_$AppDatabase, $TeamsTable> {
  $$TeamsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> playersRefs(
    Expression<bool> Function($$PlayersTableFilterComposer f) f,
  ) {
    final $$PlayersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.teamId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableFilterComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> gamesRefs(
    Expression<bool> Function($$GamesTableFilterComposer f) f,
  ) {
    final $$GamesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.games,
      getReferencedColumn: (t) => t.teamId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GamesTableFilterComposer(
            $db: $db,
            $table: $db.games,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TeamsTableOrderingComposer
    extends Composer<_$AppDatabase, $TeamsTable> {
  $$TeamsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TeamsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TeamsTable> {
  $$TeamsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> playersRefs<T extends Object>(
    Expression<T> Function($$PlayersTableAnnotationComposer a) f,
  ) {
    final $$PlayersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.teamId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableAnnotationComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> gamesRefs<T extends Object>(
    Expression<T> Function($$GamesTableAnnotationComposer a) f,
  ) {
    final $$GamesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.games,
      getReferencedColumn: (t) => t.teamId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GamesTableAnnotationComposer(
            $db: $db,
            $table: $db.games,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TeamsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TeamsTable,
          Team,
          $$TeamsTableFilterComposer,
          $$TeamsTableOrderingComposer,
          $$TeamsTableAnnotationComposer,
          $$TeamsTableCreateCompanionBuilder,
          $$TeamsTableUpdateCompanionBuilder,
          (Team, $$TeamsTableReferences),
          Team,
          PrefetchHooks Function({bool playersRefs, bool gamesRefs})
        > {
  $$TeamsTableTableManager(_$AppDatabase db, $TeamsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TeamsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TeamsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TeamsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => TeamsCompanion(id: id, name: name, createdAt: createdAt),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required DateTime createdAt,
              }) => TeamsCompanion.insert(
                id: id,
                name: name,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$TeamsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({playersRefs = false, gamesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (playersRefs) db.players,
                if (gamesRefs) db.games,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (playersRefs)
                    await $_getPrefetchedData<Team, $TeamsTable, Player>(
                      currentTable: table,
                      referencedTable: $$TeamsTableReferences._playersRefsTable(
                        db,
                      ),
                      managerFromTypedResult: (p0) =>
                          $$TeamsTableReferences(db, table, p0).playersRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.teamId == item.id),
                      typedResults: items,
                    ),
                  if (gamesRefs)
                    await $_getPrefetchedData<Team, $TeamsTable, Game>(
                      currentTable: table,
                      referencedTable: $$TeamsTableReferences._gamesRefsTable(
                        db,
                      ),
                      managerFromTypedResult: (p0) =>
                          $$TeamsTableReferences(db, table, p0).gamesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.teamId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$TeamsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TeamsTable,
      Team,
      $$TeamsTableFilterComposer,
      $$TeamsTableOrderingComposer,
      $$TeamsTableAnnotationComposer,
      $$TeamsTableCreateCompanionBuilder,
      $$TeamsTableUpdateCompanionBuilder,
      (Team, $$TeamsTableReferences),
      Team,
      PrefetchHooks Function({bool playersRefs, bool gamesRefs})
    >;
typedef $$PlayersTableCreateCompanionBuilder =
    PlayersCompanion Function({
      Value<int> id,
      required int teamId,
      required String name,
      required int jerseyNumber,
      required String position,
      required DateTime createdAt,
    });
typedef $$PlayersTableUpdateCompanionBuilder =
    PlayersCompanion Function({
      Value<int> id,
      Value<int> teamId,
      Value<String> name,
      Value<int> jerseyNumber,
      Value<String> position,
      Value<DateTime> createdAt,
    });

final class $$PlayersTableReferences
    extends BaseReferences<_$AppDatabase, $PlayersTable, Player> {
  $$PlayersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TeamsTable _teamIdTable(_$AppDatabase db) => db.teams.createAlias(
    $_aliasNameGenerator(db.players.teamId, db.teams.id),
  );

  $$TeamsTableProcessedTableManager get teamId {
    final $_column = $_itemColumn<int>('team_id')!;

    final manager = $$TeamsTableTableManager(
      $_db,
      $_db.teams,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_teamIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$PlayerGameStatsTable, List<PlayerGameStat>>
  _playerGameStatsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.playerGameStats,
    aliasName: $_aliasNameGenerator(db.players.id, db.playerGameStats.playerId),
  );

  $$PlayerGameStatsTableProcessedTableManager get playerGameStatsRefs {
    final manager = $$PlayerGameStatsTableTableManager(
      $_db,
      $_db.playerGameStats,
    ).filter((f) => f.playerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _playerGameStatsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$GameEventsTable, List<GameEvent>>
  _gameEventsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.gameEvents,
    aliasName: $_aliasNameGenerator(db.players.id, db.gameEvents.playerId),
  );

  $$GameEventsTableProcessedTableManager get gameEventsRefs {
    final manager = $$GameEventsTableTableManager(
      $_db,
      $_db.gameEvents,
    ).filter((f) => f.playerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_gameEventsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PlayersTableFilterComposer
    extends Composer<_$AppDatabase, $PlayersTable> {
  $$PlayersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get jerseyNumber => $composableBuilder(
    column: $table.jerseyNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$TeamsTableFilterComposer get teamId {
    final $$TeamsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.teamId,
      referencedTable: $db.teams,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TeamsTableFilterComposer(
            $db: $db,
            $table: $db.teams,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> playerGameStatsRefs(
    Expression<bool> Function($$PlayerGameStatsTableFilterComposer f) f,
  ) {
    final $$PlayerGameStatsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.playerGameStats,
      getReferencedColumn: (t) => t.playerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayerGameStatsTableFilterComposer(
            $db: $db,
            $table: $db.playerGameStats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> gameEventsRefs(
    Expression<bool> Function($$GameEventsTableFilterComposer f) f,
  ) {
    final $$GameEventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.gameEvents,
      getReferencedColumn: (t) => t.playerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GameEventsTableFilterComposer(
            $db: $db,
            $table: $db.gameEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PlayersTableOrderingComposer
    extends Composer<_$AppDatabase, $PlayersTable> {
  $$PlayersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get jerseyNumber => $composableBuilder(
    column: $table.jerseyNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$TeamsTableOrderingComposer get teamId {
    final $$TeamsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.teamId,
      referencedTable: $db.teams,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TeamsTableOrderingComposer(
            $db: $db,
            $table: $db.teams,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PlayersTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlayersTable> {
  $$PlayersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get jerseyNumber => $composableBuilder(
    column: $table.jerseyNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get position =>
      $composableBuilder(column: $table.position, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$TeamsTableAnnotationComposer get teamId {
    final $$TeamsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.teamId,
      referencedTable: $db.teams,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TeamsTableAnnotationComposer(
            $db: $db,
            $table: $db.teams,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> playerGameStatsRefs<T extends Object>(
    Expression<T> Function($$PlayerGameStatsTableAnnotationComposer a) f,
  ) {
    final $$PlayerGameStatsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.playerGameStats,
      getReferencedColumn: (t) => t.playerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayerGameStatsTableAnnotationComposer(
            $db: $db,
            $table: $db.playerGameStats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> gameEventsRefs<T extends Object>(
    Expression<T> Function($$GameEventsTableAnnotationComposer a) f,
  ) {
    final $$GameEventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.gameEvents,
      getReferencedColumn: (t) => t.playerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GameEventsTableAnnotationComposer(
            $db: $db,
            $table: $db.gameEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PlayersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PlayersTable,
          Player,
          $$PlayersTableFilterComposer,
          $$PlayersTableOrderingComposer,
          $$PlayersTableAnnotationComposer,
          $$PlayersTableCreateCompanionBuilder,
          $$PlayersTableUpdateCompanionBuilder,
          (Player, $$PlayersTableReferences),
          Player,
          PrefetchHooks Function({
            bool teamId,
            bool playerGameStatsRefs,
            bool gameEventsRefs,
          })
        > {
  $$PlayersTableTableManager(_$AppDatabase db, $PlayersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlayersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlayersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlayersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> teamId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> jerseyNumber = const Value.absent(),
                Value<String> position = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PlayersCompanion(
                id: id,
                teamId: teamId,
                name: name,
                jerseyNumber: jerseyNumber,
                position: position,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int teamId,
                required String name,
                required int jerseyNumber,
                required String position,
                required DateTime createdAt,
              }) => PlayersCompanion.insert(
                id: id,
                teamId: teamId,
                name: name,
                jerseyNumber: jerseyNumber,
                position: position,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PlayersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                teamId = false,
                playerGameStatsRefs = false,
                gameEventsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (playerGameStatsRefs) db.playerGameStats,
                    if (gameEventsRefs) db.gameEvents,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (teamId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.teamId,
                                    referencedTable: $$PlayersTableReferences
                                        ._teamIdTable(db),
                                    referencedColumn: $$PlayersTableReferences
                                        ._teamIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (playerGameStatsRefs)
                        await $_getPrefetchedData<
                          Player,
                          $PlayersTable,
                          PlayerGameStat
                        >(
                          currentTable: table,
                          referencedTable: $$PlayersTableReferences
                              ._playerGameStatsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PlayersTableReferences(
                                db,
                                table,
                                p0,
                              ).playerGameStatsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.playerId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (gameEventsRefs)
                        await $_getPrefetchedData<
                          Player,
                          $PlayersTable,
                          GameEvent
                        >(
                          currentTable: table,
                          referencedTable: $$PlayersTableReferences
                              ._gameEventsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PlayersTableReferences(
                                db,
                                table,
                                p0,
                              ).gameEventsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.playerId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$PlayersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PlayersTable,
      Player,
      $$PlayersTableFilterComposer,
      $$PlayersTableOrderingComposer,
      $$PlayersTableAnnotationComposer,
      $$PlayersTableCreateCompanionBuilder,
      $$PlayersTableUpdateCompanionBuilder,
      (Player, $$PlayersTableReferences),
      Player,
      PrefetchHooks Function({
        bool teamId,
        bool playerGameStatsRefs,
        bool gameEventsRefs,
      })
    >;
typedef $$GamesTableCreateCompanionBuilder =
    GamesCompanion Function({
      Value<int> id,
      required int teamId,
      required String opponentName,
      required DateTime gameDate,
      required String status,
      required int quarterDuration,
      required int currentQuarter,
      required int currentQuarterSeconds,
      required bool isTimerRunning,
      required DateTime createdAt,
    });
typedef $$GamesTableUpdateCompanionBuilder =
    GamesCompanion Function({
      Value<int> id,
      Value<int> teamId,
      Value<String> opponentName,
      Value<DateTime> gameDate,
      Value<String> status,
      Value<int> quarterDuration,
      Value<int> currentQuarter,
      Value<int> currentQuarterSeconds,
      Value<bool> isTimerRunning,
      Value<DateTime> createdAt,
    });

final class $$GamesTableReferences
    extends BaseReferences<_$AppDatabase, $GamesTable, Game> {
  $$GamesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TeamsTable _teamIdTable(_$AppDatabase db) =>
      db.teams.createAlias($_aliasNameGenerator(db.games.teamId, db.teams.id));

  $$TeamsTableProcessedTableManager get teamId {
    final $_column = $_itemColumn<int>('team_id')!;

    final manager = $$TeamsTableTableManager(
      $_db,
      $_db.teams,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_teamIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$PlayerGameStatsTable, List<PlayerGameStat>>
  _playerGameStatsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.playerGameStats,
    aliasName: $_aliasNameGenerator(db.games.id, db.playerGameStats.gameId),
  );

  $$PlayerGameStatsTableProcessedTableManager get playerGameStatsRefs {
    final manager = $$PlayerGameStatsTableTableManager(
      $_db,
      $_db.playerGameStats,
    ).filter((f) => f.gameId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _playerGameStatsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$GameEventsTable, List<GameEvent>>
  _gameEventsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.gameEvents,
    aliasName: $_aliasNameGenerator(db.games.id, db.gameEvents.gameId),
  );

  $$GameEventsTableProcessedTableManager get gameEventsRefs {
    final manager = $$GameEventsTableTableManager(
      $_db,
      $_db.gameEvents,
    ).filter((f) => f.gameId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_gameEventsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SubstitutionsTable, List<Substitution>>
  _substitutionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.substitutions,
    aliasName: $_aliasNameGenerator(db.games.id, db.substitutions.gameId),
  );

  $$SubstitutionsTableProcessedTableManager get substitutionsRefs {
    final manager = $$SubstitutionsTableTableManager(
      $_db,
      $_db.substitutions,
    ).filter((f) => f.gameId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_substitutionsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$GamesTableFilterComposer extends Composer<_$AppDatabase, $GamesTable> {
  $$GamesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get opponentName => $composableBuilder(
    column: $table.opponentName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get gameDate => $composableBuilder(
    column: $table.gameDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quarterDuration => $composableBuilder(
    column: $table.quarterDuration,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get currentQuarter => $composableBuilder(
    column: $table.currentQuarter,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get currentQuarterSeconds => $composableBuilder(
    column: $table.currentQuarterSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isTimerRunning => $composableBuilder(
    column: $table.isTimerRunning,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$TeamsTableFilterComposer get teamId {
    final $$TeamsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.teamId,
      referencedTable: $db.teams,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TeamsTableFilterComposer(
            $db: $db,
            $table: $db.teams,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> playerGameStatsRefs(
    Expression<bool> Function($$PlayerGameStatsTableFilterComposer f) f,
  ) {
    final $$PlayerGameStatsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.playerGameStats,
      getReferencedColumn: (t) => t.gameId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayerGameStatsTableFilterComposer(
            $db: $db,
            $table: $db.playerGameStats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> gameEventsRefs(
    Expression<bool> Function($$GameEventsTableFilterComposer f) f,
  ) {
    final $$GameEventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.gameEvents,
      getReferencedColumn: (t) => t.gameId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GameEventsTableFilterComposer(
            $db: $db,
            $table: $db.gameEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> substitutionsRefs(
    Expression<bool> Function($$SubstitutionsTableFilterComposer f) f,
  ) {
    final $$SubstitutionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.substitutions,
      getReferencedColumn: (t) => t.gameId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubstitutionsTableFilterComposer(
            $db: $db,
            $table: $db.substitutions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$GamesTableOrderingComposer
    extends Composer<_$AppDatabase, $GamesTable> {
  $$GamesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get opponentName => $composableBuilder(
    column: $table.opponentName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get gameDate => $composableBuilder(
    column: $table.gameDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quarterDuration => $composableBuilder(
    column: $table.quarterDuration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get currentQuarter => $composableBuilder(
    column: $table.currentQuarter,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get currentQuarterSeconds => $composableBuilder(
    column: $table.currentQuarterSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isTimerRunning => $composableBuilder(
    column: $table.isTimerRunning,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$TeamsTableOrderingComposer get teamId {
    final $$TeamsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.teamId,
      referencedTable: $db.teams,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TeamsTableOrderingComposer(
            $db: $db,
            $table: $db.teams,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GamesTableAnnotationComposer
    extends Composer<_$AppDatabase, $GamesTable> {
  $$GamesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get opponentName => $composableBuilder(
    column: $table.opponentName,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get gameDate =>
      $composableBuilder(column: $table.gameDate, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get quarterDuration => $composableBuilder(
    column: $table.quarterDuration,
    builder: (column) => column,
  );

  GeneratedColumn<int> get currentQuarter => $composableBuilder(
    column: $table.currentQuarter,
    builder: (column) => column,
  );

  GeneratedColumn<int> get currentQuarterSeconds => $composableBuilder(
    column: $table.currentQuarterSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isTimerRunning => $composableBuilder(
    column: $table.isTimerRunning,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$TeamsTableAnnotationComposer get teamId {
    final $$TeamsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.teamId,
      referencedTable: $db.teams,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TeamsTableAnnotationComposer(
            $db: $db,
            $table: $db.teams,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> playerGameStatsRefs<T extends Object>(
    Expression<T> Function($$PlayerGameStatsTableAnnotationComposer a) f,
  ) {
    final $$PlayerGameStatsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.playerGameStats,
      getReferencedColumn: (t) => t.gameId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayerGameStatsTableAnnotationComposer(
            $db: $db,
            $table: $db.playerGameStats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> gameEventsRefs<T extends Object>(
    Expression<T> Function($$GameEventsTableAnnotationComposer a) f,
  ) {
    final $$GameEventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.gameEvents,
      getReferencedColumn: (t) => t.gameId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GameEventsTableAnnotationComposer(
            $db: $db,
            $table: $db.gameEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> substitutionsRefs<T extends Object>(
    Expression<T> Function($$SubstitutionsTableAnnotationComposer a) f,
  ) {
    final $$SubstitutionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.substitutions,
      getReferencedColumn: (t) => t.gameId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubstitutionsTableAnnotationComposer(
            $db: $db,
            $table: $db.substitutions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$GamesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GamesTable,
          Game,
          $$GamesTableFilterComposer,
          $$GamesTableOrderingComposer,
          $$GamesTableAnnotationComposer,
          $$GamesTableCreateCompanionBuilder,
          $$GamesTableUpdateCompanionBuilder,
          (Game, $$GamesTableReferences),
          Game,
          PrefetchHooks Function({
            bool teamId,
            bool playerGameStatsRefs,
            bool gameEventsRefs,
            bool substitutionsRefs,
          })
        > {
  $$GamesTableTableManager(_$AppDatabase db, $GamesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GamesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GamesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GamesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> teamId = const Value.absent(),
                Value<String> opponentName = const Value.absent(),
                Value<DateTime> gameDate = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> quarterDuration = const Value.absent(),
                Value<int> currentQuarter = const Value.absent(),
                Value<int> currentQuarterSeconds = const Value.absent(),
                Value<bool> isTimerRunning = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => GamesCompanion(
                id: id,
                teamId: teamId,
                opponentName: opponentName,
                gameDate: gameDate,
                status: status,
                quarterDuration: quarterDuration,
                currentQuarter: currentQuarter,
                currentQuarterSeconds: currentQuarterSeconds,
                isTimerRunning: isTimerRunning,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int teamId,
                required String opponentName,
                required DateTime gameDate,
                required String status,
                required int quarterDuration,
                required int currentQuarter,
                required int currentQuarterSeconds,
                required bool isTimerRunning,
                required DateTime createdAt,
              }) => GamesCompanion.insert(
                id: id,
                teamId: teamId,
                opponentName: opponentName,
                gameDate: gameDate,
                status: status,
                quarterDuration: quarterDuration,
                currentQuarter: currentQuarter,
                currentQuarterSeconds: currentQuarterSeconds,
                isTimerRunning: isTimerRunning,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$GamesTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                teamId = false,
                playerGameStatsRefs = false,
                gameEventsRefs = false,
                substitutionsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (playerGameStatsRefs) db.playerGameStats,
                    if (gameEventsRefs) db.gameEvents,
                    if (substitutionsRefs) db.substitutions,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (teamId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.teamId,
                                    referencedTable: $$GamesTableReferences
                                        ._teamIdTable(db),
                                    referencedColumn: $$GamesTableReferences
                                        ._teamIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (playerGameStatsRefs)
                        await $_getPrefetchedData<
                          Game,
                          $GamesTable,
                          PlayerGameStat
                        >(
                          currentTable: table,
                          referencedTable: $$GamesTableReferences
                              ._playerGameStatsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$GamesTableReferences(
                                db,
                                table,
                                p0,
                              ).playerGameStatsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.gameId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (gameEventsRefs)
                        await $_getPrefetchedData<Game, $GamesTable, GameEvent>(
                          currentTable: table,
                          referencedTable: $$GamesTableReferences
                              ._gameEventsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$GamesTableReferences(
                                db,
                                table,
                                p0,
                              ).gameEventsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.gameId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (substitutionsRefs)
                        await $_getPrefetchedData<
                          Game,
                          $GamesTable,
                          Substitution
                        >(
                          currentTable: table,
                          referencedTable: $$GamesTableReferences
                              ._substitutionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$GamesTableReferences(
                                db,
                                table,
                                p0,
                              ).substitutionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.gameId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$GamesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GamesTable,
      Game,
      $$GamesTableFilterComposer,
      $$GamesTableOrderingComposer,
      $$GamesTableAnnotationComposer,
      $$GamesTableCreateCompanionBuilder,
      $$GamesTableUpdateCompanionBuilder,
      (Game, $$GamesTableReferences),
      Game,
      PrefetchHooks Function({
        bool teamId,
        bool playerGameStatsRefs,
        bool gameEventsRefs,
        bool substitutionsRefs,
      })
    >;
typedef $$PlayerGameStatsTableCreateCompanionBuilder =
    PlayerGameStatsCompanion Function({
      Value<int> id,
      required int gameId,
      required int playerId,
      required bool isOnCourt,
      required int minutesPlayed,
      required int twoPointMade,
      required int twoPointAttempted,
      required int threePointMade,
      required int threePointAttempted,
      required int freeThrowMade,
      required int freeThrowAttempted,
      required int assists,
      required int offensiveRebounds,
      required int defensiveRebounds,
      required int blocks,
      required int steals,
      required int turnovers,
      required int fouls,
      required int plusMinus,
    });
typedef $$PlayerGameStatsTableUpdateCompanionBuilder =
    PlayerGameStatsCompanion Function({
      Value<int> id,
      Value<int> gameId,
      Value<int> playerId,
      Value<bool> isOnCourt,
      Value<int> minutesPlayed,
      Value<int> twoPointMade,
      Value<int> twoPointAttempted,
      Value<int> threePointMade,
      Value<int> threePointAttempted,
      Value<int> freeThrowMade,
      Value<int> freeThrowAttempted,
      Value<int> assists,
      Value<int> offensiveRebounds,
      Value<int> defensiveRebounds,
      Value<int> blocks,
      Value<int> steals,
      Value<int> turnovers,
      Value<int> fouls,
      Value<int> plusMinus,
    });

final class $$PlayerGameStatsTableReferences
    extends
        BaseReferences<_$AppDatabase, $PlayerGameStatsTable, PlayerGameStat> {
  $$PlayerGameStatsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $GamesTable _gameIdTable(_$AppDatabase db) => db.games.createAlias(
    $_aliasNameGenerator(db.playerGameStats.gameId, db.games.id),
  );

  $$GamesTableProcessedTableManager get gameId {
    final $_column = $_itemColumn<int>('game_id')!;

    final manager = $$GamesTableTableManager(
      $_db,
      $_db.games,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_gameIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PlayersTable _playerIdTable(_$AppDatabase db) =>
      db.players.createAlias(
        $_aliasNameGenerator(db.playerGameStats.playerId, db.players.id),
      );

  $$PlayersTableProcessedTableManager get playerId {
    final $_column = $_itemColumn<int>('player_id')!;

    final manager = $$PlayersTableTableManager(
      $_db,
      $_db.players,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_playerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PlayerGameStatsTableFilterComposer
    extends Composer<_$AppDatabase, $PlayerGameStatsTable> {
  $$PlayerGameStatsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isOnCourt => $composableBuilder(
    column: $table.isOnCourt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get minutesPlayed => $composableBuilder(
    column: $table.minutesPlayed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get twoPointMade => $composableBuilder(
    column: $table.twoPointMade,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get twoPointAttempted => $composableBuilder(
    column: $table.twoPointAttempted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get threePointMade => $composableBuilder(
    column: $table.threePointMade,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get threePointAttempted => $composableBuilder(
    column: $table.threePointAttempted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get freeThrowMade => $composableBuilder(
    column: $table.freeThrowMade,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get freeThrowAttempted => $composableBuilder(
    column: $table.freeThrowAttempted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get assists => $composableBuilder(
    column: $table.assists,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get offensiveRebounds => $composableBuilder(
    column: $table.offensiveRebounds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get defensiveRebounds => $composableBuilder(
    column: $table.defensiveRebounds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get blocks => $composableBuilder(
    column: $table.blocks,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get steals => $composableBuilder(
    column: $table.steals,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get turnovers => $composableBuilder(
    column: $table.turnovers,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get fouls => $composableBuilder(
    column: $table.fouls,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get plusMinus => $composableBuilder(
    column: $table.plusMinus,
    builder: (column) => ColumnFilters(column),
  );

  $$GamesTableFilterComposer get gameId {
    final $$GamesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.gameId,
      referencedTable: $db.games,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GamesTableFilterComposer(
            $db: $db,
            $table: $db.games,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PlayersTableFilterComposer get playerId {
    final $$PlayersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playerId,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableFilterComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PlayerGameStatsTableOrderingComposer
    extends Composer<_$AppDatabase, $PlayerGameStatsTable> {
  $$PlayerGameStatsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isOnCourt => $composableBuilder(
    column: $table.isOnCourt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get minutesPlayed => $composableBuilder(
    column: $table.minutesPlayed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get twoPointMade => $composableBuilder(
    column: $table.twoPointMade,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get twoPointAttempted => $composableBuilder(
    column: $table.twoPointAttempted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get threePointMade => $composableBuilder(
    column: $table.threePointMade,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get threePointAttempted => $composableBuilder(
    column: $table.threePointAttempted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get freeThrowMade => $composableBuilder(
    column: $table.freeThrowMade,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get freeThrowAttempted => $composableBuilder(
    column: $table.freeThrowAttempted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get assists => $composableBuilder(
    column: $table.assists,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get offensiveRebounds => $composableBuilder(
    column: $table.offensiveRebounds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get defensiveRebounds => $composableBuilder(
    column: $table.defensiveRebounds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get blocks => $composableBuilder(
    column: $table.blocks,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get steals => $composableBuilder(
    column: $table.steals,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get turnovers => $composableBuilder(
    column: $table.turnovers,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get fouls => $composableBuilder(
    column: $table.fouls,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get plusMinus => $composableBuilder(
    column: $table.plusMinus,
    builder: (column) => ColumnOrderings(column),
  );

  $$GamesTableOrderingComposer get gameId {
    final $$GamesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.gameId,
      referencedTable: $db.games,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GamesTableOrderingComposer(
            $db: $db,
            $table: $db.games,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PlayersTableOrderingComposer get playerId {
    final $$PlayersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playerId,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableOrderingComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PlayerGameStatsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlayerGameStatsTable> {
  $$PlayerGameStatsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get isOnCourt =>
      $composableBuilder(column: $table.isOnCourt, builder: (column) => column);

  GeneratedColumn<int> get minutesPlayed => $composableBuilder(
    column: $table.minutesPlayed,
    builder: (column) => column,
  );

  GeneratedColumn<int> get twoPointMade => $composableBuilder(
    column: $table.twoPointMade,
    builder: (column) => column,
  );

  GeneratedColumn<int> get twoPointAttempted => $composableBuilder(
    column: $table.twoPointAttempted,
    builder: (column) => column,
  );

  GeneratedColumn<int> get threePointMade => $composableBuilder(
    column: $table.threePointMade,
    builder: (column) => column,
  );

  GeneratedColumn<int> get threePointAttempted => $composableBuilder(
    column: $table.threePointAttempted,
    builder: (column) => column,
  );

  GeneratedColumn<int> get freeThrowMade => $composableBuilder(
    column: $table.freeThrowMade,
    builder: (column) => column,
  );

  GeneratedColumn<int> get freeThrowAttempted => $composableBuilder(
    column: $table.freeThrowAttempted,
    builder: (column) => column,
  );

  GeneratedColumn<int> get assists =>
      $composableBuilder(column: $table.assists, builder: (column) => column);

  GeneratedColumn<int> get offensiveRebounds => $composableBuilder(
    column: $table.offensiveRebounds,
    builder: (column) => column,
  );

  GeneratedColumn<int> get defensiveRebounds => $composableBuilder(
    column: $table.defensiveRebounds,
    builder: (column) => column,
  );

  GeneratedColumn<int> get blocks =>
      $composableBuilder(column: $table.blocks, builder: (column) => column);

  GeneratedColumn<int> get steals =>
      $composableBuilder(column: $table.steals, builder: (column) => column);

  GeneratedColumn<int> get turnovers =>
      $composableBuilder(column: $table.turnovers, builder: (column) => column);

  GeneratedColumn<int> get fouls =>
      $composableBuilder(column: $table.fouls, builder: (column) => column);

  GeneratedColumn<int> get plusMinus =>
      $composableBuilder(column: $table.plusMinus, builder: (column) => column);

  $$GamesTableAnnotationComposer get gameId {
    final $$GamesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.gameId,
      referencedTable: $db.games,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GamesTableAnnotationComposer(
            $db: $db,
            $table: $db.games,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PlayersTableAnnotationComposer get playerId {
    final $$PlayersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playerId,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableAnnotationComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PlayerGameStatsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PlayerGameStatsTable,
          PlayerGameStat,
          $$PlayerGameStatsTableFilterComposer,
          $$PlayerGameStatsTableOrderingComposer,
          $$PlayerGameStatsTableAnnotationComposer,
          $$PlayerGameStatsTableCreateCompanionBuilder,
          $$PlayerGameStatsTableUpdateCompanionBuilder,
          (PlayerGameStat, $$PlayerGameStatsTableReferences),
          PlayerGameStat,
          PrefetchHooks Function({bool gameId, bool playerId})
        > {
  $$PlayerGameStatsTableTableManager(
    _$AppDatabase db,
    $PlayerGameStatsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlayerGameStatsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlayerGameStatsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlayerGameStatsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> gameId = const Value.absent(),
                Value<int> playerId = const Value.absent(),
                Value<bool> isOnCourt = const Value.absent(),
                Value<int> minutesPlayed = const Value.absent(),
                Value<int> twoPointMade = const Value.absent(),
                Value<int> twoPointAttempted = const Value.absent(),
                Value<int> threePointMade = const Value.absent(),
                Value<int> threePointAttempted = const Value.absent(),
                Value<int> freeThrowMade = const Value.absent(),
                Value<int> freeThrowAttempted = const Value.absent(),
                Value<int> assists = const Value.absent(),
                Value<int> offensiveRebounds = const Value.absent(),
                Value<int> defensiveRebounds = const Value.absent(),
                Value<int> blocks = const Value.absent(),
                Value<int> steals = const Value.absent(),
                Value<int> turnovers = const Value.absent(),
                Value<int> fouls = const Value.absent(),
                Value<int> plusMinus = const Value.absent(),
              }) => PlayerGameStatsCompanion(
                id: id,
                gameId: gameId,
                playerId: playerId,
                isOnCourt: isOnCourt,
                minutesPlayed: minutesPlayed,
                twoPointMade: twoPointMade,
                twoPointAttempted: twoPointAttempted,
                threePointMade: threePointMade,
                threePointAttempted: threePointAttempted,
                freeThrowMade: freeThrowMade,
                freeThrowAttempted: freeThrowAttempted,
                assists: assists,
                offensiveRebounds: offensiveRebounds,
                defensiveRebounds: defensiveRebounds,
                blocks: blocks,
                steals: steals,
                turnovers: turnovers,
                fouls: fouls,
                plusMinus: plusMinus,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int gameId,
                required int playerId,
                required bool isOnCourt,
                required int minutesPlayed,
                required int twoPointMade,
                required int twoPointAttempted,
                required int threePointMade,
                required int threePointAttempted,
                required int freeThrowMade,
                required int freeThrowAttempted,
                required int assists,
                required int offensiveRebounds,
                required int defensiveRebounds,
                required int blocks,
                required int steals,
                required int turnovers,
                required int fouls,
                required int plusMinus,
              }) => PlayerGameStatsCompanion.insert(
                id: id,
                gameId: gameId,
                playerId: playerId,
                isOnCourt: isOnCourt,
                minutesPlayed: minutesPlayed,
                twoPointMade: twoPointMade,
                twoPointAttempted: twoPointAttempted,
                threePointMade: threePointMade,
                threePointAttempted: threePointAttempted,
                freeThrowMade: freeThrowMade,
                freeThrowAttempted: freeThrowAttempted,
                assists: assists,
                offensiveRebounds: offensiveRebounds,
                defensiveRebounds: defensiveRebounds,
                blocks: blocks,
                steals: steals,
                turnovers: turnovers,
                fouls: fouls,
                plusMinus: plusMinus,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PlayerGameStatsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({gameId = false, playerId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (gameId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.gameId,
                                referencedTable:
                                    $$PlayerGameStatsTableReferences
                                        ._gameIdTable(db),
                                referencedColumn:
                                    $$PlayerGameStatsTableReferences
                                        ._gameIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (playerId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.playerId,
                                referencedTable:
                                    $$PlayerGameStatsTableReferences
                                        ._playerIdTable(db),
                                referencedColumn:
                                    $$PlayerGameStatsTableReferences
                                        ._playerIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PlayerGameStatsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PlayerGameStatsTable,
      PlayerGameStat,
      $$PlayerGameStatsTableFilterComposer,
      $$PlayerGameStatsTableOrderingComposer,
      $$PlayerGameStatsTableAnnotationComposer,
      $$PlayerGameStatsTableCreateCompanionBuilder,
      $$PlayerGameStatsTableUpdateCompanionBuilder,
      (PlayerGameStat, $$PlayerGameStatsTableReferences),
      PlayerGameStat,
      PrefetchHooks Function({bool gameId, bool playerId})
    >;
typedef $$GameEventsTableCreateCompanionBuilder =
    GameEventsCompanion Function({
      Value<int> id,
      required int gameId,
      required int playerId,
      required String eventType,
      required int quarter,
      required int quarterSeconds,
      required DateTime timestamp,
    });
typedef $$GameEventsTableUpdateCompanionBuilder =
    GameEventsCompanion Function({
      Value<int> id,
      Value<int> gameId,
      Value<int> playerId,
      Value<String> eventType,
      Value<int> quarter,
      Value<int> quarterSeconds,
      Value<DateTime> timestamp,
    });

final class $$GameEventsTableReferences
    extends BaseReferences<_$AppDatabase, $GameEventsTable, GameEvent> {
  $$GameEventsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $GamesTable _gameIdTable(_$AppDatabase db) => db.games.createAlias(
    $_aliasNameGenerator(db.gameEvents.gameId, db.games.id),
  );

  $$GamesTableProcessedTableManager get gameId {
    final $_column = $_itemColumn<int>('game_id')!;

    final manager = $$GamesTableTableManager(
      $_db,
      $_db.games,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_gameIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PlayersTable _playerIdTable(_$AppDatabase db) => db.players
      .createAlias($_aliasNameGenerator(db.gameEvents.playerId, db.players.id));

  $$PlayersTableProcessedTableManager get playerId {
    final $_column = $_itemColumn<int>('player_id')!;

    final manager = $$PlayersTableTableManager(
      $_db,
      $_db.players,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_playerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$GameEventsTableFilterComposer
    extends Composer<_$AppDatabase, $GameEventsTable> {
  $$GameEventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get eventType => $composableBuilder(
    column: $table.eventType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quarter => $composableBuilder(
    column: $table.quarter,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quarterSeconds => $composableBuilder(
    column: $table.quarterSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  $$GamesTableFilterComposer get gameId {
    final $$GamesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.gameId,
      referencedTable: $db.games,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GamesTableFilterComposer(
            $db: $db,
            $table: $db.games,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PlayersTableFilterComposer get playerId {
    final $$PlayersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playerId,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableFilterComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GameEventsTableOrderingComposer
    extends Composer<_$AppDatabase, $GameEventsTable> {
  $$GameEventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get eventType => $composableBuilder(
    column: $table.eventType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quarter => $composableBuilder(
    column: $table.quarter,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quarterSeconds => $composableBuilder(
    column: $table.quarterSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  $$GamesTableOrderingComposer get gameId {
    final $$GamesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.gameId,
      referencedTable: $db.games,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GamesTableOrderingComposer(
            $db: $db,
            $table: $db.games,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PlayersTableOrderingComposer get playerId {
    final $$PlayersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playerId,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableOrderingComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GameEventsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GameEventsTable> {
  $$GameEventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get eventType =>
      $composableBuilder(column: $table.eventType, builder: (column) => column);

  GeneratedColumn<int> get quarter =>
      $composableBuilder(column: $table.quarter, builder: (column) => column);

  GeneratedColumn<int> get quarterSeconds => $composableBuilder(
    column: $table.quarterSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  $$GamesTableAnnotationComposer get gameId {
    final $$GamesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.gameId,
      referencedTable: $db.games,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GamesTableAnnotationComposer(
            $db: $db,
            $table: $db.games,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PlayersTableAnnotationComposer get playerId {
    final $$PlayersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playerId,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableAnnotationComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GameEventsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GameEventsTable,
          GameEvent,
          $$GameEventsTableFilterComposer,
          $$GameEventsTableOrderingComposer,
          $$GameEventsTableAnnotationComposer,
          $$GameEventsTableCreateCompanionBuilder,
          $$GameEventsTableUpdateCompanionBuilder,
          (GameEvent, $$GameEventsTableReferences),
          GameEvent,
          PrefetchHooks Function({bool gameId, bool playerId})
        > {
  $$GameEventsTableTableManager(_$AppDatabase db, $GameEventsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GameEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GameEventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GameEventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> gameId = const Value.absent(),
                Value<int> playerId = const Value.absent(),
                Value<String> eventType = const Value.absent(),
                Value<int> quarter = const Value.absent(),
                Value<int> quarterSeconds = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
              }) => GameEventsCompanion(
                id: id,
                gameId: gameId,
                playerId: playerId,
                eventType: eventType,
                quarter: quarter,
                quarterSeconds: quarterSeconds,
                timestamp: timestamp,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int gameId,
                required int playerId,
                required String eventType,
                required int quarter,
                required int quarterSeconds,
                required DateTime timestamp,
              }) => GameEventsCompanion.insert(
                id: id,
                gameId: gameId,
                playerId: playerId,
                eventType: eventType,
                quarter: quarter,
                quarterSeconds: quarterSeconds,
                timestamp: timestamp,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$GameEventsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({gameId = false, playerId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (gameId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.gameId,
                                referencedTable: $$GameEventsTableReferences
                                    ._gameIdTable(db),
                                referencedColumn: $$GameEventsTableReferences
                                    ._gameIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (playerId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.playerId,
                                referencedTable: $$GameEventsTableReferences
                                    ._playerIdTable(db),
                                referencedColumn: $$GameEventsTableReferences
                                    ._playerIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$GameEventsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GameEventsTable,
      GameEvent,
      $$GameEventsTableFilterComposer,
      $$GameEventsTableOrderingComposer,
      $$GameEventsTableAnnotationComposer,
      $$GameEventsTableCreateCompanionBuilder,
      $$GameEventsTableUpdateCompanionBuilder,
      (GameEvent, $$GameEventsTableReferences),
      GameEvent,
      PrefetchHooks Function({bool gameId, bool playerId})
    >;
typedef $$SubstitutionsTableCreateCompanionBuilder =
    SubstitutionsCompanion Function({
      Value<int> id,
      required int gameId,
      required int playerInId,
      required int playerOutId,
      required int quarter,
      required int quarterSeconds,
      required DateTime timestamp,
    });
typedef $$SubstitutionsTableUpdateCompanionBuilder =
    SubstitutionsCompanion Function({
      Value<int> id,
      Value<int> gameId,
      Value<int> playerInId,
      Value<int> playerOutId,
      Value<int> quarter,
      Value<int> quarterSeconds,
      Value<DateTime> timestamp,
    });

final class $$SubstitutionsTableReferences
    extends BaseReferences<_$AppDatabase, $SubstitutionsTable, Substitution> {
  $$SubstitutionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $GamesTable _gameIdTable(_$AppDatabase db) => db.games.createAlias(
    $_aliasNameGenerator(db.substitutions.gameId, db.games.id),
  );

  $$GamesTableProcessedTableManager get gameId {
    final $_column = $_itemColumn<int>('game_id')!;

    final manager = $$GamesTableTableManager(
      $_db,
      $_db.games,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_gameIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PlayersTable _playerInIdTable(_$AppDatabase db) =>
      db.players.createAlias(
        $_aliasNameGenerator(db.substitutions.playerInId, db.players.id),
      );

  $$PlayersTableProcessedTableManager get playerInId {
    final $_column = $_itemColumn<int>('player_in_id')!;

    final manager = $$PlayersTableTableManager(
      $_db,
      $_db.players,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_playerInIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PlayersTable _playerOutIdTable(_$AppDatabase db) =>
      db.players.createAlias(
        $_aliasNameGenerator(db.substitutions.playerOutId, db.players.id),
      );

  $$PlayersTableProcessedTableManager get playerOutId {
    final $_column = $_itemColumn<int>('player_out_id')!;

    final manager = $$PlayersTableTableManager(
      $_db,
      $_db.players,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_playerOutIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SubstitutionsTableFilterComposer
    extends Composer<_$AppDatabase, $SubstitutionsTable> {
  $$SubstitutionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quarter => $composableBuilder(
    column: $table.quarter,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quarterSeconds => $composableBuilder(
    column: $table.quarterSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  $$GamesTableFilterComposer get gameId {
    final $$GamesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.gameId,
      referencedTable: $db.games,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GamesTableFilterComposer(
            $db: $db,
            $table: $db.games,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PlayersTableFilterComposer get playerInId {
    final $$PlayersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playerInId,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableFilterComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PlayersTableFilterComposer get playerOutId {
    final $$PlayersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playerOutId,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableFilterComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SubstitutionsTableOrderingComposer
    extends Composer<_$AppDatabase, $SubstitutionsTable> {
  $$SubstitutionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quarter => $composableBuilder(
    column: $table.quarter,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quarterSeconds => $composableBuilder(
    column: $table.quarterSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  $$GamesTableOrderingComposer get gameId {
    final $$GamesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.gameId,
      referencedTable: $db.games,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GamesTableOrderingComposer(
            $db: $db,
            $table: $db.games,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PlayersTableOrderingComposer get playerInId {
    final $$PlayersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playerInId,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableOrderingComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PlayersTableOrderingComposer get playerOutId {
    final $$PlayersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playerOutId,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableOrderingComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SubstitutionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SubstitutionsTable> {
  $$SubstitutionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get quarter =>
      $composableBuilder(column: $table.quarter, builder: (column) => column);

  GeneratedColumn<int> get quarterSeconds => $composableBuilder(
    column: $table.quarterSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  $$GamesTableAnnotationComposer get gameId {
    final $$GamesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.gameId,
      referencedTable: $db.games,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GamesTableAnnotationComposer(
            $db: $db,
            $table: $db.games,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PlayersTableAnnotationComposer get playerInId {
    final $$PlayersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playerInId,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableAnnotationComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PlayersTableAnnotationComposer get playerOutId {
    final $$PlayersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.playerOutId,
      referencedTable: $db.players,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PlayersTableAnnotationComposer(
            $db: $db,
            $table: $db.players,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SubstitutionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SubstitutionsTable,
          Substitution,
          $$SubstitutionsTableFilterComposer,
          $$SubstitutionsTableOrderingComposer,
          $$SubstitutionsTableAnnotationComposer,
          $$SubstitutionsTableCreateCompanionBuilder,
          $$SubstitutionsTableUpdateCompanionBuilder,
          (Substitution, $$SubstitutionsTableReferences),
          Substitution,
          PrefetchHooks Function({
            bool gameId,
            bool playerInId,
            bool playerOutId,
          })
        > {
  $$SubstitutionsTableTableManager(_$AppDatabase db, $SubstitutionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SubstitutionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SubstitutionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SubstitutionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> gameId = const Value.absent(),
                Value<int> playerInId = const Value.absent(),
                Value<int> playerOutId = const Value.absent(),
                Value<int> quarter = const Value.absent(),
                Value<int> quarterSeconds = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
              }) => SubstitutionsCompanion(
                id: id,
                gameId: gameId,
                playerInId: playerInId,
                playerOutId: playerOutId,
                quarter: quarter,
                quarterSeconds: quarterSeconds,
                timestamp: timestamp,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int gameId,
                required int playerInId,
                required int playerOutId,
                required int quarter,
                required int quarterSeconds,
                required DateTime timestamp,
              }) => SubstitutionsCompanion.insert(
                id: id,
                gameId: gameId,
                playerInId: playerInId,
                playerOutId: playerOutId,
                quarter: quarter,
                quarterSeconds: quarterSeconds,
                timestamp: timestamp,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SubstitutionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({gameId = false, playerInId = false, playerOutId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (gameId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.gameId,
                                    referencedTable:
                                        $$SubstitutionsTableReferences
                                            ._gameIdTable(db),
                                    referencedColumn:
                                        $$SubstitutionsTableReferences
                                            ._gameIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (playerInId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.playerInId,
                                    referencedTable:
                                        $$SubstitutionsTableReferences
                                            ._playerInIdTable(db),
                                    referencedColumn:
                                        $$SubstitutionsTableReferences
                                            ._playerInIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (playerOutId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.playerOutId,
                                    referencedTable:
                                        $$SubstitutionsTableReferences
                                            ._playerOutIdTable(db),
                                    referencedColumn:
                                        $$SubstitutionsTableReferences
                                            ._playerOutIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$SubstitutionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SubstitutionsTable,
      Substitution,
      $$SubstitutionsTableFilterComposer,
      $$SubstitutionsTableOrderingComposer,
      $$SubstitutionsTableAnnotationComposer,
      $$SubstitutionsTableCreateCompanionBuilder,
      $$SubstitutionsTableUpdateCompanionBuilder,
      (Substitution, $$SubstitutionsTableReferences),
      Substitution,
      PrefetchHooks Function({bool gameId, bool playerInId, bool playerOutId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TeamsTableTableManager get teams =>
      $$TeamsTableTableManager(_db, _db.teams);
  $$PlayersTableTableManager get players =>
      $$PlayersTableTableManager(_db, _db.players);
  $$GamesTableTableManager get games =>
      $$GamesTableTableManager(_db, _db.games);
  $$PlayerGameStatsTableTableManager get playerGameStats =>
      $$PlayerGameStatsTableTableManager(_db, _db.playerGameStats);
  $$GameEventsTableTableManager get gameEvents =>
      $$GameEventsTableTableManager(_db, _db.gameEvents);
  $$SubstitutionsTableTableManager get substitutions =>
      $$SubstitutionsTableTableManager(_db, _db.substitutions);
}
