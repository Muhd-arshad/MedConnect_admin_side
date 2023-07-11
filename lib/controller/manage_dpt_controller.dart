import 'dart:convert';
import 'dart:developer';

import 'package:admin_side_flutter/utils/constants/api_configuration.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/dpt_mange_model.dart';

class ManagedptProvider extends ChangeNotifier {
  ManageDptModel? manageDptModel;
  Future<dynamic> mangeDepartment() async {
    log('Entered manage Department');
    String url = Apiconfiguration.baseurl + Apiconfiguration.mangeDpt;

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        }
        
      );
      if(response.statusCode == 200){
        log('sucessfull');
        Map<String,dynamic> data =jsonDecode(response.body) as Map<String,dynamic>;
        manageDptModel = ManageDptModel.fromJson(data);
        return manageDptModel;
      }else{
        log('Failed to change user status in the API. Status code: ${response.statusCode}');
      }
    } catch (e) {
      log('Error occurred while making the API request: $e');
    }
  }
  void changeDepartmentStatus(int index) {
    bool? status =manageDptModel!.departments[index].show;
    manageDptModel!.departments[index].show = !status!;
    notifyListeners();
  }
  Future<void> hideDepartment(int index) async {
    log('enterd');
    Map<String, dynamic> payload = {
      "departmentId": manageDptModel!.departments[index].id,
    };
    String url = Apiconfiguration.baseurl + Apiconfiguration.hidedpt;

    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(payload));
      if (response.statusCode == 200) {
        log('Block Sucessful');
      } else {
        log('Failed to change user status in the API. Status code: ${response.statusCode}');
      }
    } catch (e) {
      log('Error occurred while making the API request: $e');
    }
  }
  Future<void> unhideDpt (int index)async {
     Map<String, dynamic> payload = {
      "departmentId": manageDptModel!.departments[index].id,
    };
    String url = Apiconfiguration.baseurl + Apiconfiguration.unhideDpt;

    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(payload));
      if (response.statusCode == 200) {
        log('Block Sucessful');
      } else {
        log('Failed to change user status in the API. Status code: ${response.statusCode}');
      }
    } catch (e) {
      log('Error occurred while making the API request: $e');
    }
  }
}
