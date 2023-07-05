import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizedbox.dart';
import '../widgets/customtextwidget.dart';
import '../widgets/infocard.dart';
import '../widgets/primarywidget.dart';

class ScreenVerifyDoctor extends StatelessWidget {
  const ScreenVerifyDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: bgcolor,
        title: const TextWidget(
          text: 'Users',
          size: 30,
          fontWeight: FontWeight.bold,
        ),
        elevation: 0,
      ),
      body: PrimaryWidget(
        widget: ListView(
          padding: const EdgeInsets.all(20),
          children: const [
           InfoCardWidget(
              title1: 'Name :',
              title2: 'Qualification:',
              
              actions: 'Verify',
                image:
                    'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg',
                name: 'Childcare',
                email: 'MBBS',
                ),
            height30,
           InfoCardWidget(
              title1: 'Name :',
              title2: 'Qualification:',
              
              actions: 'Verify',
                image:
                    'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg',
                name: 'Childcare',
                email: 'MBBS',
                ),
            height30,
            InfoCardWidget(
              title1: 'Name :',
              title2: 'Qualification:',
              
              actions: 'Verify',
                image:
                    'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg',
                name: 'Childcare',
                email: 'MBBS',
                ),
          ],
        ),
      ),
    );
  }
}