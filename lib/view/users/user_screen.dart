import 'dart:developer';

import 'package:admin_side_flutter/controller/user_get_controller.dart';
import 'package:admin_side_flutter/utils/constants/sizedbox.dart';
import 'package:admin_side_flutter/view/widgets/infocard.dart';
import 'package:admin_side_flutter/view/widgets/primarywidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/constants/colors.dart';

import '../widgets/customtextwidget.dart';

class ScreenUser extends StatelessWidget {
  const ScreenUser({super.key});

  @override
  Widget build(BuildContext context) {
    // Provider.of<UserDetailsProvider>(context,listen: false).getUser();
    return Scaffold(
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
        widget: Consumer<UserDetailsProvider>(
            builder: (context, userdetailsProvider, child) {
          return ListView.separated(
            padding: const EdgeInsets.all(20),
            itemBuilder: (context, index) {
              return InfoCardWidget(
                  title1: 'Name :',
                  title2: 'Email :',
                  title3: 'PhoneNumber:',
                  actions:
                      userdetailsProvider.listUserModel!.users[index].block ==
                              false
                          ? 'Block'
                          : 'Unblock',
                  ontap: () async {
                    if (userdetailsProvider.listUserModel!.users[index].block ==
                        false) {
                      await userdetailsProvider.userBlock(index);
                      userdetailsProvider.changeStatus(index);
                    } else {
                      await userdetailsProvider.unblockUser(index);
                      userdetailsProvider.changeStatus(index);
                    }
                  },
                  image: userdetailsProvider
                      .listUserModel!.users[index].profilePhoto,
                  name:
                      userdetailsProvider.listUserModel!.users[index].firstName,
                  email: userdetailsProvider.listUserModel!.users[index].email,
                  phonenumber: userdetailsProvider
                      .listUserModel!.users[index].phoneNumber);
            },
            separatorBuilder: (context, index) => height20,
            itemCount: userdetailsProvider.listUserModel!.users.length,
          );
        }),
      ),
    );
  }
}
