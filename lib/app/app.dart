import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xgenious_task/app/app_theme_data.dart';
import 'package:xgenious_task/features/home/ui/screens/splash_screen.dart';

import '../features/home/ui/screens/bottom_nav_bar.dart';

/// Entry point widget of the application
class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      theme: AppThemeData.lightTheme,
      home: SplashScreen(),
    );
  }
}
