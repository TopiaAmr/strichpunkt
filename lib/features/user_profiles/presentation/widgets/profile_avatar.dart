import 'package:flutter/material.dart';
import 'package:strichpunkt/core/theme/app_theme.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final double size;
  final bool showBorder;
  final Color borderColor;

  const ProfileAvatar({
    super.key,
    required this.imageUrl,
    this.size = 40,
    this.showBorder = false,
    this.borderColor = AppTheme.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: showBorder ? Border.all(color: borderColor, width: 2) : null,
        image: DecorationImage(
          image:
              imageUrl.startsWith('http')
                  ? NetworkImage(imageUrl) as ImageProvider
                  : AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
