import 'package:flutter/material.dart';
import 'package:yper_test/constants.dart';

class ErrorSplash extends StatelessWidget {
  const ErrorSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Veuillez accepter la localisation',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: mainColor,
        ),
      ),
    );
  }
}
