import 'dart:ui';

import 'package:new_movie_app/core/helpers/app_image_assets.dart';

class OnBoardingData {
  String title;
  String description;
  String image;
  List<Color> gradiant;
  OnBoardingData(
      {required this.title,
      required this.description,
      required this.image,
      required this.gradiant});

  static List<OnBoardingData> pageData = [
    OnBoardingData(
        image: AssetsManager.onBoarding1,
        title: "Discover Movies",
        description:
            "Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.",
        gradiant: [
          const Color(0xff084250).withOpacity(0.1),
          const Color(0xff084250),
        ]),
    OnBoardingData(
        image: AssetsManager.onBoarding2,
        title: "Explore All Genres",
        description:
            "Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.", gradiant: [
      const Color(0xff85210E).withOpacity(0.1),
      const Color(0xff85210E),
    ]),
    OnBoardingData(
        image: AssetsManager.onBoarding3,
        title: "Create Watchlists ",
        description:
            "Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.", gradiant: [
      const Color(0xff4C2471).withOpacity(0.1),
      const Color(0xff4C2471),
    ]),
    OnBoardingData(
        image: AssetsManager.onBoarding4,
        title: "Rate, Review, and Learn ",
        description:
            "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.", gradiant: [
      const Color(0xff601321).withOpacity(0.1),
      const Color(0xff601321),
    ]),
    OnBoardingData(
        image: AssetsManager.onBoarding5,
        title: "Start Watching Now",
        description: "", gradiant: [
      const Color(0xff2A2C30).withOpacity(0.1),
      const Color(0xff2A2C30),
    ])
  ];
}
