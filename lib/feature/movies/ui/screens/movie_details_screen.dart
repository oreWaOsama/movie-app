import 'package:flutter/material.dart';
import 'package:new_movie_app/core/theming/colors_manager.dart';
import 'package:new_movie_app/core/theming/text_styles.dart';
import 'package:new_movie_app/core/widgets/custom_btn.dart';
import 'package:new_movie_app/feature/movies/widgets/box_icon.dart';
import 'package:new_movie_app/feature/movies/widgets/character_card_widget.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorsManager.gold),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/image4.png"),
          ),
        ),
        child: Column(
          children: [
            //Spacer(flex: 2,),
            Center(
              child: Image.asset("assets/images/watch.png"),
            ),
            const SizedBox(height: 20),
            Text(
              "Doctor Strange in the Multiverse of Madness",
              textAlign: TextAlign.center,
              style: TextStyles.font24WhiteBold,
            ),
            const SizedBox(height: 10),
            Text(
              "2022",
              style: TextStyles.font16WhiteMedium,
            ),
            const SizedBox(height: 10),
            CustomBtn(text: "Watch", onTap: () {}),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BoxIcon(
                  text: "15",
                  icon:
                  Icon(Icons.favorite, color: ColorsManager.gold, size: 35),
                ),
                BoxIcon(
                  text: "90",
                  icon: Icon(Icons.watch_later,
                      color: ColorsManager.gold, size: 35),
                ),
                BoxIcon(
                  text: "7.6",
                  icon: Icon(Icons.star, color: ColorsManager.gold, size: 35),
                ),
              ],
            ),
            const SizedBox(height: 20),

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Screen Shots",
                          style: TextStyles.font24WhiteBold,
                        ),
                        const SizedBox(height: 10),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: Image.asset(
                              "assets/images/large-screenshot1.png",
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            )),
                        const SizedBox(height: 10),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: Image.asset(
                              "assets/images/large-screenshot1.png",
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            )),
                        const SizedBox(height: 10),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: Image.asset(
                              "assets/images/large-screenshot1.png",
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            )),
                        Text(
                          "Similar",
                          style: TextStyles.font24WhiteBold,
                        ),
                        GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                childAspectRatio: 0.7),
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return Container(
                                margin:
                                const EdgeInsets.only(left: 10, right: 8),
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
                                          color: ColorsManager.black
                                              .withOpacity(0.7),
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              '7.7',
                                              style:
                                              TextStyles.font16WhiteRegular,
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
                        Text(
                          "Summary",
                          style: TextStyles.font24WhiteBold,
                        ),
                        Text(
                          "Following the events of Spider-Man No Way Home, Doctor Strange unwittingly casts a forbidden spell that accidentally opens up the multiverse. With help from Wong and Scarlet Witch, Strange confronts various versions of himself as well as teaming up with the young America Chavez while traveling through various realities and working to restore reality as he knows it. Along the way, Strange and his allies realize they must take on a powerful new adversary who seeks to take over the multiverse.—Blazer346",
                          style: TextStyles.font16WhiteMedium,
                        ),
                        Text(
                          "Cast",
                          style: TextStyles.font24WhiteBold,
                        ),
                        CharacterCardWidget(
                            image:
                            "assets/images/14776665b6cfa7db4d4c8da7425e4b26c882a6fb.jpg",
                            name: "Hayley Atwell",
                            character: "Captain Carter"),
                        CharacterCardWidget(
                            image:
                            "assets/images/14776665b6cfa7db4d4c8da7425e4b26c882a6fb.jpg",
                            name: "Hayley Atwell",
                            character: "Captain Carter"),
                        CharacterCardWidget(
                            image:
                            "assets/images/14776665b6cfa7db4d4c8da7425e4b26c882a6fb.jpg",
                            name: "Hayley Atwell",
                            character: "Captain Carter"),
                        CharacterCardWidget(
                            image:
                            "assets/images/14776665b6cfa7db4d4c8da7425e4b26c882a6fb.jpg",
                            name: "Hayley Atwell",
                            character: "Captain Carter"),
                        Text(
                          "Genres",
                          style: TextStyles.font24WhiteBold,
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          itemCount: 5,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, childAspectRatio: 1.9),
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: ColorsManager.mutedBlack,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Center(
                                  child: Text("action",
                                      style: TextStyles.font18WhiteBold)),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

