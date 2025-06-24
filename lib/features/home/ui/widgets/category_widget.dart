import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:xgenious_task/features/home/data/models/category_model.dart';

import '../../../../app/app_colors.dart';

/// A widget that displays a horizontally scrollable list of category items.
class CategoryWidget extends StatelessWidget {
  final List<CategoryModel> categories;

  /// Constructor requiring a list of categories to render
  const CategoryWidget({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16),
      child: Column(
        children: [
          SizedBox(
            height: 88,
            child: ListView.builder(
              itemCount: categories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final category = categories[index];

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      // Circular icon/image container for category
                      Container(
                        height: 64,
                        width: 64,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.borderColor),
                        ),
                        child: CachedNetworkImage(imageUrl: category.image),
                      ),
                      SizedBox(height: 4),
                      // Display truncated category name if too long
                      Text(
                        category.name.length > 10
                            ? '${category.name.substring(0, 6)}...'
                            : category.name,
                        style: TextStyle(
                          color: AppColors.subColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
