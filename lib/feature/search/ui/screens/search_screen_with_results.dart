import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:new_movie_app/core/helpers/app_image_assets.dart';
import 'package:new_movie_app/core/theming/colors_manager.dart';
import 'package:new_movie_app/core/theming/text_styles.dart';
import 'package:new_movie_app/core/utils/locale_keys.dart';
import 'package:new_movie_app/core/widgets/custom_svg_icon.dart';

class SearchScreenWithResults extends StatelessWidget {
  const SearchScreenWithResults({super.key});

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
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 0.7),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(left: 10, right: 8),
                        width: 150,
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                            image: AssetImage(
                                'assets/images/62a91993882ebf7b39030a68c87492f1e5e33643.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 10,
                              left: 10,
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: ColorsManager.black.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      '7.7',
                                      style: TextStyles.font16WhiteRegular,
                                    ),
                                    const SizedBox(width: 5),
                                    const Icon(
                                      Icons.star,
                                      color: ColorsManager.gold,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
