import 'package:template/main.dart';
import 'package:flutter/material.dart';
import 'package:template/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Colors.white,
      drawer: CustomDrawer(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Perfil",
            style: TextStyle(fontSize: 17),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
