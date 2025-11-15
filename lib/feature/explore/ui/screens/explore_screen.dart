import 'package:flutter/material.dart';
import 'package:new_movie_app/core/theming/colors_manager.dart';
import 'package:new_movie_app/core/theming/text_styles.dart';
import '../../../home/data/movie_serviece.dart';
import '../../../home/models/movie.dart';
import '../widgets/tab_widget.dart';

class ExploreScreen extends StatefulWidget {
  ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final List<String> genres = ['action', 'adventure', 'animation', 'biography'];
  List<Movie> movies = [];
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black,
      body: Column(children: [
        DefaultTabController(
          length: 4,
          child: SafeArea(
            child: TabBar(
              onTap: onChangeTab,
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              dividerColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              tabs: [
                TabWidget(text: "Action", isSelected: tabIndex == 0),
                TabWidget(text: "Adventure", isSelected: tabIndex == 1),
                TabWidget(text: "Animation", isSelected: tabIndex == 2),
                TabWidget(text: "Biography", isSelected: tabIndex == 3),
              ],
            ),
          ),
        ),
        Expanded(
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : GridView.builder(
                  itemCount: movies.length,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    final movie = movies[index];
                    return Container(
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
        ),
      ]),
    );
  }

  int tabIndex = 0;

  void onChangeTab(index) {
    tabIndex = index;
    fetchMovies();
  }

  void fetchMovies() async {
    setState(() {
      isLoading = true;
    });

    final genre = genres[tabIndex];
    try {
      final result = await MovieService.fetchMoviesByGenre(genre);
      setState(() {
        movies = result;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        movies = [];
        isLoading = false;
      });
    }
  }
}
