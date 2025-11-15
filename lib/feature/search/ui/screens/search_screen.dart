import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:new_movie_app/core/helpers/app_image_assets.dart';
import 'package:new_movie_app/core/theming/colors_manager.dart';
import 'package:new_movie_app/core/theming/text_styles.dart';
import 'package:new_movie_app/core/utils/locale_keys.dart';
import 'package:new_movie_app/core/widgets/custom_svg_icon.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: ColorsManager.mutedBlack,
                  hintText: LocaleKeys.search.tr(),
                  hintStyle: TextStyles.font16WhiteRegular,
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CustomIcon(
                      iconSvgPath: AssetsManager.searchIcon,
                      iconWidth: 10,
                      iconHeight: 10,
                    ),
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const Spacer(),
              const Center(
                child: CustomIcon(
                  iconSvgPath: AssetsManager.emptySearch,
                  iconWidth: 200,
                  iconHeight: 200,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
