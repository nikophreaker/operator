import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:operator_test/core/db/local/app_db.dart';
import 'package:operator_test/features/master_location/domain/repository/master_repo.dart';

part 'master_event.dart';
part 'master_state.dart';

@injectable
class MasterBloc extends Bloc<MasterEvent, MasterState> {
  final MasterRepository masterRepository;
  MasterBloc(this.masterRepository) : super(GetMasterInitial()) {
    on<SetMasterToLocationEvent>(_onSetMasterToLocation);
    on<GetMasterFetchStreamEvent>(_onGetMasterStream);
    on<GetMasterByIdFetchEvent>(_onGetMasterById);
    on<GetMasterFetchEvent>(_onGetMaster);
    on<PostMasterFetchEvent>(_onPostMaster);
    on<DeleteMasterFetchEvent>(_onDeleteMaster);
  }

  Future<void> _onSetMasterToLocation(
      SetMasterToLocationEvent event,
      Emitter<MasterState> emit,
      ) async {
    emit(SetMasterToLocationState(latData: event.latData,longData: event.longData));
  }

  void _onGetMasterStream(
      GetMasterFetchStreamEvent event,
      Emitter<MasterState> emit,
      ) {
    emit(GetMasterFetchingStreamLoadingState());
    Stream<List<MasterData>> masterData = masterRepository.getMasterStream();
    emit(GetMasterFetchingStreamSuccess(masterData: masterData));
  }

  Future<void> _onGetMasterById(
      GetMasterByIdFetchEvent event,
      Emitter<MasterState> emit,
      ) async {
    emit(GetMasterByIdFetchingLoadingState());
    MasterData? masterData = await masterRepository.getMasterById(event.id);
    emit(GetMasterByIdFetchingSuccess(masterData: masterData));
  }

  Future<void> _onGetMaster(
      GetMasterFetchEvent event,
      Emitter<MasterState> emit,
      ) async {
    emit(GetMasterFetchingLoadingState());
    List<MasterData?> masterData = await masterRepository.getMaster();
    emit(GetMasterFetchingSuccess(masterData: masterData));
  }

  Future<void> _onPostMaster(
      PostMasterFetchEvent event,
      Emitter<MasterState> emit,
      ) async {
    emit(PostMasterFetchingLoadingState());
    int masterData = await masterRepository.insertMaster(event.entity);
    emit(PostMasterFetchingSuccess(masterData: masterData));
  }

  Future<void> _onDeleteMaster(
      DeleteMasterFetchEvent event,
      Emitter<MasterState> emit,
      ) async {
    emit(DeleteMasterFetchingLoadingState());
    int masterData = await masterRepository.deleteMaster(event.id);
    emit(DeleteMasterFetchingSuccess(masterData: masterData));
  }
}
