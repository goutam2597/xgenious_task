import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../../app/app_colors.dart';

class SliderListWidget extends StatefulWidget {
  const SliderListWidget({super.key});

  @override
  State<SliderListWidget> createState() => _SliderListWidgetState();
}

class _SliderListWidgetState extends State<SliderListWidget> {
  final List<String> imageUrls = [
    'https://prohandy.xgenious.com/assets/uploads/media-uploader/frame-377341738235271.png',
    'https://prohandy.xgenious.com/assets/uploads/media-uploader/frame-377341738235271.png',
    'https://prohandy.xgenious.com/assets/uploads/media-uploader/frame-377341738235271.png',
  ];

  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);

  @override
  void dispose() {
    _selectedIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: imageUrls.length,
          itemBuilder: (context, index, realIndex) {
            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  imageUrls[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: 150,
            autoPlay: true,
            viewportFraction: 0.9,
            enlargeCenterPage: false,
            enableInfiniteScroll: true,
            padEnds: false,
            onPageChanged: (index, reason) {
              _selectedIndex.value = index;
            },
          ),
        ),
        const SizedBox(height: 12),
        ValueListenableBuilder<int>(
          valueListenable: _selectedIndex,
          builder: (context, value, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < imageUrls.length; i++)
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: value == i ? 24 : 10,
                    height: 10,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: value == i
                          ? AppColors.themeColor
                          : AppColors.dotsColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.dotsColor),
                    ),
                  ),
              ],
            );
          },
        )

      ],
    );
  }
}
