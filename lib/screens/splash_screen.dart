import 'package:flutter/material.dart';
import 'package:yper_test/theme/app_theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //
        child: ConstrainedBox(
          //?contrainte de taille pour limiter la taille de l'écran
          constraints: const BoxConstraints(
            maxWidth: 500,
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //?SizedBox pour ajouter un espace entre les éléments comme sur la maquette
              SizedBox(),
              Text(
                'shop it',
                style: TextStyle(
                    fontSize: 56,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.mainColor),
              ),
              CircularProgressIndicator(
                color: AppTheme.mainColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
