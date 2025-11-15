import 'package:flutter/material.dart';
import 'package:new_movie_app/core/theming/colors_manager.dart';
import 'package:new_movie_app/core/theming/text_styles.dart';

class ListViewBody extends StatelessWidget {
  const ListViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(left: 16, right: 8),
              width: MediaQuery.of(context).size.width * 0.35,
              height: MediaQuery.of(context).size.height * 0.25,
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
                        color: ColorsManager.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Text(
                            '7.7',
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
          itemCount: 6),
    );
  }
}
