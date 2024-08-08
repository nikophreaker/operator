import 'package:geofence_service/geofence_service.dart';
import 'package:injectable/injectable.dart';
import 'package:operator_test/core/db/local/app_db.dart';
import 'package:operator_test/features/attendance/domain/repository/attendance_provider.dart';

@injectable
class AttendanceRepository implements AttendanceProvider {
  final AppDatabase _appDb;
  AttendanceRepository(this._appDb);

  @override
  Stream<List<AttendanceData>> getAttendanceStream() {
    try {
      return _appDb.getAttendanceStream();
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }

  }

  @override
  Future<List<AttendanceData?>> getAttendance() async {
    try {
      return await _appDb.getAttendance();
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }

  }

  @override
  Future<int> insertAttendance(AttendanceCompanion entity) async {
    try {
      return await _appDb.insertAttendance(entity);
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }

  }

  @override
  Future<int> deleteAttendance(int id) async {
    try {
      return await _appDb.deleteAttendance(id);
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }

  }

}