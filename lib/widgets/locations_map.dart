import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../constants/colors.dart';
import '../constants/route_names.dart';

class LocationsMap extends StatefulWidget {
  @override
  _LocationsMapState createState() => _LocationsMapState();
}

class _LocationsMapState extends State<LocationsMap> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(25.761681, -80.191788); // Miami FL

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, RouteNames.camera);
        },
        child: Icon(Icons.camera_alt_rounded, color: ThemeColors.fabIcon),
        backgroundColor: ThemeColors.fab,
      ),
    );
  }
}