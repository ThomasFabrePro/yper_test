import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yper_test/constants.dart';
import 'package:yper_test/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "SplashScreen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<PermissionStatus> getLocationPermission() async {
    //?délai pour présenter le splash screen
    await Future.delayed(const Duration(seconds: 2));
    var status = await Permission.location.request();
    return status;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          //?contrainte de taille pour limiter la taille de l'écran en web
          constraints: const BoxConstraints(
            maxWidth: 800,
          ),
          child: FutureBuilder(
            future: getLocationPermission(),
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return const ErrorSplash();
                } else if (snapshot.hasData) {
                  if (snapshot.data == PermissionStatus.granted) {
                    return const HomeScreen();
                  } else {
                    return const ErrorSplash();
                  }
                }
              }
              return const WaitingSplash();
            },
          ),
        ),
      ),
    );
  }
}

class WaitingSplash extends StatelessWidget {
  const WaitingSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
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
      ),
    );
  }
}

class ErrorSplash extends StatelessWidget {
  const ErrorSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Veuillez accepter la localisation',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: mainColor,
          ),
        ),
      ),
    );
  }
}
