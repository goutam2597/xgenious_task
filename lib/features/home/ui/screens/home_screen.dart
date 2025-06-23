import 'package:flutter/material.dart';
import 'package:xgenious_task/app/app_colors.dart';
import 'package:xgenious_task/features/home/ui/widgets/slider_list_widget.dart';

import '../widgets/category_widget.dart';
import '../widgets/featured_services_widget.dart';
import '../widgets/home_screen_header_widget.dart';
import '../widgets/service_provider_widget.dart';

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
                  FeaturedServiceWidget(),
                  Divider(thickness: 10, color: AppColors.dividerColor),
                  SizedBox(height: 24),
                  SliderListWidget(),
                  SizedBox(height: 24),
                  Divider(thickness: 10, color: AppColors.dividerColor),
                  SizedBox(height: 24),
                  ServiceProviderWidget(),
                  SizedBox(height: 24),
                  Divider(thickness: 10, color: AppColors.dividerColor),
                  SizedBox(height: 24),
                  Image.asset('assets/images/finding.png'),
                  SizedBox(height: 24),
                  Text('Post a Job',style: TextStyle(color: AppColors.headingColor,fontWeight: FontWeight.w600,fontSize: 18),),
                  SizedBox(height: 4),
                  Text('Didn’t find what you’re looking for?',style: TextStyle(color: AppColors.subColor)),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: ElevatedButton(onPressed: (){}, child:  Text('Post a Job')),
                  ),
                  SizedBox(height: 24),
                  Divider(thickness: 10, color: AppColors.dividerColor),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}