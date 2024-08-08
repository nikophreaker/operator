part of 'attendance_bloc.dart';

@immutable
sealed class AttendanceEvent {}
class GetAttendanceFetchEvent extends AttendanceEvent {
  GetAttendanceFetchEvent();
}
class GetAttendanceFetchStreamEvent extends AttendanceEvent {
  GetAttendanceFetchStreamEvent();
}

class PostAttendanceFetchEvent extends AttendanceEvent {
  final AttendanceCompanion entity;
  PostAttendanceFetchEvent({required this.entity});
}

class DeleteAttendanceFetchEvent extends AttendanceEvent {
  final int id;
  DeleteAttendanceFetchEvent({required this.id});
}
