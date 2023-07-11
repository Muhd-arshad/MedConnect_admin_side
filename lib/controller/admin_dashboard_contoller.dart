import 'dart:convert';
import 'dart:developer';

import 'package:admin_side_flutter/utils/constants/api_configuration.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/model_for_dashboard.dart';
import '../utils/constants/storage.dart';

class ApigetReponse extends ChangeNotifier {
  Admindashbordmodel? adminModel;
 
  Future<dynamic> fetchData() async {
    log("in fetchdata");
    dynamic key = await readToken();
    String url = Apiconfiguration.baseurl + Apiconfiguration.dashboardAdmin;
    final headers = {
      'Authorization': 'Bearer $key', // Add the token to the headers
      'Content-Type': 'application/json',
    };
    http.Response response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    if(response.statusCode == 200){
      log('Sucessfull!');
     Map<String, dynamic> data =
        jsonDecode(response.body) as Map<String, dynamic>;
        log(data.toString());
        adminModel= Admindashbordmodel.fromJson(data);
         return adminModel;
    }else{
    log('Request failed with status code ${response.statusCode}');
    }
  notifyListeners();
  }
}
