import 'package:admin_side_flutter/controller/doctor_details_get_controller.dart';
import 'package:admin_side_flutter/controller/manage_dpt_controller.dart';
import 'package:admin_side_flutter/controller/user_get_controller.dart';
import 'package:admin_side_flutter/view/add_departments/screen_add_department.dart';
import 'package:admin_side_flutter/view/doctors/doctor_screen.dart';
import 'package:admin_side_flutter/view/loginPage/loginpage.dart';
import 'package:admin_side_flutter/view/manage_department/screen_manage_department.dart';
import 'package:admin_side_flutter/view/users/user_screen.dart';
import 'package:admin_side_flutter/view/verify_doctor/screen_doctor_verify.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'listtilewidget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTileWidget(
            title: 'Dashboard',
            ontap: () {},
          ),
          ListTileWidget(
            title: 'Users',
            ontap: () async{
              await Provider.of<UserDetailsProvider>(context,listen: false).getUser();
              // ignore: use_build_context_synchronously
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenUser(),
                  ),
                  );
                 
            },
          ),
          ListTileWidget(
            title: 'Docters',
            ontap: () async {
              await Provider.of<DoctorDetailsProvider>(context,listen: false).fechDoctorDetails();
              // ignore: use_build_context_synchronously
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ScreenDoctor(),
                ),
              );
              
            },
          ),
          ListTileWidget(
            title: 'Add Department',
            ontap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ScreenAddDepartment(),
                ),
              );
            },
          ),
          ListTileWidget(
            title: 'Manage department',
            ontap: () async{
             await Provider.of<ManagedptProvider>(context,listen: false).mangeDepartment();
              // ignore: use_build_context_synchronously
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ScreenManageDepartment(),
                ),
              );
            },
          ),
          ListTileWidget(
            title: 'Doctor Verification',
            ontap: () async{
               await Provider.of<DoctorDetailsProvider>(context,listen: false).fechDoctorDetails();
              // ignore: use_build_context_synchronously
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ScreenVerifyDoctor(),
                ),
              );
            
            },
          ),
          ListTileWidget(
            title: 'Logout',
            ontap: () {
               Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
