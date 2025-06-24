import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xgenious_task/app/app_colors.dart';
import 'package:xgenious_task/features/home/ui/widgets/header_widget.dart';
import 'package:xgenious_task/features/home/ui/widgets/slider_list_widget.dart';
import 'package:xgenious_task/services/network_controller.dart';

import '../widgets/category_widget.dart';
import '../widgets/featured_services_widget.dart';
import '../widgets/home_screen_header_widget.dart';
import '../widgets/service_provider_widget.dart';

/// Home screen displaying categories, featured services, sliders,
/// service providers, and a job posting section.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NetworkController());

    return Scaffold(
      body: Column(
        children: [
          HomeScreenHeaderWidget(),
          Expanded(
            child: Obx(() {
              // Reactive UI update when data changes
              if (controller.featuredServices.isEmpty || controller.categories.isEmpty) {
                return Center(child: CircularProgressIndicator()); // Loading state
              }

              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 8),
                    /// Category section
                    HeaderWidget(title: 'Categories', onTap: (){}),
                    CategoryWidget(categories: controller.categories),
                    SizedBox(height: 24),
                    Divider(thickness: 10, color: AppColors.dividerColor),
                    /// Featured services section
                    HeaderWidget(title: 'Featured services', onTap: (){}),
                    SizedBox(
                      height: 354,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: ListView.builder(
                          itemCount: controller.featuredServices.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return FeaturedServiceWidget(
                              serviceModel: controller.featuredServices[index],
                            );
                          },
                        ),
                      ),
                    ),

                    Divider(thickness: 10, color: AppColors.dividerColor),
                    SizedBox(height: 16),

                    /// Slider list section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: SliderListWidget(sliders: controller.sliders),
                    ),

                    SizedBox(height: 8),
                    Divider(thickness: 10, color: AppColors.dividerColor),

                    /// Service providers List Section
                    HeaderWidget(title: 'Provider List', onTap: (){}),
                    SizedBox(
                      height: 140,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.providers.length,
                          itemBuilder: (context, index) {
                            return ServiceProviderWidget(
                              provider: controller.providers[index],
                            );
                          },
                        ),
                      ),
                    ),

                    SizedBox(height: 24),
                    Divider(thickness: 10, color: AppColors.dividerColor),
                    SizedBox(height: 24),

                    /// Job post CTA section
                    Image.asset('assets/images/finding.png'),
                    SizedBox(height: 24),
                    Text(
                      'Post a Job',
                      style: TextStyle(
                        color: AppColors.headingColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Didn’t find what you’re looking for?',
                      style: TextStyle(color: AppColors.subColor),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: ElevatedButton(
                        onPressed: () {}, // Add functionality as needed
                        child: Text('Post a Job'),
                      ),
                    ),
                    SizedBox(height: 24),
                    Divider(thickness: 10, color: AppColors.dividerColor),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
