import 'package:flutter/material.dart';
import 'package:new_movie_app/core/helpers/app_image_assets.dart';
import 'package:new_movie_app/core/theming/colors_manager.dart';

import '../../../../core/routes/app_routes_name.dart';
import '../../../../core/widgets/custom_btn.dart';

class ExploreTab extends StatelessWidget {
  const ExploreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black,
      body: Container(
        width: double.infinity,
        decoration:  const BoxDecoration(
            image: DecorationImage(
               fit: BoxFit.cover,
          image: AssetImage(AssetsManager.backGround),
        ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              end: Alignment.bottomCenter,
                colors: [
              ColorsManager.black.withOpacity(0.5),
              ColorsManager.black
            ]
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Spacer(),
                const Text(
                  textAlign: TextAlign.center,
                  "Find Your Next Favorite Movie Here" , style: TextStyle(
                  color: Colors.white,
                  fontSize: 33,
                  fontWeight: FontWeight.w700,
                ),),
                const Text(
                  textAlign: TextAlign.center,
                  "Get access to a huge library of movies to suit all tastes. You will surely like it." , style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,

                ),),
                const SizedBox(height: 10,),
                CustomBtn(text: "Explore Now", onTap:() => Navigator.pushReplacementNamed(context , AppRoutesName.onBoarding),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
