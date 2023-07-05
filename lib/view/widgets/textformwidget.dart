import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class TextformFeildWidget extends StatelessWidget {
  const TextformFeildWidget({
    super.key,
    required this.controller, required this.labelText, this.padding=EdgeInsets.zero,
  });

  final TextEditingController controller;
  final String labelText;
  final EdgeInsets padding;
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        validator: (value){
          if(value == null || value.isEmpty){
            return '$labelText is needed';
          }
          return null;
        },
        controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: cBlack),
         border: 
         OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        
         )
        ),
        
      ),
    );
  }
}
