import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationsMap extends StatefulWidget {
  @override
  _LocationsMapState createState() => _LocationsMapState();
}

class _LocationsMapState extends State<LocationsMap> {
  final Set<Marker> listMarkers = {};

  GoogleMapController mapController;
  final LatLng _center = const LatLng(25.721769550208304, -80.28390421372852); // Miami FL

  void _add(){
    listMarkers.add(Marker(
      markerId: MarkerId('1'),
      position: LatLng(25.722917823616577, -80.27850274043658),
      infoWindow: InfoWindow(title: 'MacArthur Engineering Building'),
      icon: BitmapDescriptor.defaultMarker
    ));
    listMarkers.add(Marker(
        markerId: MarkerId('2'),
        position: LatLng(25.72117127895442, -80.27871796196372),
        infoWindow: InfoWindow(title: 'Richter Library'),
        icon: BitmapDescriptor.defaultMarker
    ));
    listMarkers.add(Marker(
        markerId: MarkerId('3'),
        position: LatLng(25.718254078704398, -80.2764837059855),
        infoWindow: InfoWindow(title: 'Pavia Garage'),
        icon: BitmapDescriptor.defaultMarker
    ));
    listMarkers.add(Marker(
        markerId: MarkerId('4'),
        position: LatLng(25.71601185840652, -80.28101576930793),
        infoWindow: InfoWindow(title: 'Herbert Wellness Center'),
        icon: BitmapDescriptor.defaultMarker
    ));
    listMarkers.add(Marker(
        markerId: MarkerId('5'),
        position: LatLng(25.71381610418882, -80.28496026255229),
        infoWindow: InfoWindow(title: 'University Village'),
        icon: BitmapDescriptor.defaultMarker
    ));
    listMarkers.add(Marker(
        markerId: MarkerId('6'),
        position: LatLng(25.722086222379634, -80.27571779684541),
        infoWindow: InfoWindow(title: 'Whitten Learning Center'),
        icon: BitmapDescriptor.defaultMarker
    ));
    listMarkers.add(Marker(
        markerId: MarkerId('7'),
        position: LatLng(25.690783420406504, -80.31327997836102),
        infoWindow: InfoWindow(title: 'Dadeland Mall'),
        icon: BitmapDescriptor.defaultMarker
    ));
    listMarkers.add(Marker(
        markerId: MarkerId('8'),
        position: LatLng(25.714965078940928, -80.27693604666499),
        infoWindow: InfoWindow(title: 'University Metrorail'),
        icon: BitmapDescriptor.defaultMarker
    ));
    listMarkers.add(Marker(
        markerId: MarkerId('9'),
        position: LatLng(25.706053812749982, -80.28660207927764),
        infoWindow: InfoWindow(title: 'Shops at Sunset Place'),
        icon: BitmapDescriptor.defaultMarker
    ));
    listMarkers.add(Marker(
        markerId: MarkerId('10'),
        position: LatLng(25.733599270221283, -80.26374224711114),
        infoWindow: InfoWindow(title: 'Coral Gables High School'),
        icon: BitmapDescriptor.defaultMarker
    ));

  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();
    _add();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 13.0,
        ),
        markers: listMarkers,
      ),
    );
  }
}