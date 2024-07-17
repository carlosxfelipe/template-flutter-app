import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

import 'package:template/screens.dart';
import 'package:template/widgets.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => NoTransitionPage(
          child: const CustomBottomBar(currentIndex: 0, child: HomeScreen()),
        ),
        routes: [
          GoRoute(
            path: 'home',
            pageBuilder: (context, state) => NoTransitionPage(
              child:
                  const CustomBottomBar(currentIndex: 0, child: HomeScreen()),
            ),
          ),
          GoRoute(
            path: 'profile',
            pageBuilder: (context, state) => NoTransitionPage(
              child: const CustomBottomBar(
                  currentIndex: 1, child: ProfileScreen()),
            ),
          ),
          GoRoute(
            path: 'favorites',
            pageBuilder: (context, state) => NoTransitionPage(
              child: const CustomBottomBar(
                  currentIndex: 2, child: FavoritesScreen()),
            ),
          ),
          GoRoute(
            path: 'cart',
            pageBuilder: (context, state) => NoTransitionPage(
              child:
                  const CustomBottomBar(currentIndex: 3, child: CartScreen()),
            ),
          ),
          GoRoute(
            path: 'store',
            pageBuilder: (context, state) => NoTransitionPage(
              child:
                  const CustomBottomBar(currentIndex: 4, child: StoreScreen()),
            ),
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(),
      ),
    );
  }
}

class NoTransitionPage extends CustomTransitionPage {
  NoTransitionPage({required super.child})
      : super(
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child;
          },
        );
}
