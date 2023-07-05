import 'dart:convert';
import 'dart:developer';

import 'package:admin_side_flutter/utils/constants/api_configuration.dart';
import 'package:admin_side_flutter/utils/constants/error_handling.dart';
import 'package:admin_side_flutter/utils/constants/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

const FlutterSecureStorage secureStorage = FlutterSecureStorage();

Future<dynamic> signup(
    String email, String password, BuildContext context) async {
  Map<String, dynamic> payload = {
    "value": {
      "email": email,
      "password": password,
    }
  };
  try {
    String url = Apiconfiguration.baseurl + Apiconfiguration.loginurl;

    http.Response response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(payload),
    );
    log(response.body);
    // ignore: use_build_context_synchronously
    httpErrorHandler(
        response: response,
        context: context,
        onSucces: () {
          showSnackBar(context, 'Sucessfuly login');
        });
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      String token = jsonResponse['token'];
      log(token);
      secureStorage.write(key: 'token', value: token);
      return true;
    } else {
      return false;
    }
  } catch (e) {
    log(e.toString());
  }
}
