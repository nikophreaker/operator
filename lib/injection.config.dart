// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:geofence_service/geofence_service.dart' as _i956;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:operator_test/core/db/local/app_db.dart' as _i466;
import 'package:operator_test/features/attendance/bloc/attendance_bloc.dart'
    as _i830;
import 'package:operator_test/features/attendance/domain/repository/attendance_repo.dart'
    as _i868;
import 'package:operator_test/features/master_location/bloc/master_bloc.dart'
    as _i1066;
import 'package:operator_test/features/master_location/domain/repository/master_repo.dart'
    as _i11;
import 'package:operator_test/injection.dart' as _i92;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i956.GeofenceService>(() => registerModule.geofenceService);
    gh.lazySingleton<_i466.AppDatabase>(() => _i466.AppDatabase());
    gh.factory<_i868.AttendanceRepository>(
        () => _i868.AttendanceRepository(gh<_i466.AppDatabase>()));
    gh.factory<_i11.MasterRepository>(
        () => _i11.MasterRepository(gh<_i466.AppDatabase>()));
    gh.factory<_i1066.MasterBloc>(
        () => _i1066.MasterBloc(gh<_i11.MasterRepository>()));
    gh.factory<_i830.AttendanceBloc>(
        () => _i830.AttendanceBloc(gh<_i868.AttendanceRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i92.RegisterModule {}
