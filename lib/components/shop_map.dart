import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShopMap extends StatefulWidget {
  final double lat;
  final double lng;
  const ShopMap({super.key, required this.lat, required this.lng});

  @override
  State<ShopMap> createState() => _ShopMapState();
}

class _ShopMapState extends State<ShopMap> {
  @override
  void dispose() {
    _controller.future.then((value) => value.dispose());
    super.dispose();
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  final double cameraLatOffSet = -0.003500;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // constraints: const BoxConstraints(maxHeight: 600),
      child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
            target: LatLng(widget.lat + cameraLatOffSet, widget.lng),
            zoom: 15.4746,
          ),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: {
            Marker(
              markerId: const MarkerId("shop"),
              position: LatLng(widget.lat, widget.lng),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueCyan),
            )
          }),
    );
  }
}
