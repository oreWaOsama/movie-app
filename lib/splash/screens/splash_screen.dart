import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:new_movie_app/core/helpers/app_image_assets.dart';

import 'package:new_movie_app/core/theming/colors_manager.dart';
import '../../core/routes/app_routes_name.dart';
import '../../core/storage/shared_prefs_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          BackInRight(child: Image.asset(AssetsManager.logo)),
          const Spacer(),
          FadeInUp(
            onFinish: (direction) async {
              final isFirst = await SharedService.getBool("isFirst");
              print("onFinish executed - isFirst: $isFirst");

              if ((isFirst ?? true) == true) {
                await SharedService.saveBool("isFirst", false);

                Future.delayed(const Duration(seconds: 2), () {
                  if (!context.mounted) return;
                  Navigator.pushReplacementNamed(
                    context,
                    AppRoutesName.explore,
                  );
                });
              } else {
                if (!context.mounted) return;
                Navigator.pushReplacementNamed(
                  context,
                  AppRoutesName.login,
                );
              }
            },
            child: Column(
              children: [
                Center(child: Image.asset(AssetsManager.route)),
                const Center(
                  child: Text(
                    "Supervised By Mohamed Nabil",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
