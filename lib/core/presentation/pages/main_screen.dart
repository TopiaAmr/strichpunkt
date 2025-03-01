import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:strichpunkt/core/theme/app_theme.dart';
import 'package:strichpunkt/core/util/app_router.gr.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        HomeRoute(),
        HomeRoute(),
        UserProfileRoute(),
        SettingsRoute(),
      ],
      lazyLoad: true,
      resizeToAvoidBottomInset: true,
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          type: BottomNavigationBarType.fixed,
          enableFeedback: false,
          elevation: 0,
          items: [
            _buildNavItem('Medication', tabsRouter.activeIndex == 0),
            _buildNavItem('Consult', tabsRouter.activeIndex == 1),
            _buildNavItem('Add', tabsRouter.activeIndex == 2),
            _buildNavItem('Profiles', tabsRouter.activeIndex == 3),
            _buildNavItem('More', tabsRouter.activeIndex == 4),
          ],
        );
      },
    );
  }

  BottomNavigationBarItem _buildNavItem(String label, bool isSelected) {
    return BottomNavigationBarItem(
      label: label,
      icon: _buildIcon(label.toLowerCase(), isSelected),
    );
  }

  Widget _buildIcon(String label, bool isSelected) {
    final Color color =
        isSelected ? AppTheme.navActiveColor : AppTheme.navInactiveColor;

    // Map label to icon path
    String iconPath;
    switch (label) {
      case 'medication':
        iconPath = 'assets/icons/medication.svg';
        break;
      case 'consult':
        iconPath = 'assets/icons/consult.svg';
        break;
      case 'add':
        iconPath = 'assets/icons/add.svg';
        break;
      case 'profiles':
        iconPath = 'assets/icons/profiles.svg';
        break;
      case 'more':
        iconPath = 'assets/icons/more.svg';
        break;
      default:
        // Fallback to material icons if SVG not available
        return Icon(_getFallbackIcon(label), color: color);
    }

    // Try to load SVG, fallback to material icon if not found
    try {
      return SvgPicture.asset(
        iconPath,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        height: 24,
        width: 24,
      );
    } catch (e) {
      // If SVG loading fails, use fallback icon
      return Icon(_getFallbackIcon(label), color: color);
    }
  }

  IconData _getFallbackIcon(String label) {
    switch (label) {
      case 'medication':
        return Icons.medication_outlined;
      case 'consult':
        return Icons.calendar_today_outlined;
      case 'add':
        return Icons.add_circle_outline;
      case 'profiles':
        return Icons.people_outline;
      case 'more':
        return Icons.apps_outlined;
      default:
        return Icons.circle_outlined;
    }
  }
}
