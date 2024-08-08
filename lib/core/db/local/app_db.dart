import 'dart:ffi';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:operator_test/core/db/local/db_model.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_db.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

@DriftDatabase(tables: [Master, Attendance])
@lazySingleton
class AppDatabase extends _$AppDatabase {

  static AppDatabase instance() => AppDatabase();

  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          // we added the dueDate property in the change from version 1 to
          // version 2
          await m.addColumn(attendance, attendance.idMaster);
        }
      },
    );
  }

  Stream<List<AttendanceData>> getAttendanceStream() => select(attendance).watch();
  Stream<List<MasterData>> getMasterStream() => select(master).watch();

  Future<List<MasterData>> getMaster() async {
    return await select(master).get();
  }

  Future<MasterData> getMasterById(int id) async {
    return await (select(master)..where((i)=>i.id.equals(id))).getSingle();
  }

  Future<int> insertMaster(MasterCompanion entity) async {
    return await into(master).insert(entity);
  }

  Future<bool> updateMaster(MasterCompanion entity) async {
    return await update(master).replace(entity);
  }

  Future<int> deleteMaster(int id) async {
    return await (delete(master)..where((i)=>i.id.equals(id))).go();
  }

  Future<List<AttendanceData>> getAttendance() async {
    return await select(attendance).get();
  }

  Future<AttendanceData> getAttendanceById(int id) async {
    return await (select(attendance)..where((i)=>i.id.equals(id))).getSingle();
  }

  Future<int> insertAttendance(AttendanceCompanion entity) async {
    return await into(attendance).insert(entity);
  }

  Future<bool> updateAttendance(AttendanceCompanion entity) async {
    return await update(attendance).replace(entity);
  }

  Future<int> deleteAttendance(int id) async {
    return await  (delete(attendance)..where((i)=>i.id.equals(id))).go();
  }
}