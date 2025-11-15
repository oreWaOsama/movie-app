import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_movie_app/core/helpers/app_image_assets.dart';
import 'package:new_movie_app/core/theming/colors_manager.dart';
import 'package:new_movie_app/core/utils/locale_keys.dart';
import 'package:new_movie_app/feature/explore/ui/screens/explore_screen.dart';
import 'package:new_movie_app/feature/home/ui/screens/home_screen.dart';
import 'package:new_movie_app/feature/profile/ui/screens/profile_main.dart';
import 'package:new_movie_app/feature/search/ui/screens/search_screen_with_results.dart';

class UserHomeView extends StatefulWidget {
  const UserHomeView({super.key, this.index});
  final int? index;
  @override
  State<UserHomeView> createState() => _UserHomeViewState();
}

class _UserHomeViewState extends State<UserHomeView> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreenWithResults(),
     ExploreScreen(),
    const ProfileMain()
  ];
  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      _currentIndex = widget.index!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: IndexedStack(
              index: _currentIndex,
              children: _screens,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: SizedBox(
                    height: 65,
                    child: BottomNavigationBar(
                      currentIndex: _currentIndex,
                      onTap: (value) {
                        setState(() {
                          _currentIndex = value;
                        });
                      },
                      backgroundColor: ColorsManager.mutedBlack,
                      type: BottomNavigationBarType.fixed,
                      fixedColor: ColorsManager.gold,
                      unselectedItemColor: ColorsManager.white,
                      showUnselectedLabels: false,
                      showSelectedLabels: false,
                      items: [
                        customBottomNavigationBarItem(
                          label: LocaleKeys.home.tr(),
                          inActiveIconPath: AssetsManager.homeIcon,
                          activeIconPath: AssetsManager.homeIcon,
                        ),
                        customBottomNavigationBarItem(
                          label: LocaleKeys.search.tr(),
                          inActiveIconPath: AssetsManager.searchIcon,
                          activeIconPath: AssetsManager.searchIcon,
                        ),
                        customBottomNavigationBarItem(
                          label: LocaleKeys.explore.tr(),
                          inActiveIconPath: AssetsManager.exploreIcon,
                          activeIconPath: AssetsManager.exploreIcon,
                        ),
                        customBottomNavigationBarItem(
                          label: LocaleKeys.profile.tr(),
                          inActiveIconPath: AssetsManager.profileIcon,
                          activeIconPath: AssetsManager.profileIcon,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

BottomNavigationBarItem customBottomNavigationBarItem({
  required String inActiveIconPath,
  required String activeIconPath,
  required String? label,
}) {
  return BottomNavigationBarItem(
    icon: SvgPicture.asset(
      inActiveIconPath,
      colorFilter: const ColorFilter.mode(
        ColorsManager.white,
        BlendMode.srcIn,
      ),
      width: 26,
      height: 26,
    ),
    activeIcon: SvgPicture.asset(
      activeIconPath,
      colorFilter: const ColorFilter.mode(
        ColorsManager.gold,
        BlendMode.srcIn,
      ),
      width: 26,
      height: 26,
    ),
    label: label,
  );
}
