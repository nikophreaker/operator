part of 'master_bloc.dart';

@immutable
sealed class MasterEvent {}

class SetMasterToLocationEvent extends MasterEvent {
  final String latData;
  final String longData;
  SetMasterToLocationEvent({required this.latData,required this.longData});
}

class GetMasterFetchEvent extends MasterEvent {
  GetMasterFetchEvent();
}

class GetMasterByIdFetchEvent extends MasterEvent {
  final int id;
  GetMasterByIdFetchEvent({required this.id});
}

class GetMasterFetchStreamEvent extends MasterEvent {
  GetMasterFetchStreamEvent();
}

class PostMasterFetchEvent extends MasterEvent {
  final MasterCompanion entity;
  PostMasterFetchEvent({required this.entity});
}

class DeleteMasterFetchEvent extends MasterEvent {
  final int id;
  DeleteMasterFetchEvent({required this.id});
}
