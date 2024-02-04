import 'package:flutter/material.dart';
import 'package:yper_test/constants.dart';
import 'package:yper_test/models/delivery_hour.dart';

class ShopDeliveryHours extends StatefulWidget {
  final List<DeliveryHour> deliveryHours;
  const ShopDeliveryHours({super.key, required this.deliveryHours});

  @override
  State<ShopDeliveryHours> createState() => _ShopDeliveryHoursState();
}

class _ShopDeliveryHoursState extends State<ShopDeliveryHours> {
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
    for (var deliveryHour in widget.deliveryHours) {
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
    //?Dans une colonne pour êter plus facilement réexplloitable
    return Column(
      children: [
        ..._buildDeliveryHours(),
      ],
    );
  }
}
