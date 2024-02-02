import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yper_test/providers/location_provider.dart';

class LocationListTile extends StatelessWidget {
  const LocationListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocationProvider>(
        builder: (context, locationProvider, child) {
      return ListView.builder(
          itemCount: locationProvider.nearestYperShops.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  title: Text(locationProvider.nearestYperShops[index].name),
                  subtitle: Text(
                      locationProvider.nearestYperShops[index].fullAddress),
                ),
                const Divider()
              ],
            );
          });
    });

    // ListView.builder(
    //     itemCount: 12,
    //     itemBuilder: (context, index) {
    //       return Column(
    //         children: [
    //           ListTile(
    //             title: Text("Location $index"),
    //             subtitle: Text("Adresse $index"),
    //           ),
    //           const Divider()
    //         ],
    //       );
    //     });
  }
}
