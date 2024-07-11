import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart';
import 'package:operator_test/features/auth/login/ui/screens/login_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  await initializeDateFormatting('id_ID', null).then((_) => runApp(MyApp(camera: firstCamera,)));
  // findSystemLocale().then((_) => runApp(const MyApp()));
  // Intl.defaultLocale = 'id_ID';
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.camera});

  final CameraDescription camera;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white,),
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
      home: LoginScreen(camera: camera,),
    );
  }
}
