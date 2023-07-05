import 'package:admin_side_flutter/view/add_departments/screen_add_department.dart';
import 'package:admin_side_flutter/view/doctors/doctor_screen.dart';
import 'package:admin_side_flutter/view/loginPage/loginpage.dart';
import 'package:admin_side_flutter/view/manage_doctor/screen_manage_department.dart';
import 'package:admin_side_flutter/view/users/user_screen.dart';
import 'package:admin_side_flutter/view/verify_doctor/screen_doctor_verify.dart';
import 'package:flutter/material.dart';
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
            ontap: () {
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
            ontap: () {
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
            ontap: () {
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
            ontap: () {
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
                  builder: (context) =>  LoginScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
