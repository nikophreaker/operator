import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:operator_test/core/db/local/app_db.dart';
import 'package:operator_test/features/attendance/domain/repository/attendance_repo.dart';

part 'attendance_event.dart';
part 'attendance_state.dart';

@injectable
class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  final AttendanceRepository attendanceRepository;
  AttendanceBloc(this.attendanceRepository) : super(GetAttendanceInitial()) {
    on<GetAttendanceFetchStreamEvent>(_onGetAttendanceStream);
    on<GetAttendanceFetchEvent>(_onGetAttendance);
    on<PostAttendanceFetchEvent>(_onPostAttendance);
    on<DeleteAttendanceFetchEvent>(_onDeleteAttendance);
  }

  void _onGetAttendanceStream(
      GetAttendanceFetchStreamEvent event,
      Emitter<AttendanceState> emit,
      ) {
    emit(GetAttendanceFetchingStreamLoadingState());
    Stream<List<AttendanceData>> attendanceData = attendanceRepository.getAttendanceStream();
    emit(GetAttendanceFetchingStreamSuccess(attendanceData: attendanceData));
  }

  Future<void> _onGetAttendance(
      GetAttendanceFetchEvent event,
      Emitter<AttendanceState> emit,
      ) async {
    emit(GetAttendanceFetchingLoadingState());
    List<AttendanceData?> attendanceData = await attendanceRepository.getAttendance();
    emit(GetAttendanceFetchingSuccess(attendanceData: attendanceData));
  }

  Future<void> _onPostAttendance(
      PostAttendanceFetchEvent event,
      Emitter<AttendanceState> emit,
      ) async {
    emit(PostAttendanceFetchingLoadingState());
    int attendanceData = await attendanceRepository.insertAttendance(event.entity);
    emit(PostAttendanceFetchingSuccess(attendanceData: attendanceData));
  }

  Future<void> _onDeleteAttendance(
      DeleteAttendanceFetchEvent event,
      Emitter<AttendanceState> emit,
      ) async {
    emit(DeleteAttendanceFetchingLoadingState());
    int attendanceData = await attendanceRepository.deleteAttendance(event.id);
    emit(DeleteAttendanceFetchingSuccess(attendanceData: attendanceData));
  }
}
