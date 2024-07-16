import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

import 'package:template/screens.dart';

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

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: TextField(
        decoration: InputDecoration(
          hintText: "Pesquisar...",
          hintStyle: GoogleFonts.poppins(
            color: Colors.grey,
            fontSize: 16,
          ),
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
      elevation: 0,
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_outlined),
          onPressed: () {
            // Ação para o ícone de notificações
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  static const Color iconColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: iconColor),
            title: const Text('Início'),
            onTap: () {
              GoRouter.of(context).go('/home');
            },
          ),
          ListTile(
            leading: const Icon(Icons.person, color: iconColor),
            title: const Text('Perfil'),
            onTap: () {
              GoRouter.of(context).go('/profile');
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite, color: iconColor),
            title: const Text('Favoritos'),
            onTap: () {
              GoRouter.of(context).go('/favorites');
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart_outlined, color: iconColor),
            title: const Text('Carrinho'),
            onTap: () {
              GoRouter.of(context).go('/cart');
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_bag, color: iconColor),
            title: const Text('Loja'),
            onTap: () {
              GoRouter.of(context).go('/store');
            },
          ),
        ],
      ),
    );
  }
}

class CustomBottomBar extends StatelessWidget {
  final int currentIndex;
  final Widget child;

  const CustomBottomBar({
    super.key,
    required this.currentIndex,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          currentIndex: currentIndex,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            switch (index) {
              case 0:
                GoRouter.of(context).go('/home');
                break;
              case 1:
                GoRouter.of(context).go('/profile');
                break;
              case 2:
                GoRouter.of(context).go('/favorites');
                break;
              case 3:
                GoRouter.of(context).go('/cart');
                break;
              case 4:
                GoRouter.of(context).go('/store');
                break;
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Início',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Perfil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favoritos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'Carrinho',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'Loja',
            ),
          ],
        ),
      ),
    );
  }
}
