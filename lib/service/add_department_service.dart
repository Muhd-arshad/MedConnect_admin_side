import 'dart:convert';
import 'dart:developer';

import 'package:admin_side_flutter/utils/constants/api_configuration.dart';
import 'package:admin_side_flutter/utils/constants/error_handling.dart';
import 'package:admin_side_flutter/utils/constants/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<bool> addDpartment(String departmentname, String description,
    String image, BuildContext context) async {
  Map<String, dynamic> payload = {
    "value": {
      "departmentName": departmentname,
      "departmentDiscription": description
    },
    "departmentImage": image
  };
  String url = Apiconfiguration.baseurl + Apiconfiguration.dpartAdd;
  http.Response response = await http.post(Uri.parse(url),
      headers: {'Content-Type': 'application/json'}, body: jsonEncode(payload));
// ignore: use_build_context_synchronously
  httpErrorHandler(
      response: response,
      context: context,
      onSucces: () {
        showSnackBar(context, 'Department Added');
      });

  if (response.statusCode == 200) {
    log('Request succeeded!');

    return true;
  } else {
    // Request failed
    log('Request failed with status code ${response.statusCode}');
    return false;
  }
}
