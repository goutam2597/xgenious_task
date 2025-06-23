import 'package:flutter/material.dart';
import 'package:xgenious_task/app/app_theme_data.dart';
import 'package:xgenious_task/features/home/ui/screens/home_screen.dart';

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemeData.lightTheme,
      home: HomeScreen(),
    );
  }
}
