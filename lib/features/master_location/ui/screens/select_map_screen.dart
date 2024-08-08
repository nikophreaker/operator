import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:operator_test/features/master_location/bloc/master_bloc.dart';
import 'package:operator_test/features/master_location/utils/tile_provides.dart';
import 'package:latlong2/latlong.dart';
import 'package:operator_test/injection.dart';

class MarkerPage extends StatefulHookWidget {
  const MarkerPage({super.key, required this.masterBloc2});

  final MasterBloc masterBloc2;

  @override
  State<MarkerPage> createState() => _MarkerPageState();
}

class _MarkerPageState extends State<MarkerPage> {
  final MasterBloc masterBloc = getIt.get<MasterBloc>();

  @override
  void initState() {
    super.initState();
    masterBloc.add(GetMasterFetchStreamEvent());
  }

  @override
  Widget build(BuildContext context) {

    Alignment selectedAlignment = Alignment.topCenter;
    bool counterRotate = true;

    Marker buildPin(LatLng point) => Marker(
      point: point,
      width: 60,
      height: 60,
      child: GestureDetector(
        onTap: () => ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Tapped existing marker'),
            duration: Duration(seconds: 1),
            showCloseIcon: true,
          ),
        ),
        child: const Icon(Icons.location_pin, size: 60, color: Colors.black),
      ),
    );

    late final customMarkers = useRef<List<Marker>>([]);

    masterBloc.masterRepository.getMasterStream().listen((data) {
      data.map((e){
        customMarkers.value.add(buildPin(LatLng(double.parse(e.lat), double.parse(e.long))));
      });
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Markers')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Tap the map to add markers!'),
                    const SizedBox(height: 10),
                  ],
                ),
              ],
            ),
          ),
          Flexible(
            child: FlutterMap(
              options: MapOptions(
                initialCenter: const LatLng(-6.20, 106.81),
                initialZoom: 10,
                onTap: (_, p) => setState(() {
                  customMarkers.value.add(buildPin(p));
                  widget.masterBloc2.add(SetMasterToLocationEvent(latData: p.latitude.toString(),longData: p.longitude.toString()));
                }),
                interactionOptions: const InteractionOptions(
                  flags: ~InteractiveFlag.doubleTapZoom,

                ),
                // onSecondaryTap: (_, p) => customMarkers.value.remove(buildPin(p)),
              ),
              children: [
                openStreetMapTileLayer,
                MarkerLayer(
                  markers: customMarkers.value,
                  rotate: counterRotate,
                  alignment: selectedAlignment,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}