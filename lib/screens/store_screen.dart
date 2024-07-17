import 'package:flutter/material.dart';
import 'package:template/widgets.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

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
            "Loja",
            style: TextStyle(fontSize: 17),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
