import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yper_test/models/delivery_hour.dart';
import 'package:yper_test/models/shop.dart';
import 'package:yper_test/theme/app_theme.dart';

class ShopDetailsScreen extends StatelessWidget {
  static const String routeName = "ShopDetailsScreen";
  final Shop shop;
  const ShopDetailsScreen({super.key, required this.shop});

  List<Widget> _buildDeliveryHours() {
    List<Widget> deliveryHours = [];
    for (var deliveryHour in shop.deliveryHours) {
      deliveryHours.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(deliveryHour.dayName),
            Text(deliveryHour.deliveryHours),
          ],
        ),
      );
    }
    return deliveryHours;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.mainColor,
      appBar: AppBar(
        backgroundColor: AppTheme.mainColor,
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
      body: DraggableScrollableSheet(
        // expand: false,
        minChildSize: 0.2,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    Text(shop.name),
                    const Divider(),
                    Text(
                      "${shop.street},\n${shop.zip} ${shop.city}",
                      textAlign: TextAlign.center,
                    ),
                    Text(shop.publicPhone),
                    const Divider(),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Horaires d'ouverture"),
                    ),
                    ..._buildDeliveryHours()
                  ],
                ),
              ));
        },
      ),
    );
  }
}
