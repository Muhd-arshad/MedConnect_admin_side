import 'package:admin_side_flutter/controller/admin_signup.dart';
import 'package:admin_side_flutter/controller/admin_dashboard_contoller.dart';
import 'package:admin_side_flutter/view/loginPage/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/department_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AdminSignuProvider(),),
        ChangeNotifierProvider(create: (context) => ApigetReponse(),),
        ChangeNotifierProvider(create: (context) => DepartmentAddProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
