
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../widgets/customtextwidget.dart';



class CardWidget extends StatelessWidget {
  final String image;
  final String text;
  final String count;
  const CardWidget({
    super.key, required this.image, required this.text, required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(
     color: cwhite,
     borderRadius: BorderRadius.circular(30),
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          CircleAvatar(
          radius: 45,
           backgroundImage: AssetImage(image)),
          //  height10,
           TextWidget(text: text,fontWeight: FontWeight.bold,size: 15,),
          //  height10,
           TextWidget(text: count,fontWeight: FontWeight.bold,colorText: cBlack,)
        ],
      ),
    ),
    );
  }
}
