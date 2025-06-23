import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class FeaturedServiceWidget extends StatelessWidget {
  const FeaturedServiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 24, right: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.borderColor),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 204,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image with wishlist
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(8),
                            child: Image.network(
                              'https://prohandy.xgenious.com/assets/uploads/media-uploader/iron-21730182877.jpeg',
                              height: 128,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Positioned(
                            top: 8,
                            right: 8,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                              child: Icon(Icons.favorite_border),
                            ),
                          ),
                        ],
                      ),

                      // Content
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 4,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Rating row
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 18,
                                ),
                                const SizedBox(width: 4),
                                const Text(
                                  '4.5',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '·',
                                  style: TextStyle(
                                    color: AppColors.subColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '1 hr',
                                  style: TextStyle(color: AppColors.subColor),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '·',
                                  style: TextStyle(
                                    color: AppColors.subColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Painting',
                                  style: TextStyle(color: AppColors.subColor),
                                ),
                              ],
                            ),

                            const SizedBox(height: 8),

                            // Title
                            const Text(
                              'Home Cleaning Services at Miami, FL',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),

                            const SizedBox(height: 8),

                            // Price
                            Row(
                              children: [
                                Text(
                                  '\$199',
                                  style: TextStyle(
                                    color: AppColors.themeColor2,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  '\$249',
                                  style: TextStyle(
                                    color: AppColors.subColor,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 8),

                            // Divider
                            Divider(thickness: 1.2, color: AppColors.borderColor),

                            const SizedBox(height: 8),

                            // Provider Info
                            Row(
                              children: const [
                                CircleAvatar(
                                  radius: 16,
                                  backgroundImage: NetworkImage(
                                    'https://prohandy.xgenious.com/assets/uploads/media-uploader/21485148971729773227.jpg',
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Robert Fox',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
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
