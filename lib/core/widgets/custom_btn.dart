import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_movie_app/core/theming/colors_manager.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({super.key, required this.text, required this.onTap});
  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: text == "Back" ? ColorsManager.gold : Colors.transparent,
              width: 2
            ),
            borderRadius: BorderRadius.circular(16)),
        child: CupertinoButton(
            color: text == "Back" ? ColorsManager.black : ColorsManager.gold,
            borderRadius: BorderRadius.circular(16),
            onPressed: onTap,
            child: Text(
              text,
              style: TextStyle(
                  color: text == "Back" ? ColorsManager.gold : ColorsManager.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 18),
            )),
      ),
    );
  }
}
