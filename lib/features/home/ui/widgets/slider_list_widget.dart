import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../data/models/slider_list_model.dart';

/// A widget that displays a carousel slider of images
class SliderListWidget extends StatefulWidget {
  final List<SliderListModel> sliders;

  const SliderListWidget({super.key, required this.sliders});

  @override
  State<SliderListWidget> createState() => _SliderListWidgetState();
}

class _SliderListWidgetState extends State<SliderListWidget> {
  int _currentIndex = 0;

  final CarouselSliderController _carouselController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Carousel slider widget
        CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
            height: 160.0,
            viewportFraction: 1,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: widget.sliders.map((s) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: s.image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            );
          }).toList(),
        ),

        const SizedBox(height: 12),

        /// Dot indicators below the slider
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.sliders.asMap().entries.map((entry) {
            bool isActive = _currentIndex == entry.key;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              width: isActive ? 20.0 : 8.0,
              height: 8.0,
              decoration: BoxDecoration(
                color: isActive ? Colors.blue : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
