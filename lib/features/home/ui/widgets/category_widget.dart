import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16),
      child: Column(
        children: [
          SizedBox(
            height: 88,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
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
                          'https://prohandy.xgenious.com/assets/uploads/media-uploader/group-11723267314.png',
                        ),
                      ),
                      SizedBox(height: 4,),
                      Text('Cleaning'),
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
