import 'dart:developer';

import 'package:admin_side_flutter/controller/doctor_details_get_controller.dart';
import 'package:admin_side_flutter/utils/constants/sizedbox.dart';
import 'package:admin_side_flutter/view/widgets/infocard.dart';
import 'package:admin_side_flutter/view/widgets/primarywidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        widget: Consumer<DoctorDetailsProvider>(
            builder: (context, doctorDetailsProvider, child) {
          return ListView.separated(
            padding: const EdgeInsets.all(20),
            itemBuilder: (context, index) {
              return InfoCardWidget(
                title1: 'Name :',
                title2: 'Email :',
                title3: 'PhoneNumber:',
                actions: doctorDetailsProvider
                            .doctorDetailsModel!.doctors[index].block ==
                        false
                    ? 'Block'
                    : 'Unblock',
                ontap: () async {
                  if (doctorDetailsProvider
                          .doctorDetailsModel!.doctors[index].block ==
                      false) {
                     doctorDetailsProvider.changeuserStatus(index);
                   await doctorDetailsProvider.blockDoc(index);
                  } else {
                    doctorDetailsProvider.changeuserStatus(index);
                   await doctorDetailsProvider.unblockDoc(index);
                  }
                },
                image: doctorDetailsProvider
                    .doctorDetailsModel!.doctors[index].profilePhoto,
                name: doctorDetailsProvider
                    .doctorDetailsModel!.doctors[index].firstName,
                email: doctorDetailsProvider
                    .doctorDetailsModel!.doctors[index].email,
                phonenumber: doctorDetailsProvider
                    .doctorDetailsModel!.doctors[index].phoneNumber,
              );
            },
            separatorBuilder: (context, index) => height20,
            itemCount: doctorDetailsProvider.doctorDetailsModel!.doctors.length,
          );
        }),
      ),
    );
  }
}
