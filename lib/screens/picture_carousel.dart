import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageCarousel extends StatelessWidget {
  ImageCarousel({ super.key });

  final List<String> _images = [];
  
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(autoPlay: true),
      items: _images.map((image) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(4),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              )
            );
          },
        );
      }).toList()
    );
  }
}