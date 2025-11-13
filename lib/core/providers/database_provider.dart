import 'package:hooply/core/database/app_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "database_provider.g.dart";

@riverpod
AppDatabase database(Ref ref) {
  final database = AppDatabase();

  ref.onDispose(() {
    database.close();
  });

  return database;
}
