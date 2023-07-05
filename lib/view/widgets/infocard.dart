import 'package:flutter/material.dart';

import '../../utils/constants/sizedbox.dart';
import 'buttonwidget.dart';
import 'customtextwidget.dart';

class InfoCardWidget extends StatelessWidget {
  final String image;
  final String name;
  final String? email;
  final String? phonenumber;
   final String title1;
  final String title2;
  final String? title3;
  final String actions;
  const InfoCardWidget({
    super.key, required this.image, required this.name,  this.email,  this.phonenumber='', required this.title1, required this.title2,  this.title3='', required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height:MediaQuery.of(context).size.height *0.33,
      width: MediaQuery.of(context).size.width *0.88,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height *0.1,
            width: MediaQuery.of(context).size.width *0.2,
            child: Image(image: AssetImage(image)),
          ),
          Column(
           
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 TextWidget(text: title1,size: 20 ,fontWeight: FontWeight.bold,),
                   TextWidget(text: name,size: 18 ,fontWeight: FontWeight.bold,),
                ],
              ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(text: title2,size: 20 ,fontWeight: FontWeight.bold,),
                   TextWidget(text: email,size: 18 ,fontWeight: FontWeight.bold,),
                ],
              ),
              title3!.isEmpty ? const SizedBox():
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 TextWidget(text: title3,size: 20 ,fontWeight: FontWeight.bold,),
                   TextWidget(text: phonenumber,size: 18 ,fontWeight: FontWeight.bold,),
                ],
              ),
            ],
          ),
          height10,
          height10,
          ButtonWidget(text: actions, height:110,width: 30, onPressed: (){}),
        ],
      ),
    );
  }
}