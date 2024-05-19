import 'package:flutter/material.dart';
import 'package:yper_test/constants.dart';

class WaitingSplash extends StatelessWidget {
  const WaitingSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //?SizedBox pour ajouter un espace entre les éléments comme sur la maquette
          SizedBox(),
          Text(
            'shop it',
            style: TextStyle(
              fontSize: 56,
              fontWeight: FontWeight.bold,
              color: mainColor,
            ),
          ),
          CircularProgressIndicator(
            color: mainColor,
          )
        ],
      ),
    );
  }
}
