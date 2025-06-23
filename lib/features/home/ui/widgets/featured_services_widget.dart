import 'package:flutter/material.dart';
import 'package:xgenious_task/features/home/data/models/featured_service_model.dart';

import '../../../../app/app_colors.dart';

class FeaturedServiceWidget extends StatelessWidget {
  final FeaturedServiceModel serviceModel;
  const FeaturedServiceWidget({super.key, required this.serviceModel});

  @override
  Widget build(BuildContext context) {
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
                      serviceModel.image,
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
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Rating row
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 18),
                        const SizedBox(width: 4),
                        Text(
                          serviceModel.rating.toString(),
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
                          serviceModel.category,
                          style: TextStyle(color: AppColors.subColor),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    // Title
                    Text(
                      serviceModel.title,
                      style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),
                    ),

                    const SizedBox(height: 8),

                    // Price
                    Row(
                      children: [
                        Text(
                          '\$${serviceModel.price.toString()}',
                          style: TextStyle(
                            color: AppColors.themeColor2,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '\$${serviceModel.discountPrice.toString()}',
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
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundImage: serviceModel.providerImage != null
                              ? NetworkImage(serviceModel.providerImage!)
                              : const AssetImage('assets/placeholder_img.png')
                                    as ImageProvider,
                        ),
                        SizedBox(width: 8),
                        Text(
                          serviceModel.providerName ?? "Unknown",
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
  }
}
