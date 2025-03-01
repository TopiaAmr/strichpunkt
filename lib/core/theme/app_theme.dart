import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  // Primary Colors
  static const Color primaryColor = Color(0xFF3F5F90);
  static const Color accentColor = Color(0xFFD6E3FF);
  static const Color errorColor = Color(0xFFE57373);
  static const Color pendingColor = Color(0xFFE2E2E9);
  static const Color verifiedColor = Color(0xFF10B981);

  // Background Colors
  static const Color backgroundColor = Color(0xFFF5F5F5);
  static const Color cardColor = Color(0xFFFFFFFF);

  // Text Colors
  static const Color textPrimaryColor = Color(0xff43474E);
  static const Color textSecondaryColor = Color(0xFF757575);
  static const Color grayColor = Color(0xFFE2E2E9);

  // Navigation Colors
  static const Color navInactiveColor = Color(0xFFBDBDBD);
  static const Color navActiveColor = Color(
    0xFF5C6BC0,
  ); // Indigo color from the design
  static const Color navBackgroundColor = Colors.white;
  
  // Button Colors
  static const Color currentlyUseBackgroundColor = Color(0xFFE8F5E9);
  static const Color currentlyUseTextColor = Color(0xFF4CAF50);
  static const Color editBackgroundColor = accentColor; // Using existing accentColor

  // Text Styles
  static TextStyle headingStyle = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.w400,
    color: textPrimaryColor,
  );

  static TextStyle subheadingStyle = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: textPrimaryColor,
  );

  static TextStyle bodyStyle = TextStyle(
    fontSize: 16.sp,
    color: textPrimaryColor,
  );

  static TextStyle captionStyle = TextStyle(
    fontSize: 14.sp,
    color: textSecondaryColor,
  );

  static TextStyle navLabelStyle = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
  );

  // Button Styles
  static ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    foregroundColor: Colors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  );

  static ButtonStyle secondaryButtonStyle = OutlinedButton.styleFrom(
    foregroundColor: primaryColor,
    side: const BorderSide(color: primaryColor),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  );

  // Theme Data
  static ThemeData themeData = ThemeData(
    primaryColor: primaryColor,
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      secondary: accentColor,
      error: errorColor,
    ),
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: backgroundColor,
      foregroundColor: textPrimaryColor,
      elevation: 0,
    ),
    cardTheme: CardTheme(
      color: cardColor,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(style: primaryButtonStyle),
    outlinedButtonTheme: OutlinedButtonThemeData(style: secondaryButtonStyle),
    textTheme: TextTheme(
      headlineMedium: headingStyle,
      titleLarge: subheadingStyle,
      bodyLarge: bodyStyle,
      bodyMedium: captionStyle,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: navBackgroundColor,
      selectedItemColor: navActiveColor,
      unselectedItemColor: navInactiveColor,
      selectedLabelStyle: navLabelStyle,
      unselectedLabelStyle: navLabelStyle,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),
  );
}

// Extension to help with color opacity
extension ColorExtension on Color {
  Color withValues({num? red, num? green, num? blue, double? alpha}) {
    return Color.fromRGBO(
      (red ?? r).toInt(),
      (green ?? g).toInt(),
      (blue ?? b).toInt(),
      alpha ?? a,
    );
  }
}
