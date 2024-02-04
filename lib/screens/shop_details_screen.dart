import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yper_test/constants.dart';
import 'package:yper_test/models/delivery_hour.dart';
import 'package:yper_test/models/shop.dart';

class ShopDetailsScreen extends StatelessWidget {
  static const String routeName = "ShopDetailsScreen";
  final Shop shop;
  const ShopDetailsScreen({super.key, required this.shop});

  TextStyle configDeliveryHourTextStyle(
      DateTime actualDay, DeliveryHour deliveryHour) {
    //!Bonus
    DateTime now = DateTime.now();
    FontWeight fontWeight = FontWeight.normal;
    Color color = black60;
    if (deliveryHour.day == now.weekday) {
      fontWeight = FontWeight.bold;
      bool isOpenNow = deliveryHour.isOpenNow(actualDay);
      if (isOpenNow) {
        color = mainColor;
      } else {
        color = Colors.red;
      }
    }

    return TextStyle(fontSize: 12, color: color, fontWeight: fontWeight);
  }

  List<Widget> _buildDeliveryHours() {
    List<Widget> deliveryHours = <Widget>[];
    DateTime today = DateTime.now();
    for (var deliveryHour in shop.deliveryHours) {
      TextStyle deliveryHourTextStyle =
          configDeliveryHourTextStyle(today, deliveryHour);
      deliveryHours.add(
        Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(deliveryHour.dayName, style: deliveryHourTextStyle),
              Text(deliveryHour.deliveryHours, style: deliveryHourTextStyle),
            ],
          ),
        ),
      );
    }
    return deliveryHours;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Stack(
        children: [
          ShopMap(
            lat: shop.latitude,
            lng: shop.longitude,
          ),
          // DraggableScrollableSheet(
          //   // initialChildSize: 0.4,
          //   minChildSize: 0.2,
          //   maxChildSize: 0.6,
          //   builder: (BuildContext context, ScrollController scrollController) {
          //     return Container(
          //         padding: const EdgeInsets.all(16),
          //         decoration: const BoxDecoration(
          //           color: Colors.white,
          //           borderRadius: BorderRadius.only(
          //             topRight: Radius.circular(40),
          //             topLeft: Radius.circular(40),
          //           ),
          //         ),
          //         child: SingleChildScrollView(
          //           controller: scrollController,
          //           child: Column(
          //             children: [
          //               Text(shop.name,
          //                   style: const TextStyle(
          //                     fontSize: 20,
          //                     fontWeight: FontWeight.bold,
          //                   )),
          //               const Divider(
          //                 color: mainColor,
          //                 thickness: 5.47,
          //                 indent: 150,
          //                 endIndent: 150,
          //                 height: 50,
          //               ),
          //               Text(
          //                 "${shop.street},\n${shop.zip} ${shop.city}",
          //                 textAlign: TextAlign.center,
          //                 style: const TextStyle(fontSize: 14, color: black60),
          //               ),
          //               const SizedBox(
          //                 height: 10,
          //               ),
          //               Row(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: [
          //                   const Icon(
          //                     Icons.phone,
          //                     color: mainColor,
          //                   ),
          //                   Text(shop.publicPhone,
          //                       style: const TextStyle(
          //                           fontSize: 14,
          //                           color: mainColor,
          //                           fontWeight: FontWeight.bold)),
          //                 ],
          //               ),
          //               const Divider(
          //                 height: 30,
          //                 color: Color.fromARGB(255, 212, 220, 227),
          //               ),
          //               const Align(
          //                   alignment: Alignment.centerLeft,
          //                   child: Text(
          //                     "Horaires d'ouverture",
          //                     style: TextStyle(
          //                       fontSize: 14,
          //                       fontWeight: FontWeight.bold,
          //                     ),
          //                   )),
          //               //! faire un widget à part pour les horaires
          //               ..._buildDeliveryHours()
          //             ],
          //           ),
          //         ));
          //   },
          // ),
        ],
      ),
    );
  }
}

class ShopMap extends StatefulWidget {
  final double lat;
  final double lng;
  const ShopMap({super.key, required this.lat, required this.lng});

  @override
  State<ShopMap> createState() => _ShopMapState();
}

class _ShopMapState extends State<ShopMap> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  // final  CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(widget.lat, -122.08832357078792),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
            target: LatLng(widget.lat, widget.lng),
            zoom: 14.4746,
          ),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: {
            Marker(
              markerId: MarkerId("shop"),
              position: LatLng(widget.lat, widget.lng),
            )
          }),
    );
  }
}
