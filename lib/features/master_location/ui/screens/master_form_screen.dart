import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:operator_test/core/db/local/app_db.dart';
import 'package:operator_test/features/auth/register/ui/screens/face_screen.dart';
import 'package:operator_test/features/auth/register/ui/screens/result_screen.dart';
import 'package:operator_test/features/master_location/bloc/master_bloc.dart';
import 'package:operator_test/features/master_location/ui/screens/select_map_screen.dart';
import 'package:operator_test/generated/assets.dart';
import 'package:operator_test/injection.dart';
import 'package:drift/drift.dart' as drift;

class MasterFormScreen extends StatefulWidget {
  const MasterFormScreen({super.key});

  @override
  State<MasterFormScreen> createState() => _MasterFormScreenState();
}

class _MasterFormScreenState extends State<MasterFormScreen> {
  final MasterBloc masterBloc = getIt.get<MasterBloc>();
  final name = TextEditingController();
  final email = TextEditingController();
  final lat = TextEditingController();
  final long = TextEditingController();
  final address = TextEditingController();

  Future<void> _getAddressFromLatLng(double latitude, double longitude) async {
    await placemarkFromCoordinates(latitude, longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        address.text =
            '${place.street}, ${place.subLocality},${place.subAdministrativeArea}, ${place.postalCode}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
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
          "Tambah Master Lokasi",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: BlocConsumer<MasterBloc, MasterState>(
          bloc: masterBloc,
          builder: (context, state) {
            switch (state.runtimeType) {
              case PostMasterFetchingLoadingState:
                return Column(
                  children: [
                    Center(child: const CircularProgressIndicator()),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Center(
                        child: Text(
                          "Data Cabang",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Row(
                              children: [
                                Text("Nama"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 18.0),
                            child: TextField(
                              controller: name,
                              style: TextStyle(fontSize: 12.0, height: 1),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                                hintText: "Nama",
                                hintStyle: TextStyle(color: Colors.grey),
                                prefixIcon: UnconstrainedBox(
                                  child: SvgPicture.asset(
                                    Assets.imageIconIdCard,
                                    colorFilter: ColorFilter.mode(
                                        Colors.grey, BlendMode.srcIn),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        const BorderSide(color: Colors.grey)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        color: Color(0xff7CFFFF))),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Row(
                              children: [
                                Text("Lokasi"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 18.0),
                            child: TextField(
                              enabled: false,
                              controller: address,
                              style: TextStyle(fontSize: 12.0, height: 1),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                                hintText: "Lokasi",
                                hintStyle: TextStyle(color: Colors.grey),
                                prefixIcon: UnconstrainedBox(
                                  child: SvgPicture.asset(
                                    Assets.imageIconIdCard,
                                    colorFilter: ColorFilter.mode(
                                        Colors.grey, BlendMode.srcIn),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        const BorderSide(color: Colors.grey)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        color: Color(0xff7CFFFF))),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Row(
                              children: [
                                Text("Latitude"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 18.0),
                            child: TextField(
                              enabled: false,
                              controller: lat,
                              style: TextStyle(fontSize: 12.0, height: 1),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                                hintText: "Latitude",
                                hintStyle: TextStyle(color: Colors.grey),
                                prefixIcon: UnconstrainedBox(
                                  child: SvgPicture.asset(
                                    Assets.imageIconIdCard,
                                    colorFilter: ColorFilter.mode(
                                        Colors.grey, BlendMode.srcIn),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        const BorderSide(color: Colors.grey)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        color: Color(0xff7CFFFF))),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Row(
                              children: [
                                Text("Longtitude"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 18.0),
                            child: TextField(
                              enabled: false,
                              controller: long,
                              style: TextStyle(fontSize: 12.0, height: 1),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                                hintText: "Longtitude",
                                hintStyle: TextStyle(color: Colors.grey),
                                prefixIcon: UnconstrainedBox(
                                  child: SvgPicture.asset(
                                    Assets.imageIconIdCard,
                                    colorFilter: ColorFilter.mode(
                                        Colors.grey, BlendMode.srcIn),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        const BorderSide(color: Colors.grey)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        color: Color(0xff7CFFFF))),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 18.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MarkerPage(
                                              masterBloc2: masterBloc,
                                            )));
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
                                  'Pilih Lokasi',
                                  textAlign: TextAlign.center,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 18.0),
                            child: GestureDetector(
                              onTap: () {
                                if (name.text.isEmpty &&
                                    address.text.isEmpty &&
                                    lat.text.isEmpty &&
                                    long.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'Tentukan Lokasi Terlebih Dahulu'),
                                      duration: Duration(seconds: 1),
                                      showCloseIcon: true,
                                    ),
                                  );
                                }
                                final entity = MasterCompanion(
                                  name: drift.Value(name.text),
                                  lat: drift.Value(lat.text),
                                  long: drift.Value(long.text),
                                  address: drift.Value(address.text),
                                );
                                masterBloc
                                    .add(PostMasterFetchEvent(entity: entity));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                height: 50,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: name.text.isEmpty &&
                                          address.text.isEmpty &&
                                          lat.text.isEmpty &&
                                          long.text.isEmpty
                                      ? Colors.grey
                                      : Color(0xff02AFE6),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Text(
                                  'Selanjutnya',
                                  textAlign: TextAlign.center,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 50,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Color(0xff02AFE6)),
                              ),
                              onPressed: () {
                                // Navigator.pop(context);
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
                        ],
                      ),
                    ),
                  ],
                );
              default:
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Center(
                        child: Text(
                          "Data Cabang",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Row(
                              children: [
                                Text("Nama"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 18.0),
                            child: TextField(
                              controller: name,
                              style: TextStyle(fontSize: 12.0, height: 1),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                                hintText: "Nama",
                                hintStyle: TextStyle(color: Colors.grey),
                                prefixIcon: UnconstrainedBox(
                                  child: SvgPicture.asset(
                                    Assets.imageIconIdCard,
                                    colorFilter: ColorFilter.mode(
                                        Colors.grey, BlendMode.srcIn),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        const BorderSide(color: Colors.grey)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        color: Color(0xff7CFFFF))),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Row(
                              children: [
                                Text("Lokasi"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 18.0),
                            child: TextField(
                              enabled: false,
                              controller: address,
                              style: TextStyle(fontSize: 12.0, height: 1),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                                hintText: "Lokasi",
                                hintStyle: TextStyle(color: Colors.grey),
                                prefixIcon: UnconstrainedBox(
                                  child: SvgPicture.asset(
                                    Assets.imageIconIdCard,
                                    colorFilter: ColorFilter.mode(
                                        Colors.grey, BlendMode.srcIn),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        const BorderSide(color: Colors.grey)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        color: Color(0xff7CFFFF))),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Row(
                              children: [
                                Text("Latitude"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 18.0),
                            child: TextField(
                              enabled: false,
                              controller: lat,
                              style: TextStyle(fontSize: 12.0, height: 1),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                                hintText: "Latitude",
                                hintStyle: TextStyle(color: Colors.grey),
                                prefixIcon: UnconstrainedBox(
                                  child: SvgPicture.asset(
                                    Assets.imageIconIdCard,
                                    colorFilter: ColorFilter.mode(
                                        Colors.grey, BlendMode.srcIn),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        const BorderSide(color: Colors.grey)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        color: Color(0xff7CFFFF))),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Row(
                              children: [
                                Text("Longtitude"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 18.0),
                            child: TextField(
                              enabled: false,
                              controller: long,
                              style: TextStyle(fontSize: 12.0, height: 1),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                                hintText: "Longtitude",
                                hintStyle: TextStyle(color: Colors.grey),
                                prefixIcon: UnconstrainedBox(
                                  child: SvgPicture.asset(
                                    Assets.imageIconIdCard,
                                    colorFilter: ColorFilter.mode(
                                        Colors.grey, BlendMode.srcIn),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        const BorderSide(color: Colors.grey)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        color: Color(0xff7CFFFF))),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 18.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MarkerPage(
                                            masterBloc2: masterBloc)));
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
                                  'Pilih Lokasi',
                                  textAlign: TextAlign.center,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 18.0),
                            child: GestureDetector(
                              onTap: () {
                                if (name.text.isEmpty ||
                                    address.text.isEmpty ||
                                    lat.text.isEmpty ||
                                    long.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'Tentukan Lokasi Terlebih Dahulu'),
                                      duration: Duration(seconds: 1),
                                      showCloseIcon: true,
                                    ),
                                  );
                                } else {
                                  final entity = MasterCompanion(
                                    name: drift.Value(name.text),
                                    lat: drift.Value(lat.text),
                                    long: drift.Value(long.text),
                                    address: drift.Value(address.text),
                                  );
                                  masterBloc
                                      .add(PostMasterFetchEvent(entity: entity));
                                }
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                height: 50,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: name.text.isEmpty &&
                                          address.text.isEmpty &&
                                          lat.text.isEmpty &&
                                          long.text.isEmpty
                                      ? Colors.grey
                                      : Color(0xff02AFE6),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Text(
                                  'Selanjutnya',
                                  textAlign: TextAlign.center,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 50,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Color(0xff02AFE6)),
                              ),
                              onPressed: () {
                                // Navigator.pop(context);
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
                        ],
                      ),
                    ),
                  ],
                );
            }
          },
          listener: (context, state) {
            if (state.runtimeType == SetMasterToLocationState) {
              Navigator.pop(context);
              final p = state as SetMasterToLocationState;
              lat.text = p.latData;
              long.text = p.longData;
              _getAddressFromLatLng(double.parse(p.latData), double.parse(p.longData));
            }

            if (state.runtimeType == PostMasterFetchingSuccess) {
              Navigator.pop(context);
            } else if (state.runtimeType == PostMasterFetchingErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Tidak Bisa Menyimpan Lokasi'),
                  duration: Duration(seconds: 1),
                  showCloseIcon: true,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
