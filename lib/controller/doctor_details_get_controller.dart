import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:admin_side_flutter/model/doctor_details_model.dart';
import 'package:admin_side_flutter/utils/constants/api_configuration.dart';
import 'package:flutter/material.dart';

import '../utils/constants/storage.dart';

class DoctorDetailsProvider extends ChangeNotifier {
  DoctorDetailsModel? doctorDetailsModel;
  Future<dynamic> fechDoctorDetails() async {
    log('enterd in doctor fetching');
    dynamic key = await readToken();
    String url = Apiconfiguration.baseurl + Apiconfiguration.docDtails;
    final headers = {
      'Authorization': 'Bearer $key', // Add the token to the headers
      'Content-Type': 'application/json',
    };

    http.Response response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    log(response.body);
    if (response.statusCode == 200) {
      log('Succsessful!');
      Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;
      log(data.toString());
      doctorDetailsModel = DoctorDetailsModel.fromJson(data);
      log(doctorDetailsModel!.doctors.toString());
      return doctorDetailsModel;
    } else {
      log('responce failed with ${response.statusCode}');
    }
  }

  void changeuserStatus(int index) {
    bool? status = doctorDetailsModel!.doctors[index].block;
    doctorDetailsModel!.doctors[index].block = !status!;
    notifyListeners();
  }

  void changeVerification(int index) {
    bool? verify = doctorDetailsModel!.doctors[index].verificationStatus;
    doctorDetailsModel!.doctors[index].verificationStatus = !verify!;
    notifyListeners();
  }

  Future<void> blockDoc(int index) async {
    Map<String, dynamic> payload = {
      "doctorId": doctorDetailsModel!.doctors[index].id,
      // 'status': doctorDetailsModel!.doctors[index].block,
    };

    String url = Apiconfiguration.baseurl + Apiconfiguration.blockDoc;

    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(payload),
      );
      log(response.body);
      if (response.statusCode == 200) {
        // Status changed successfully in the API
        log('User status changed in the API.');
      } else {
        // Handle API request errors
        log('Failed to change user status in the API. Status code: ${response.statusCode}');
      }
    } catch (e) {
      log('Error occurred while making the API request: $e');
    }
  }

  Future<void> unblockDoc(int index) async {
    Map<String, dynamic> payload = {
      "doctorId": doctorDetailsModel!.doctors[index].id,
      // 'status': doctorDetailsModel!.doctors[index].block,
    };
    String url = Apiconfiguration.baseurl + Apiconfiguration.unblockDoc;

    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(payload),
      );
      log(response.body);
      if (response.statusCode == 200) {
        // Status changed successfully in the API
        log('User status changed in the API.');
      } else {
        // Handle API request errors
        log('Failed to change user status in the API. Status code: ${response.statusCode}');
      }
    } catch (e) {
      log('Error occurred while making the API request: $e');
    }
  }

  Future<void> verifyDoc(int index) async {
    Map<String, dynamic> payload = {
      "doctorId": doctorDetailsModel!.doctors[index].id
    };
    String url = Apiconfiguration.baseurl + Apiconfiguration.verifydoc;
    try {
      http.Response response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(payload));
          log(response.body);
      if (response.statusCode == 200) {
        log('Doctor verify Sucessfuly');
      } else {
        log('Failed to change user status in the API. Status code: ${response.statusCode}');
      }
    } catch (e) {
      log('Error occurred while making the API request: $e');
    }
  }

  Future<void> unverifyDoc(int index) async {
    Map<String, dynamic> payload = {
      "doctorId": doctorDetailsModel!.doctors[index].id
    };
    String url = Apiconfiguration.baseurl + Apiconfiguration.unverifydoc;
    try {
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(payload)
      );
      log(response.body);
      if(response.statusCode ==200){
        log('Sucessfuly unverify');
      }else{
         log('Failed to change user status in the API. Status code: ${response.statusCode}');
      }
    } catch (e) {
      log('Error occurred while making the API request: $e');
    }
  }
}
