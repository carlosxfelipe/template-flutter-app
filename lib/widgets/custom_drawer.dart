import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

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
