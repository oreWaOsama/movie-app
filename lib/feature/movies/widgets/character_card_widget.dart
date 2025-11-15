import 'package:flutter/material.dart';

import '../../../core/theming/colors_manager.dart';
import '../../../core/theming/text_styles.dart';

class CharacterCardWidget extends StatelessWidget {
   CharacterCardWidget({super.key , required this.image , required this.name , required this.character});
  String image;
  String name;
  String character;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),
      height: 90,
      decoration: BoxDecoration(
        color: ColorsManager.mutedBlack,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                    image)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name : $name" ,
                style: TextStyles.font16WhiteMedium,),
              Text("Character : $character" ,
                style: TextStyles.font16WhiteMedium,),
            ],
          )
        ],
      ),
    );
  }
}
