import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; //35.1457, 33.9071


class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  late GoogleMapController? mapController;

  final LatLng markerLocation = LatLng(37.8579558732941, 27.259522941396746); // Coordinates for marker location

  Set<Marker> markers = {
    Marker(
      markerId: MarkerId('marker_1'),
      position: LatLng(37.860593293843216, 27.259611567311957), // Coordinates for marker location
      infoWindow: InfoWindow(
        title: 'Container Area',
        snippet: 'Glass Container',
      ),
    ),
    Marker(
      markerId: MarkerId('marker_2'),
      position: LatLng(37.85812100092891, 27.257628848512564), // Coordinates for marker location
      infoWindow: InfoWindow(
        title: 'Container Area',
        snippet: 'Metal Container',
      ),
    ),
    Marker(
      markerId: MarkerId('marker_3'),
      position: LatLng(37.85921490221663, 27.258390399598646), // Coordinates for marker location
      infoWindow: InfoWindow(
        title: 'Container Area',
        snippet: 'Plastic Container',
      ),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title: Center(child: Text('CONTAINER MAP')),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: markerLocation,
          zoom: 14.5,
        ),
        markers: markers,
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
      ),
    );
  }

}
