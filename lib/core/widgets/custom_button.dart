import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_movie_app/core/theming/colors_manager.dart';

class CustomButton extends StatelessWidget {
  final bool isloading;
  final void Function() onPressed;
  final String text;
  const CustomButton(
      {super.key,
      this.isloading = false,
      required this.onPressed,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: ColorsManager.gold,
      disabledColor: ColorsManager.mutedBlack.withOpacity(0.5),
      onPressed: isloading ? null : onPressed,
      child: AnimatedCrossFade(
          firstChild: SizedBox(
            width: double.infinity,
            child: Center(
              child: Text(text,
                  style: TextStyle(
                      color: ColorsManager.mutedBlack,
                      fontWeight: FontWeight.w400,
                      fontFamily: GoogleFonts.inter().fontFamily,
                      fontSize: 20)),
            ),
          ),
          secondChild: const CupertinoActivityIndicator(color: ColorsManager.gold),
          crossFadeState:
              isloading ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 500)),
    );
  }
}
