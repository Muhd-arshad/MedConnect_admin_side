import 'package:admin_side_flutter/utils/constants/sizedbox.dart';
import 'package:admin_side_flutter/view/widgets/infocard.dart';
import 'package:admin_side_flutter/view/widgets/primarywidget.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../widgets/customtextwidget.dart';

class ScreenDoctor extends StatelessWidget {
  const ScreenDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: bgcolor,
        title: const TextWidget(
          text: 'Doctor',
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
              title2: 'Email :',
              title3: 'PhoneNumber:',
              actions: 'Block',
              image:
                  'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg',
              name: 'Ramees',
              email: 'rameezul@gmail.com',
              phonenumber: '8086992020'),
          height30,
          InfoCardWidget(
              title1: 'Name :',
              title2: 'Email :',
              title3: 'PhoneNumber:',
              actions: 'Block',
              image:
                  'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg',
              name: 'Ramees',
              email: 'rameezul@gmail.com',
              phonenumber: '8086992020'),
          height30,
          InfoCardWidget(
              title1: 'Name :',
              title2: 'Email :',
              title3: 'PhoneNumber:',
              actions: 'Block',
              image:
                  'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg',
              name: 'Ramees',
              email: 'rameezul@gmail.com',
              phonenumber: '8086992020'),
        ],
      )),
    );
  }
}
