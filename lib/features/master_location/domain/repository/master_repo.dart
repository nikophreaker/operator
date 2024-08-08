import 'package:injectable/injectable.dart';
import 'package:operator_test/core/db/local/app_db.dart';
import 'package:operator_test/features/master_location/domain/repository/master_provider.dart';

@injectable
class MasterRepository implements MasterProvider {
  final AppDatabase _appDb;
  MasterRepository(this._appDb);

  @override
  Stream<List<MasterData>> getMasterStream() {
    try {
      return _appDb.getMasterStream();
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }

  }

  @override
  Future<MasterData?> getMasterById(int id) async {
    try {
      return await _appDb.getMasterById(id);
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }

  }

  @override
  Future<List<MasterData?>> getMaster() async {
    try {
      return await _appDb.getMaster();
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }

  }

  @override
  Future<int> insertMaster(MasterCompanion entity) async {
    try {
      return await _appDb.insertMaster(entity);
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }

  }

  @override
  Future<int> deleteMaster(int id) async {
    try {
      return await _appDb.deleteMaster(id);
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }

  }

}