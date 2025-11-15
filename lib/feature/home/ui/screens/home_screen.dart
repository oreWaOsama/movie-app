import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:new_movie_app/core/helpers/app_image_assets.dart';
import 'package:new_movie_app/core/theming/colors_manager.dart';
import 'package:new_movie_app/core/theming/text_styles.dart';
import 'package:new_movie_app/core/utils/locale_keys.dart';
import 'package:new_movie_app/feature/home/ui/widgets/carousel_slider_body.dart';

import '../../../../core/routes/app_routes_name.dart';
import '../../data/movie_serviece.dart';
import '../../models/movie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.65,
          width: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                'assets/images/62a91993882ebf7b39030a68c87492f1e5e33643.jpg',
                fit: BoxFit.cover,
              ),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(0, 0, 0, 0.8),
                      Color.fromRGBO(0, 0, 0, 0.6),
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      AssetsManager.availableNow,
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    const Spacer(),
                    const CarouselSliderBody(),
                    const Spacer(),
                    Image.asset(
                      AssetsManager.watchNow,
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: MediaQuery.of(context).size.height * 0.1395,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 16,
            left: 16,
          ),
          child: Row(
            children: [
              Text(
                LocaleKeys.action.tr(),
                style: TextStyles.font18WhiteRegular,
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutesName.action);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManager.black,
                ),
                child: Row(
                  children: [
                    Text(
                      LocaleKeys.seeMore.tr(),
                      style: TextStyles.font18WhiteRegular.copyWith(
                        color: ColorsManager.gold,
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Icon(
                      Icons.arrow_forward,
                      color: ColorsManager.gold,
                      size: 16,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 200,
          child: FutureBuilder<List<Movie>>(
            future: MovieService.fetchMoviesByGenre("action"),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator(color: ColorsManager.gold,));
              } else if (snapshot.hasError) {
                return Center(child: Text("cannot load action movies"));
              } else {
                final movies = snapshot.data!;
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: movies.length,
                  separatorBuilder: (context, index) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final movie = movies[index];
                    return Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            movie.image,
                            width: 100,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: 100,
                          child: Text(
                            movie.title,
                            style: TextStyles.font18WhiteRegular,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    );
                  },
                );
              }
            },
          ),
        ),

      ],
    );
  }
}
