import 'package:admin_side_flutter/service/admin_signup_service.dart';
import 'package:flutter/material.dart';

class AdminSignuProvider extends ChangeNotifier {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isloaded = false;
  Future<bool> adminSignup(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      isloaded = true;
      bool status =
          await signup(emailcontroller.text, passwordcontroller.text, context);
      isloaded = false;
      if (status == true) {
        return true;
      } else {
        return false;
      }
    }
    notifyListeners();

    return false;
  }
}
