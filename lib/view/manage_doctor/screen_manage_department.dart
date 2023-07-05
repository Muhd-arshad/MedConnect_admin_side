import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizedbox.dart';
import '../widgets/customtextwidget.dart';
import '../widgets/infocard.dart';
import '../widgets/primarywidget.dart';

class ScreenManageDepartment extends StatelessWidget {
  const ScreenManageDepartment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: bgcolor,
        title: const TextWidget(
          text: 'Manage Department',
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
              title1: 'DptName :',
              title2: 'Description :',
              actions: 'Delete',
              image:
                  'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg',
              name: 'Childcare',
              email: 'afsdghjkldshdfjkdfjkdfj',
            ),
            height30,
            InfoCardWidget(
              title1: 'DptName :',
              title2: 'Description :',
              actions: 'Delete',
              image:
                  'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg',
              name: 'Childcare',
              email: 'afsdghjkldshdfjkdfjkdfj',
            ),
            height30,
            InfoCardWidget(
              title1: 'DptName :',
              title2: 'Description :',
              actions: 'Delete',
              image:
                  'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg',
              name: 'Childcare',
              email: 'afsdghjkldshdfjkdfjkdfj',
            ),
          ],
        ),
      ),
    );
  }
}
