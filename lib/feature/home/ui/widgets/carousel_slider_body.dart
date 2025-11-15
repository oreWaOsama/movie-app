import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:new_movie_app/core/theming/colors_manager.dart';
import 'package:new_movie_app/core/theming/text_styles.dart';

import '../../../../core/routes/app_routes_name.dart';
import '../../data/movie_serviece.dart';
import '../../models/movie.dart';

class CarouselSliderBody extends StatelessWidget {
  const CarouselSliderBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Movie>>(
      future: MovieService.fetchMovies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator(color: ColorsManager.gold,));
        } else if (snapshot.hasError) {
          return Center(child: Text("cannot load movie right now , try again later"));
        } else {
          final movies = snapshot.data!;
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context , AppRoutesName.details),
            child: CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.4,
                enlargeCenterPage: true,
                pageSnapping: true,
                disableCenter: true,
                viewportFraction: 0.6,
              ),
              items: movies.map((movie) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: NetworkImage(movie.image),
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
                                    movie.rating.toString(),
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
                          ),
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          );
        }
      },
    );
  }
}
