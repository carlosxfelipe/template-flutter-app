import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
