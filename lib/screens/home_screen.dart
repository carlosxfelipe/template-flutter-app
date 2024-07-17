import 'package:template/main.dart';
import 'package:flutter/material.dart';
import 'package:template/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<String> items = List.generate(10, (index) => 'Item $index');

  void _loadMoreItems() {
    setState(() {
      items
          .addAll(List.generate(10, (index) => 'Item ${items.length + index}'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: Colors.white,
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BannerWidget(),
                  SizedBox(height: 16),
                  WelcomeText(),
                  SizedBox(height: 8),
                  DescriptionText(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: HorizontalCardList(
                items: items,
                loadMoreItems: _loadMoreItems,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Center(
        child: Text(
          'Banner Temporário',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Bem-vindo à tela de Início!',
      style: TextStyle(fontSize: 17),
    );
  }
}

class DescriptionText extends StatelessWidget {
  const DescriptionText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Aute et est ullamco commodo culpa exercitation ea aliquip.',
      style: TextStyle(fontSize: 17),
      textAlign: TextAlign.justify,
    );
  }
}

class HorizontalCardList extends StatelessWidget {
  final List<String> items;
  final VoidCallback loadMoreItems;

  const HorizontalCardList({
    required this.items,
    required this.loadMoreItems,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
            loadMoreItems();
            return true;
          }
          return false;
        },
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    items[index],
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
