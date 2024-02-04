import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yper_test/constants.dart';
import 'package:yper_test/models/shop.dart';
import 'package:yper_test/screens/home_screen.dart';
import 'package:yper_test/screens/shop_details_screen.dart';
import 'package:yper_test/screens/splash_screen.dart';

GoRouter router() {
  return GoRouter(
    initialLocation: '/${SplashScreen.routeName}',
    routes: [
      GoRoute(
        path: '/${SplashScreen.routeName}',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/${HomeScreen.routeName}',
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: ShopDetailsScreen.routeName,
            builder: (context, state) {
              final shop = state.extra as Shop;
              return ShopDetailsScreen(shop: shop);
            },
          ),
        ],
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
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: black87),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.white,
        ),
      ),
      routerConfig: router(),
    );
  }
}
