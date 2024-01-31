import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yper_test/components/location_list_tile.dart';
import 'package:yper_test/components/search_shop_box.dart';

import 'package:yper_test/providers/location_provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "HomeScreen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => LocationProvider(),
        child: Builder(
          builder: (context) {
            return const Column(
              children: [
                SearchShopBox(),
                Expanded(child: LocationListTile()),
              ],
            );
          },
        ),
      ),
    );
  }
}
