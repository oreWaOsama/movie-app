import 'package:flutter/material.dart';

import '../../../core/theming/colors_manager.dart';
import '../../../core/theming/text_styles.dart';

class BoxIcon extends StatelessWidget {
   BoxIcon({super.key , required this.text , required this.icon});
  String text;
  Widget icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 60,
      decoration: BoxDecoration(
        color: ColorsManager.mutedBlack,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          icon,
          Text(
            text,
            style: TextStyles.font24WhiteBold
          )
        ],
      ),
    );
  }
}
