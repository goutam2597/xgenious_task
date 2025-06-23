import 'package:flutter/material.dart';
import 'package:xgenious_task/features/home/data/models/category_model.dart';

import '../../../../app/app_colors.dart';

class CategoryWidget extends StatelessWidget {
  final List<CategoryModel> categories;


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
                      Container(
                        height: 64,
                        width: 64,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.borderColor),
                        ),
                        child: Image.network(
                          category.image
                        ),
                      ),
                      SizedBox(height: 4,),
                      Text(
                        category.name.length > 10 ? '${category.name.substring(0, 6)}...' : category.name,
                        style: TextStyle(
                          color: AppColors.subColor,
                          fontWeight: FontWeight.w500,
                        ),
                      )

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
