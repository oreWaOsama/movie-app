import 'package:flutter/material.dart';
import 'package:new_movie_app/core/theming/colors_manager.dart';
import 'package:new_movie_app/core/theming/text_styles.dart';
import 'package:new_movie_app/feature/home/data/movie_serviece.dart';
import 'package:new_movie_app/feature/home/models/movie.dart';

class ActionScreen extends StatelessWidget {
  const ActionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: ColorsManager.gold),
        backgroundColor: ColorsManager.black,
        centerTitle: true,
        title: Text(
          "Action",
          style: TextStyles.font24WhiteBold.copyWith(color: ColorsManager.gold),
        ),
      ),
      body: FutureBuilder<List<Movie>>(
        future: MovieService.fetchMoviesByGenre("action"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("حدث خطأ أثناء تحميل أفلام الأكشن"));
          } else {
            final movies = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: GridView.builder(
                itemCount: movies.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return Container(
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
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
                        )
                      ],
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
