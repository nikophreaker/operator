import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart';
import 'package:operator_test/features/auth/login/ui/screens/login_screen.dart';
import 'package:operator_test/features/home/ui/screens/home_screen.dart';

import 'injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;
  final secondCamera = cameras.last;

  await configureDependencies();

  await initializeDateFormatting('id_ID', null).then(
    (_) => runApp(
      GlobalBlocProviders(
        child: MyApp(
          camera: firstCamera,
          camera2: secondCamera,
        ),
      ),
    ),
  );
  // findSystemLocale().then((_) => runApp(const MyApp()));
  // Intl.defaultLocale = 'id_ID';
  // runApp(const MyApp());
}

class MyApp extends HookWidget {
  const MyApp({super.key, required this.camera, required this.camera2});

  final CameraDescription camera;
  final CameraDescription camera2;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
        ),
        useMaterial3: true,
        textTheme: Theme.of(context).textTheme.copyWith(
              bodySmall: const TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              titleMedium: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
      ),
      home: HomeScreen(
        camera: camera,
        camera2: camera2,
      ),
    );
  }
}
