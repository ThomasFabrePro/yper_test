import 'package:flutter/material.dart';
import 'package:yper_test/components/shop_delivery_hours.dart';
import 'package:yper_test/constants.dart';
import 'package:yper_test/models/shop.dart';

class ShopDetailsDraggableSheet extends StatelessWidget {
  final Shop shop;
  const ShopDetailsDraggableSheet({super.key, required this.shop});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      minChildSize: 0.23,
      maxChildSize: 0.6,
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
                  Text(shop.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  const Divider(
                    color: mainColor,
                    thickness: 5.47,
                    indent: 150,
                    endIndent: 150,
                    height: 50,
                  ),
                  Text(
                    "${shop.street},\n${shop.zip} ${shop.city}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 14, color: black60),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.phone,
                        color: mainColor,
                      ),
                      Text(shop.publicPhone,
                          style: const TextStyle(
                              fontSize: 14,
                              color: mainColor,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const Divider(
                    height: 30,
                    color: Color.fromARGB(255, 212, 220, 227),
                  ),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Horaires d'ouverture",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  ShopDeliveryHours(deliveryHours: shop.deliveryHours)
                ],
              ),
            ));
      },
    );
  }
}
