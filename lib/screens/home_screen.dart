import 'package:flutter/material.dart';
import 'package:yper_test/components/location_list_tile.dart';
import 'package:yper_test/components/search_shop_box.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      children: [
        SearchShopBox(),
        Expanded(child: LocationListTile()),
      ],
    ));
  }
}
