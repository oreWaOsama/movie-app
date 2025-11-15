import 'package:flutter/material.dart';

import '../../../../core/theming/colors_manager.dart';
import '../../../../core/theming/text_styles.dart';

class TabWidget extends StatelessWidget {
   TabWidget({super.key , required this.text , required this.isSelected});
   String text;
   bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        padding : EdgeInsets.symmetric(horizontal: 12 , vertical: 6),
        decoration: BoxDecoration(
          color: isSelected?ColorsManager.gold:ColorsManager.black,
            border: Border.all(color: isSelected?ColorsManager.gold:ColorsManager.gold  , width:1.5),
            borderRadius: BorderRadius.circular(16)
        ),
        child: Text(text , style:TextStyles.font18WhiteBold.copyWith(color: isSelected?ColorsManager.black:ColorsManager.gold) ),
      ),
    );
  }
}
