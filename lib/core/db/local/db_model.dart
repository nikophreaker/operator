import 'package:drift/drift.dart';

class Master extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get lat => text()();
  TextColumn get long => text()();
  TextColumn get address => text()();
}

class Attendance extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idMaster => integer().references(Master, #id).nullable()();
  TextColumn get name => text()();
  TextColumn get lat => text()();
  TextColumn get long => text()();
  TextColumn get address => text()();
  DateTimeColumn get createdAt => dateTime()();
}