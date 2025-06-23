import 'package:flutter/material.dart';
import 'package:xgenious_task/app/app_theme_data.dart';

import '../features/home/ui/screens/bottom_nav_bar.dart';

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemeData.lightTheme,
      home: BottomNavBar()
    );
  }
}
