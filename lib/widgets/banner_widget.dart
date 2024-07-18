import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class BannerWidget extends StatelessWidget {
  final List<String> images = [
    'assets/images/pexels-janetrangdoan-1128678.jpg',
    'assets/images/pexels-rauf-allahverdiyev-561368-1367243.jpg',
    'assets/images/pexels-sotiris-gkolias-331160-927802.jpg',
  ];

  BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
        loop: true, 
        viewportFraction: 0.8,
        scale: 0.9,
        autoplay: true,
        pagination: const SwiperPagination(
          margin: EdgeInsets.only(top: 0),
          builder: DotSwiperPaginationBuilder(
            activeColor: Colors.blue,
            color: Colors.grey,
          ),
        ),
        itemCount: images.length,
        itemBuilder: (context, index) => _Slide(imagePath: images[index]),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String imagePath;

  const _Slide({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: Colors.black45,
          blurRadius: 10,
          offset: Offset(0, 10),
        ),
      ],
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: GestureDetector(
            onTap: () {
              // Ação ao clicar na imagem, se necessário
            },
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
