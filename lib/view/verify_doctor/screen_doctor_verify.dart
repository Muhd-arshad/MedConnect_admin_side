import 'dart:developer';

import 'package:admin_side_flutter/controller/doctor_details_get_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizedbox.dart';
import '../widgets/customtextwidget.dart';
import '../widgets/infocard.dart';
import '../widgets/primarywidget.dart';

class ScreenVerifyDoctor extends StatelessWidget {
  const ScreenVerifyDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: bgcolor,
        title: const TextWidget(
          text: 'Verify Doctor',
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
                title1: 'Depatment :',
                title2: 'Qualification:',
                
                actions: doctorDetailsProvider.doctorDetailsModel!
                            .doctors[index].verificationStatus ==
                        true
                    ? 'Unverify'
                    : 'Verify',
                ontap: () async{
                if(doctorDetailsProvider.doctorDetailsModel!
                            .doctors[index].verificationStatus ==
                        true){
                        await  doctorDetailsProvider.unverifyDoc(index);
                              doctorDetailsProvider.changeVerification(index);
                        }else{
                           await doctorDetailsProvider.verifyDoc(index);
                           doctorDetailsProvider.changeVerification(index);
                        }
                 
                },
                image: doctorDetailsProvider
                    .doctorDetailsModel!.doctors[index].profilePhoto,
                name: doctorDetailsProvider
                    .doctorDetailsModel!.doctors[index].departmentName,
                email: doctorDetailsProvider
                    .doctorDetailsModel!.doctors[index].qualification,
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
