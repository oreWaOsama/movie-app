import 'package:flutter/material.dart';
import 'package:new_movie_app/core/theming/colors_manager.dart';
import '../../../../core/routes/app_routes_name.dart';
import '../../../../core/storage/shared_prefs_manager.dart';
import '../../../../core/widgets/custom_btn.dart';
import '../../data/models/on_boarding_data.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var pages = OnBoardingData.pageData;
  PageController pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
      controller: pageController,
      onPageChanged: (value) {
        currentIndex = value;
        setState(() {});
      },
      itemCount: pages.length,
      itemBuilder: (context, index) {
        final item = pages[index];

        //main container for the background image
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(item.image),
            ),
          ),

          //container for the gradient
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: item.gradiant, end: Alignment.bottomCenter),
            ),
            child: Column(
              children: [
                const Spacer(),
                Container(
                  height: currentIndex == pages.length - 1
                      ? 230
                      : currentIndex == 0
                          ? 230
                          : 300,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: ColorsManager.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        item.title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        item.description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: CustomBtn(
                            text: currentIndex == pages.length - 1
                                ? "Finish"
                                : "Next",
                          onTap: () async {
                            if (currentIndex == pages.length - 1) {
                              await SharedService.saveBool("isFirst", false);
                              await Navigator.pushReplacementNamed(context, AppRoutesName.login);
                            } else {
                              pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Easing.legacy,
                              );
                            }
                          },

                        ),
                      ),
                      if (currentIndex > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: CustomBtn(
                              text: "Back",
                              onTap: () {
                                pageController.previousPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Easing.legacy);
                              }),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ));
  }
}
