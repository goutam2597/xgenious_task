import 'package:flutter/material.dart';
import 'package:xgenious_task/app/app_colors.dart';
import 'package:xgenious_task/features/home/ui/widgets/slider_list_widget.dart';

import '../widgets/category_widget.dart';
import '../widgets/featured_services_widget.dart';
import '../widgets/home_screen_header_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HomeScreenHeaderWidget(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 24),
                  CategoryWidget(),
                  SizedBox(height: 24),
                  Divider(thickness: 10, color: AppColors.dividerColor),
                  SizedBox(height: 24),
                  SizedBox(height: 350, child: FeaturedServiceWidget()),
                  Divider(thickness: 10, color: AppColors.dividerColor),
                  SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: SliderListWidget(),
                  ),
                  SizedBox(height: 24),
                  Divider(thickness: 10, color: AppColors.dividerColor),
                  SizedBox(height: 24),
                  SizedBox(height: 300),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
