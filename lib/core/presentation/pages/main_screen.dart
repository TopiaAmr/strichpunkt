import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:strichpunkt/core/enum/nav_item_enum.dart';
import 'package:strichpunkt/core/theme/app_theme.dart';
import 'package:strichpunkt/core/util/app_router.gr.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<NavItem> _navItems = [
    NavItem.medication,
    NavItem.consult,
    NavItem.add,
    NavItem.profiles,
    NavItem.more,
  ];

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
        return Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            type: BottomNavigationBarType.fixed,
            enableFeedback: true,
            elevation: 0,
            items:
                _navItems
                    .asMap()
                    .entries
                    .map(
                      (entry) => _buildNavItem(
                        entry.value,
                        tabsRouter.activeIndex == entry.key,
                      ),
                    )
                    .toList(),
          ),
        );
      },
    );
  }

  BottomNavigationBarItem _buildNavItem(NavItem item, bool isSelected) {
    return BottomNavigationBarItem(
      label: item.title,
      icon: _buildIcon(item, isSelected),
    );
  }

  Widget _buildIcon(NavItem item, bool isSelected) {
    final Color color =
        isSelected ? AppTheme.navActiveColor : AppTheme.navInactiveColor;

    // Try to load SVG, fallback to material icon if not found
    try {
      return Container(
        margin: EdgeInsets.only(bottom: 6.h),
        child: SvgPicture.asset(
          item.iconPath,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          height: 24.r,
          width: 24.r,
          fit: BoxFit.contain,
        ),
      );
    } catch (e) {
      // If SVG loading fails, use fallback icon
      return Icon(item.fallbackIcon, color: color);
    }
  }
}
