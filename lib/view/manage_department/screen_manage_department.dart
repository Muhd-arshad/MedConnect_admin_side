
import 'dart:developer';

import 'package:admin_side_flutter/controller/manage_dpt_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        widget: Consumer<ManagedptProvider>(
       
          builder: (context, managedptProvider,child) {
            return ListView.separated(
              padding: const EdgeInsets.all(20),
              itemBuilder: (BuildContext context, int index) { 
                return InfoCardWidget(
                  title1: 'Name :',
                  title2: 'Description :',
                  actions: managedptProvider.manageDptModel!.departments[index].show == true ?
                  'Hide' :'Unhide',
                  image:
                      managedptProvider.manageDptModel!.departments[index].departmentImage,
                  name: managedptProvider.manageDptModel!.departments[index].departmentName,
                  email: managedptProvider.manageDptModel!.departments[index].departmentDiscription,
                  ontap: ()async{
                    log('ramees');
                    if(managedptProvider.manageDptModel!.departments[index].show == true){
                      await managedptProvider.hideDepartment(index);
                      managedptProvider.changeDepartmentStatus(index);
                    }else{
                      await managedptProvider.unhideDpt(index);
                      managedptProvider.changeDepartmentStatus(index);
                    }
                  },
                );
               },
              separatorBuilder: (context, index) => height20,
              itemCount: managedptProvider.manageDptModel!.departments.length,
            );
          }
        ),
      ),
    );
  }
}
