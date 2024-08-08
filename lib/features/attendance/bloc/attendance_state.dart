part of 'attendance_bloc.dart';

@immutable
sealed class AttendanceState {}


class GetAttendanceStreamInitial extends AttendanceState {}

class GetAttendanceFetchingStreamLoadingState extends AttendanceState {}

class GetAttendanceFetchingErrorStreamState extends AttendanceState {}

class GetAttendanceFetchingStreamSuccess extends AttendanceState {
  final Stream<List<AttendanceData>> attendanceData;
  GetAttendanceFetchingStreamSuccess({required this.attendanceData});
}

class GetAttendanceInitial extends AttendanceState {}

class GetAttendanceFetchingLoadingState extends AttendanceState {}

class GetAttendanceFetchingErrorState extends AttendanceState {}

class GetAttendanceFetchingSuccess extends AttendanceState {
  final List<AttendanceData?> attendanceData;
  GetAttendanceFetchingSuccess({required this.attendanceData});
}

final class PostAttendanceInitial extends AttendanceState {}

class PostAttendanceFetchingLoadingState extends AttendanceState {}

class PostAttendanceFetchingErrorState extends AttendanceState {}

class PostAttendanceFetchingSuccess extends AttendanceState {
  final int attendanceData;
  PostAttendanceFetchingSuccess({required this.attendanceData});
}

final class DeleteAttendanceInitial extends AttendanceState {}

class DeleteAttendanceFetchingLoadingState extends AttendanceState {}

class DeleteAttendanceFetchingErrorState extends AttendanceState {}

class DeleteAttendanceFetchingSuccess extends AttendanceState {
  final int attendanceData;
  DeleteAttendanceFetchingSuccess({required this.attendanceData});
}