import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; //35.1457, 33.9071

class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  late GoogleMapController? mapController;

  final LatLng markerLocation = LatLng(35.1457, 33.9071); // Coordinates for marker location

  Set<Marker> markers = {
    Marker(
      markerId: MarkerId('marker_1'),
      position: LatLng(35.1457, 33.9071), // Coordinates for marker location
      infoWindow: InfoWindow(
        title: 'Container Area',
        snippet: 'Glass Container',
      ),
    ),
    Marker(
      markerId: MarkerId('marker_2'),
      position: LatLng(35.141698818730546, 33.90217148488927), // Coordinates for marker location
      infoWindow: InfoWindow(
        title: 'Container Area',
        snippet: 'Metal Container',
      ),
    ),
    Marker(
      markerId: MarkerId('marker_3'),
      position: LatLng(35.1450652238407, 33.90509910700379), // Coordinates for marker location
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
        backgroundColor: Colors.green[800],
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
