import 'dart:convert';
import 'dart:developer';

import 'package:admin_side_flutter/model/user_details_model.dart';
import 'package:admin_side_flutter/utils/constants/api_configuration.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserDetailsProvider extends ChangeNotifier {
  ListUserModel? listUserModel;
  Future<dynamic> getUser() async {
    log('Entered fetching user');

    String url = Apiconfiguration.baseurl + Apiconfiguration.getuser;
    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        log('sucessfuly user get');
        Map<String, dynamic> data =
            jsonDecode(response.body) as Map<String, dynamic>;
        log(data.toString());
        listUserModel = ListUserModel.fromJson(data);
        log(listUserModel!.users.toString());

        return listUserModel;
      } else {
        log('Failed to change user status in the API. Status code: ${response.statusCode}');
      }
    } catch (e) {
      log('Error occurred while making the API request: $e');
    }
  }

  void changeStatus(int index) {
    bool? status = listUserModel!.users[index].block;
    listUserModel!.users[index].block = !status!;
    notifyListeners();
  }

  Future<void> userBlock(int index) async {
    Map<String, dynamic> payload = {
      "userId": listUserModel!.users[index].id,
    };
    String url = Apiconfiguration.baseurl + Apiconfiguration.blockuser;

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

  Future<void> unblockUser(int index) async {
    Map<String, dynamic> payload = {
      "userId": listUserModel!.users[index].id,
    };
    String url = Apiconfiguration.baseurl + Apiconfiguration.unblockuser;

    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(payload)
      );
      if(response.statusCode == 200){
        log('sucessfuly unbloack');
      }else{
        log('Failed to change user status in the API. Status code: ${response.statusCode}');
      }
    } catch (e) {
      log('Error occurred while making the API request: $e');
    }
  }
}
