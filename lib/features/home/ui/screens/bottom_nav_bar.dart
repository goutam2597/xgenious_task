import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:xgenious_task/features/home/ui/screens/home_screen.dart';

/// A stateful widget that manages bottom navigation between core app sections.
class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;

  /// List of screen widgets associated with each bottom navigation item
  final List<Widget> _screens = [
    HomeScreen(),
    const Center(child: Text('Category')),
    const Center(child: Text('Chat')),
    const Center(child: Text('Jobs')),
    const Center(child: Text('Profile')),
  ];

  /// Colors used for selected and unselected states
  final Color selectedBgColor = const Color(0xFF1E88E5);
  final Color selectedTextColor = Colors.white;
  final Color unselectedColor = const Color(0xFF0A1D44);

  /// Returns styled text for bottom bar titles based on selection
  TextStyle navTextStyle(int index) => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: selectedIndex == index ? selectedTextColor : Colors.transparent,
  );

  /// Returns an SVG icon widget with appropriate color filter
  Widget navSvgIcon(String assetPath, int index) {
    return SvgPicture.asset(
      assetPath,
      width: 24,
      height: 24,
      colorFilter: ColorFilter.mode(
        selectedIndex == index ? selectedTextColor : unselectedColor,
        BlendMode.srcIn,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[selectedIndex], // Show the selected screen
      bottomNavigationBar: StylishBottomBar(
        currentIndex: selectedIndex,
        onTap: (index) => setState(() => selectedIndex = index), // Update tab
        option: BubbleBarOptions(
          barStyle: BubbleBarStyle.horizontal,
          bubbleFillStyle: BubbleFillStyle.fill,
          opacity: 1.0,
        ),
        items: [
          BottomBarItem(
            icon: navSvgIcon('assets/images/home.svg', 0),
            title: Text('HOME', style: navTextStyle(0)),
            backgroundColor: selectedBgColor,
          ),
          BottomBarItem(
            icon: navSvgIcon('assets/images/cat.svg', 1),
            title: Text('CATEGORY', style: navTextStyle(1)),
            backgroundColor: selectedBgColor,
          ),
          BottomBarItem(
            icon: navSvgIcon('assets/images/chat.svg', 2),
            title: Text('CHAT', style: navTextStyle(2)),
            backgroundColor: selectedBgColor,
          ),
          BottomBarItem(
            icon: navSvgIcon('assets/images/jobs.svg', 3),
            title: Text('JOBS', style: navTextStyle(3)),
            backgroundColor: selectedBgColor,
          ),
          BottomBarItem(
            icon: navSvgIcon('assets/images/user.svg', 4),
            title: Text('PROFILE', style: navTextStyle(4)),
            backgroundColor: selectedBgColor,
          ),
        ],
      ),
    );
  }
}
