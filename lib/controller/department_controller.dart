import 'dart:developer';
import 'dart:io';

import 'package:admin_side_flutter/service/add_department_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DepartmentAddProvider extends ChangeNotifier {
  TextEditingController dptnameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  File? photo;
  GlobalKey<FormState> globalformKey = GlobalKey<FormState>();

  Future<void> getPhoto() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    } else {
      final photoTemp = File(image.path);
      photo = photoTemp;
      log(photo.toString());
    }
    notifyListeners();
  }

  Future<bool> addDepartment(BuildContext context) async {
    if (globalformKey.currentState!.validate()) {
      bool status = await addDpartment(
        dptnameController.text,
        dptnameController.text,
        photo!.path,
        context,
      );
      if (status == true) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }
}
