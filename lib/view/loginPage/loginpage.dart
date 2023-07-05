import 'package:admin_side_flutter/controller/admin_signup.dart';
import 'package:admin_side_flutter/utils/constants/colors.dart';
import 'package:admin_side_flutter/utils/constants/sizedbox.dart';
import 'package:admin_side_flutter/view/dashBoard/dashboard.dart';
import 'package:admin_side_flutter/view/widgets/textformwidget.dart';
import 'package:admin_side_flutter/view/widgets/primarywidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/admin_dashboard_contoller.dart';
import '../../utils/constants/padding.dart';
import '../widgets/buttonwidget.dart';
import '../widgets/customtextwidget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PrimaryWidget(
        widget: Padding(
          padding: horizontal10,
          child: Consumer<AdminSignuProvider>(
              builder: (context, adminSignuProvider, child) {
            return Form(
              key: adminSignuProvider.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextWidget(
                      colorText: cBlack,
                      fontWeight: FontWeight.bold,
                      size: 40,
                      text: 'Welcome Back'),
                  const TextWidget(
                    // padding: 20,
                    text: 'Login into your Account',
                    fontWeight: FontWeight.bold,
                    size: 20,
                  ),
                  height50,
                  TextformFeildWidget(
                      controller: adminSignuProvider.emailcontroller,
                      labelText: 'Enter your Email'),
                  height30,
                  TextformFeildWidget(
                      controller: adminSignuProvider.passwordcontroller,
                      labelText: 'Enter Your Password'),
                  height50,
                  ButtonWidget(
                    text: 'Login',
                    height: 250,
                    width: 60,
                    onPressed: () async {
                      bool status =
                          await adminSignuProvider.adminSignup(context);
                      if (status == true) {
                         // ignore: use_build_context_synchronously
                         final apiResponse = Provider.of<ApigetReponse>(context,listen: false);

                        // Call fetchData when the app starts or when necessary
                        await apiResponse.fetchData();
                       

                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ScreenDashBoard(),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
