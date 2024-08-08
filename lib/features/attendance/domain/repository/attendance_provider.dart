import 'package:geofence_service/geofence_service.dart';
import 'package:operator_test/core/db/local/app_db.dart';

abstract class AttendanceProvider {
  Future<List<AttendanceData?>> getAttendance();
  Stream<List<AttendanceData>> getAttendanceStream();
  Future<int> insertAttendance(AttendanceCompanion entity);
  Future<int> deleteAttendance(int id);
}