import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:xgenious_task/app/app_colors.dart';
import '../../data/models/service_provider_model.dart';

/// A widget that displays a single service provider card with avatar,
class ServiceProviderWidget extends StatelessWidget {
  final ServiceProviderModel provider;

  const ServiceProviderWidget({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Container(
        height: 140,
        width: 140,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Profile image with rating badge below
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundImage: provider.image != null
                      ? CachedNetworkImageProvider(provider.image!)
                      : const AssetImage('assets/images/placeholder_img.png')
                  as ImageProvider,
                ),
                Positioned(
                  bottom: -4,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      height: 20,
                      width: 48,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.orange.shade50,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.star, size: 16, color: Colors.orange),
                          Text(
                            provider.rating.toString(),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            /// Provider name
            Text(
              provider.name,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 4),

            /// Service categories
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                maxLines: 1,
                provider.serviceCategories.isNotEmpty
                    ? provider.serviceCategories.map((e) => e.name).join(', ')
                    : 'Unknown',
                style: const TextStyle(
                  color: AppColors.subColor,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
