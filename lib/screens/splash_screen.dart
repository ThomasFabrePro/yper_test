import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yper_test/components/splash_screen_components/error_splash.dart';
import 'package:yper_test/components/splash_screen_components/waiting_splash.dart';
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
    );
  }
}
