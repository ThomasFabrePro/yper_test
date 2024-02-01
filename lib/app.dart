import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yper_test/screens/home_screen.dart';
import 'package:yper_test/screens/splash_screen.dart';

GoRouter router() {
  return GoRouter(
    initialLocation: '/${HomeScreen.routeName}',
    // initialLocation: '/${SplashScreen.routeName}',
    routes: [
      GoRoute(
        path: '/${SplashScreen.routeName}',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/${HomeScreen.routeName}',
        builder: (context, state) => const HomeScreen(),
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
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.white,
        ),
      ),
      routerConfig: router(),
    );
  }
}
