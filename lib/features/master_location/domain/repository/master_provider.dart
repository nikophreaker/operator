import 'package:operator_test/core/db/local/app_db.dart';

abstract class MasterProvider {
  Future<MasterData?> getMasterById(int id);
  Future<List<MasterData?>> getMaster();
  Stream<List<MasterData>> getMasterStream();
  Future<int> insertMaster(MasterCompanion entity);
  Future<int> deleteMaster(int id);
}