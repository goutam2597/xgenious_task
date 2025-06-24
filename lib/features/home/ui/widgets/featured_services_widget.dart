import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:xgenious_task/features/home/data/models/featured_service_model.dart';

import '../../../../app/app_colors.dart';

/// A widget that displays a card-style featured service with image,

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
              /// Image banner with favorite icon overlay
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: serviceModel.image,
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

              /// Service details
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Rating and category info
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.orange, size: 18),
                        const SizedBox(width: 4),
                        Text(
                          serviceModel.rating.toString(),
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          '·',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.subColor,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          '1 hr',
                          style: TextStyle(color: AppColors.subColor),
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          '·',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.subColor,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          serviceModel.category,
                          style: const TextStyle(color: AppColors.subColor),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    /// Title
                    Text(
                      serviceModel.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 8),

                    /// Price and discounted price
                    Row(
                      children: [
                        Text(
                          '\$${serviceModel.price}',
                          style: const TextStyle(
                            color: AppColors.themeColor2,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '\$${serviceModel.discountPrice}',
                          style: const TextStyle(
                            color: AppColors.subColor,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    /// Divider
                    const Divider(thickness: 1.2, color: AppColors.borderColor),

                    const SizedBox(height: 8),

                    /// Provider avatar and name
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundImage: serviceModel.providerImage != null
                              ? CachedNetworkImageProvider(serviceModel.providerImage!)
                              : const AssetImage('assets/placeholder_img.png')
                                    as ImageProvider,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          serviceModel.providerName ?? "Unknown",
                          style: const TextStyle(fontWeight: FontWeight.w600),
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
