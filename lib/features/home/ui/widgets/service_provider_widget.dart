import 'package:flutter/material.dart';
import 'package:xgenious_task/app/app_colors.dart';

import '../../data/models/service_provider_model.dart';

class ServiceProviderWidget extends StatelessWidget {
  final ServiceProviderModel provider;
  const ServiceProviderWidget({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
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
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundImage: provider.image != null
                      ? NetworkImage(provider.image!)
                      : const AssetImage('assets/images/placeholder_img.png') as ImageProvider,
                ),
                Positioned(
                  bottom: -4, // places the badge below the circle
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
                          Icon(Icons.star, size: 16, color: Colors.orange),
                          Text(
                            provider.rating.toString(),
                            style: TextStyle(
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
            SizedBox(height: 12),
            Text(provider.name, style: TextStyle(fontWeight: FontWeight.w600)),
            SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                maxLines: 1,
                provider.serviceCategories.isNotEmpty
                    ? provider.serviceCategories.map((e) => e.name).join(', ')
                    : 'Unknown',
                style: TextStyle(color: AppColors.subColor,overflow: TextOverflow.ellipsis),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
