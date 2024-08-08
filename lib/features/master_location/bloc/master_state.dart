part of 'master_bloc.dart';

@immutable
sealed class MasterState {}

class SetMasterToLocationState extends MasterState {
  final String latData;
  final String longData;
  SetMasterToLocationState({required this.latData,required this.longData});
}

class GetMasterStreamInitial extends MasterState {}

class GetMasterFetchingStreamLoadingState extends MasterState {}

class GetMasterFetchingErrorStreamState extends MasterState {}

class GetMasterFetchingStreamSuccess extends MasterState {
  final Stream<List<MasterData>> masterData;
  GetMasterFetchingStreamSuccess({required this.masterData});
}

class GetMasterByIdInitial extends MasterState {}

class GetMasterByIdFetchingLoadingState extends MasterState {}

class GetMasterByIdFetchingErrorState extends MasterState {}

class GetMasterByIdFetchingSuccess extends MasterState {
  final MasterData? masterData;
  GetMasterByIdFetchingSuccess({required this.masterData});
}

class GetMasterInitial extends MasterState {}

class GetMasterFetchingLoadingState extends MasterState {}

class GetMasterFetchingErrorState extends MasterState {}

class GetMasterFetchingSuccess extends MasterState {
  final List<MasterData?> masterData;
  GetMasterFetchingSuccess({required this.masterData});
}

final class PostMasterInitial extends MasterState {}

class PostMasterFetchingLoadingState extends MasterState {}

class PostMasterFetchingErrorState extends MasterState {}

class PostMasterFetchingSuccess extends MasterState {
  final int masterData;
  PostMasterFetchingSuccess({required this.masterData});
}

final class DeleteMasterInitial extends MasterState {}

class DeleteMasterFetchingLoadingState extends MasterState {}

class DeleteMasterFetchingErrorState extends MasterState {}

class DeleteMasterFetchingSuccess extends MasterState {
  final int masterData;
  DeleteMasterFetchingSuccess({required this.masterData});
}