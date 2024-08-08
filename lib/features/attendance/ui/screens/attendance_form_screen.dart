import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geofence_service/geofence_service.dart' as fence;
import 'package:geolocator/geolocator.dart' as geo;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:operator_test/core/db/local/app_db.dart';
import 'package:operator_test/features/attendance/bloc/attendance_bloc.dart';
import 'package:operator_test/features/master_location/bloc/master_bloc.dart';
import 'package:operator_test/generated/assets.dart';
import 'package:drift/drift.dart' as drift;
import 'package:operator_test/injection.dart';
import 'package:vector_math/vector_math.dart' as math;
import 'dart:math';

class AttendanceFormScreen extends StatefulWidget {
  const AttendanceFormScreen({super.key});

  @override
  State<AttendanceFormScreen> createState() => _AttendanceFormScreenState();
}

class _AttendanceFormScreenState extends State<AttendanceFormScreen> {
  final lokasi = TextEditingController();
  final lat = TextEditingController();
  final long = TextEditingController();
  final waktu = TextEditingController();

  final fence.GeofenceService _geofenceService =
      getIt.get<fence.GeofenceService>();
  final AttendanceBloc attendanceBloc = getIt.get<AttendanceBloc>();
  final MasterBloc masterBloc = getIt.get<MasterBloc>();

  MasterData? _selectedCabang;

