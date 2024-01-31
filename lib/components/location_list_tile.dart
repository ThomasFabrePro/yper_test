import 'package:flutter/material.dart';

class LocationListTile extends StatelessWidget {
  const LocationListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                title: Text("Location $index"),
                subtitle: Text("Adresse $index"),
              ),
              const Divider()
            ],
          );
        });
  }
}
