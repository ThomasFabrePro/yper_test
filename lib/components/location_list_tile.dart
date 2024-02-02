import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:yper_test/models/shop.dart';
import 'package:yper_test/providers/location_provider.dart';
import 'package:yper_test/screens/home_screen.dart';
import 'package:yper_test/screens/shop_details_screen.dart';
import 'package:yper_test/theme/app_theme.dart';

class LocationListTile extends StatelessWidget {
  const LocationListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Consumer<LocationProvider>(
          builder: (context, locationProvider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            locationProvider.nearestYperShops.isNotEmpty
                ? const Text("LE PLUS PROCHE",
                    style: TextStyle(
                      letterSpacing: 1.5,
                      color: AppTheme.mainColor,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ))
                : const SizedBox(),
            Expanded(
              child: ListView.builder(
                  itemCount: locationProvider.nearestYperShops.length,
                  itemBuilder: (context, index) {
                    Shop shop = locationProvider.nearestYperShops[index];
                    return GestureDetector(
                      onTap: () {
                        context.go(
                            '/${HomeScreen.routeName}/${ShopDetailsScreen.routeName}',
                            extra: shop);
                      },
                      child: Column(
                        children: [
                          ListTile(
                            minVerticalPadding: 0,
                            contentPadding: const EdgeInsets.all(0),
                            title: Text(
                              shop.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            subtitle: Text(
                              shop.fullAddress,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const Divider()
                        ],
                      ),
                    );
                  }),
            ),
          ],
        );
      }),
    );
  }
}
