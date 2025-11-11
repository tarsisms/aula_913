import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsPage extends StatefulWidget {
  final LatLng position;

  const GoogleMapsPage({super.key, required this.position});

  @override
  State<GoogleMapsPage> createState() => GoogleMapsPageState();
}

class GoogleMapsPageState extends State<GoogleMapsPage> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: CameraPosition(
          target: widget.position,
          zoom: 16,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
