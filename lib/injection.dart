import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geofence_service/geofence_service.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:operator_test/core/db/local/app_db.dart';
import 'package:operator_test/features/attendance/bloc/attendance_bloc.dart';
import 'package:operator_test/features/master_location/bloc/master_bloc.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
FutureOr<void> configureDependencies() => getIt.init();

@module
abstract class RegisterModule{
  @singleton
  GeofenceService get geofenceService => GeofenceService.instance.setup(
      interval: 5000,
      accuracy: 100,
      loiteringDelayMs: 60000,
      statusChangeDelayMs: 10000,
      useActivityRecognition: true,
      allowMockLocations: false,
      printDevLog: false,
      geofenceRadiusSortType: GeofenceRadiusSortType.DESC);
}



class GlobalBlocProviders extends StatelessWidget {
  final Widget child;

  const GlobalBlocProviders({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AttendanceBloc>(
          create: (_) => getIt.get<AttendanceBloc>(),
        ),
        BlocProvider<MasterBloc>(
          create: (_) => getIt.get<MasterBloc>(),
        ),
      ],
      child: child,
    );
  }
}