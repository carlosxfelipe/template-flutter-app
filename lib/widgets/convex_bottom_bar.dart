import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ConvexBottomBar extends StatelessWidget {
  final int currentIndex;
  final Widget child;

  const ConvexBottomBar({
    super.key,
    required this.currentIndex,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,
        // elevation: 0,
        // curveSize: 0,
        backgroundColor: Colors.white,
        activeColor: Colors.black,
        color: Colors.black,
        initialActiveIndex: currentIndex,
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
          TabItem(icon: Icons.home, title: 'Início'),
          TabItem(icon: Icons.person, title: 'Perfil'),
          TabItem(icon: Icons.favorite, title: 'Favoritos'),
          TabItem(icon: Icons.shopping_cart_outlined, title: 'Carrinho'),
          TabItem(icon: Icons.shopping_bag, title: 'Loja'),
        ],
      ),
    );
  }
}