  double getDistanceBetweenPositions({
    required double cabangLat,
    required double cabangLong,
    required double userLat,
    required double useLong,
  }) {
    final latDif = math.radians(cabangLat - userLat);
    final longDif = math.radians(cabangLong - useLong);
    final a = sin(latDif / 2) * sin(latDif / 2) +
        cos(math.radians(userLat)) *
            cos(math.radians(cabangLat)) *
            sin(longDif / 2) *
            sin(longDif / 2);
    final b = 2 * atan2(sqrt(a), sqrt(1 - a));
    final result = earthRadius * b;
    return result;
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    geo.LocationPermission permission;

    serviceEnabled = await geo.Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await geo.Geolocator.checkPermission();
    if (permission == geo.LocationPermission.denied) {
      permission = await geo.Geolocator.requestPermission();
      if (permission == geo.LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == geo.LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getAddressFromLatLng(geo.Position position) async {
    await placemarkFromCoordinates(position.latitude, position.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        lokasi.text =
            '${place.street}, ${place.subLocality},${place.subAdministrativeArea}, ${place.postalCode}';
        waktu.text = DateFormat('EEEE, d MMM yyyy hh:mm:ss a', 'id_ID')
            .format(DateTime.now())
            .toString();
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await geo.Geolocator.getCurrentPosition(
            desiredAccuracy: geo.LocationAccuracy.high)
        .then((geo.Position position) {
      setState(() {
        lat.text = position.latitude.toString();
        long.text = position.longitude.toString();
      });
      _getAddressFromLatLng(position);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  @override
  void initState() {
    super.initState();
    masterBloc.add(GetMasterFetchEvent());
  }

  @override
  void dispose() {
    super.dispose();
    lokasi.dispose();
    long.dispose();
    lat.dispose();
    waktu.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Konfirmasi Data Absen",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: BlocConsumer<AttendanceBloc, AttendanceState>(
            bloc: attendanceBloc,
            builder: (context, postAttendanceState) {
              switch (postAttendanceState.runtimeType) {
                case PostAttendanceFetchingLoadingState:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                default:
                  return Column(
                    children: [
                      ExpansionTile(
                        initiallyExpanded: true,
                        shape: Border(),
                        textColor: Color(0xff02AFE6),
                        collapsedIconColor: Color(0xff02AFE6),
                        iconColor: Color(0xff02AFE6),
                        title: Text('Identitas',
                            style: TextStyle(color: Color(0xff02AFE6))),
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nama',
                                  style: TextStyle(fontSize: 12),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.5, color: Color(0xff02AFE6)),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 12.0),
                                          child: SvgPicture.asset(
                                              Assets.imageIconIdCard),
                                        ),
                                        Text(
                                          "Employee",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      ExpansionTile(
                        initiallyExpanded: true,
                        shape: Border(),
                        textColor: Color(0xff02AFE6),
                        collapsedIconColor: Color(0xff02AFE6),
                        iconColor: Color(0xff02AFE6),
                        title: Text('Keterangan',
                            style: TextStyle(color: Color(0xff02AFE6))),
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Cabang',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 12.0),
                                            child: SvgPicture.asset(
                                                Assets.imageIconIdCard),
                                          ),
                                          BlocConsumer<MasterBloc, MasterState>(
                                              bloc: masterBloc,
                                              listener: (context, state) {},
                                              builder: (context, state) {
                                                switch (state.runtimeType) {
                                                  case GetMasterFetchingSuccess:
                                                    final data = state
                                                        as GetMasterFetchingSuccess;
                                                    return DropdownButton(
                                                      elevation: 16,
                                                      style: const TextStyle(
                                                          color: Color(
                                                              0xff02AFE6)),
                                                      underline: Container(
                                                        height: 2,
                                                        color:
                                                            Color(0xff02AFE6),
                                                      ),
                                                      hint:
                                                          Text("Pilih Cabang"),
                                                      value: _selectedCabang,
                                                      items: data.masterData
                                                          .map((item) {
                                                        return DropdownMenuItem(
                                                          child: Text(
                                                              item?.name ?? ''),
                                                          value: item,
                                                        );
                                                      }).toList(),
                                                      onChanged: (value) {
                                                        setState(() {
                                                          _selectedCabang =
                                                              value;
                                                        });
                                                      },
                                                    );
                                                  default:
                                                    return SizedBox();
                                                }
                                              }),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Lokasi',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                            width: 1.5,
                                            color: Color(0xff02AFE6)),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 12.0),
                                              child: SvgPicture.asset(
                                                  Assets.imageIconIdCard),
                                            ),
                                            Text(
                                              lokasi.text,
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Latitude',
                                  style: TextStyle(fontSize: 12),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.5, color: Color(0xff02AFE6)),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 12.0),
                                          child: SvgPicture.asset(
                                              Assets.imageIconIdCard),
                                        ),
                                        Text(
                                          lat.text,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Longtitude',
                                  style: TextStyle(fontSize: 12),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.5, color: Color(0xff02AFE6)),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 12.0),
                                          child: SvgPicture.asset(
                                              Assets.imageIconIdCard),
                                        ),
                                        Text(
                                          long.text,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Waktu',
                                  style: TextStyle(fontSize: 12),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.5, color: Color(0xff02AFE6)),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 12.0),
                                          child: SvgPicture.asset(
                                              Assets.imageIconIdCard),
                                        ),
                                        Text(
                                          waktu.text,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 18.0),
                        child: GestureDetector(
                          onTap: _getCurrentPosition,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color(0xff02AFE6),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Text(
                              'Dapatkan Lokasi Terkini',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 18.0),
                        child: GestureDetector(
                          onTap: () {
                            if (_selectedCabang != null) {
                              print(
                                  'Lokasi radius: ${getDistanceBetweenPositions(cabangLat: double.parse(_selectedCabang!.lat), cabangLong: double.parse(_selectedCabang!.long), userLat: double.parse(lat.text), useLong: double.parse(long.text))}');
                              if (lokasi.text.isEmpty ||
                                  lat.text.isEmpty ||
                                  long.text.isEmpty ||
                                  waktu.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text('Dapatkan Lokasi Terlebih Dahulu'),
                                    duration: Duration(seconds: 1),
                                    showCloseIcon: true,
                                  ),
                                );
                              } else if (getDistanceBetweenPositions(
                                      cabangLat:
                                          double.parse(_selectedCabang!.lat),
                                      cabangLong:
                                          double.parse(_selectedCabang!.long),
                                      userLat: double.parse(lat.text),
                                      useLong: double.parse(long.text)) >
                                  50) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Lokasi Kamu terlalu jauh'),
                                    duration: Duration(seconds: 1),
                                    showCloseIcon: true,
                                  ),
                                );
                              } else {
                                final entity = AttendanceCompanion(
                                    name: drift.Value("Employee"),
                                    lat: drift.Value(lat.text),
                                    long: drift.Value(long.text),
                                    address: drift.Value(lokasi.text),
                                    createdAt: drift.Value(DateTime.now()));
                                attendanceBloc.add(
                                    PostAttendanceFetchEvent(entity: entity));
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Pilih Cabang terlebih dahulu'),
                                  duration: Duration(seconds: 1),
                                  showCloseIcon: true,
                                ),
                              );
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color(0xff02AFE6),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Text(
                              'Check In',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 18.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 50,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Color(0xff02AFE6)),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Batal",
                              style: TextStyle(
                                color: Colors.lightBlue,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
              }
            },
            listener: (BuildContext context, AttendanceState state) {
              switch (state.runtimeType) {
                case PostAttendanceFetchingSuccess:
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Berhasil Check In'),
                      duration: Duration(seconds: 1),
                      showCloseIcon: true,
                    ),
                  );
                  Navigator.pop(context);

                case PostAttendanceFetchingErrorState:
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Tidak Bisa Check In'),
                      duration: Duration(seconds: 1),
                      showCloseIcon: true,
                    ),
                  );

                default:
              }
            },
          ),
        ),
      ),
    );
  }
}
