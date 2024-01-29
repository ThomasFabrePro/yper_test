import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yper_test/screens/splash_screen.dart';

//nom de toutes les routes de l'application
enum AppRoute { splash, login, home }

GoRouter router() {
  return GoRouter(
    initialLocation: '/${AppRoute.splash.name}',
    routes: [
      GoRoute(
        path: '/${AppRoute.splash.name}',
        builder: (context, state) => const SplashScreen(),
      ),
    ],
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Rubik',
      ),
      routerConfig: router(),
    );
  }
}
