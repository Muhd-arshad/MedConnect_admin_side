import 'dart:io';

import 'package:admin_side_flutter/controller/department_controller.dart';
import 'package:admin_side_flutter/utils/constants/sizedbox.dart';
import 'package:admin_side_flutter/view/dashBoard/dashboard.dart';
import 'package:admin_side_flutter/view/widgets/buttonwidget.dart';
import 'package:admin_side_flutter/view/widgets/primarywidget.dart';
import 'package:admin_side_flutter/view/widgets/textformwidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/constants/colors.dart';
import '../widgets/customtextwidget.dart';

class ScreenAddDepartment extends StatelessWidget {
  const ScreenAddDepartment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: bgcolor,
        title: const TextWidget(
          text: 'Add Department',
          size: 30,
          fontWeight: FontWeight.bold,
        ),
        elevation: 0,
      ),
      body: PrimaryWidget(
        widget: SingleChildScrollView(
          child: Consumer<DepartmentAddProvider>(
              builder: (context, dptaddprovider, child) {
            return Form(
              key: dptaddprovider.globalformKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  dptaddprovider.photo == null
                      ? const CircleAvatar(
                          radius: 110,
                          backgroundImage: AssetImage(
                              'assets/images/360_F_330332917_MO0x1tcYedbGxUM4wgATwyOkU7xY5wEI.jpg'),
                        )
                      : CircleAvatar(
                          radius: 110,
                          backgroundImage: FileImage(
                            File(dptaddprovider.photo!.path),
                          ),
                        ),
                  height10,
                  ButtonWidget(
                      text: 'Choose Photo',
                      onPressed: () {
                        dptaddprovider.getPhoto();
                      },
                      height: 200,
                      width: 60),
                  height30,
                  TextformFeildWidget(
                    controller: dptaddprovider.dptnameController,
                    labelText: 'Department Name',
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                  height20,
                  TextformFeildWidget(
                    controller: dptaddprovider.descriptionController,
                    labelText: 'Description',
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                  height30,
                  ButtonWidget(
                      text: 'Add Department',
                      onPressed: () async {
                        // ignore: use_build_context_synchronously

                        bool status =
                            await dptaddprovider.addDepartment(context);
                        if (status == true) {
                          dptaddprovider.photo = null;
                          dptaddprovider.dptnameController.clear();
                          dptaddprovider.descriptionController.clear();
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ScreenDashBoard(),
                            ),
                          );
                        }
                      },
                      height: 200,
                      width: 60),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
