import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'images/imagen1.webp',
  'images/imagen2.webp',
  'images/imagen3.webp'
];

class CarouselWithIndicatorDemo extends StatefulWidget {
  const CarouselWithIndicatorDemo({super.key});

  @override
  State<CarouselWithIndicatorDemo> createState() => _CarouselWithIndicatorDemoState();
}

class _CarouselWithIndicatorDemoState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column( children: [
      CarouselSlider(
        items: imgList.
          map((item) => Container(
            child: Center(child: Image.asset(item.toString())),
          )).toList(), 
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          aspectRatio: 2.0,
          onPageChanged:(index, reason) {
            setState(() {
              _current = index;
            });
          }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.map((url) {
            int index = imgList.indexOf(url);
            return Container(
              width: 8.0,
              height: 8.0,
              margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index 
                  ? const Color.fromRGBO(0, 0, 0, 0.1) 
                  : const Color.fromRGBO(0, 0, 0, 0.4),
              ),
            );
          }).toList(), 
        ),
    ]);
  }
}