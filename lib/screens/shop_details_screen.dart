import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yper_test/components/shop_details_draggable_sheet.dart';
import 'package:yper_test/components/shop_map.dart';
import 'package:yper_test/models/shop.dart';

class ShopDetailsScreen extends StatelessWidget {
  static const String routeName = "ShopDetailsScreen";
  final Shop shop;
  const ShopDetailsScreen({super.key, required this.shop});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            //Délai pour éviter la potentielle erreur d'animation
            Future.delayed(const Duration(milliseconds: 100))
                .then((_) => context.pop());
          },
        ),
      ),
      body: Stack(
        children: [
          ShopMap(
            lat: shop.latitude,
            lng: shop.longitude,
          ),
          ShopDetailsDraggableSheet(shop: shop)
        ],
      ),
    );
  }
}
