import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIcon extends StatelessWidget {
  final String iconSvgPath;
  final Color? iconColor;
  final double? iconWidth;
  final double? iconHeight;
  const CustomIcon({
    required this.iconSvgPath,
    super.key,
    this.iconColor,
    this.iconWidth,
    this.iconHeight,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconSvgPath,
      width: iconWidth ?? 20,
      height: iconHeight ?? 20,
      colorFilter:
          iconColor == null
              ? null
              : ColorFilter.mode(iconColor!, BlendMode.srcIn),
      fit: BoxFit.contain,
    );
  }
}
