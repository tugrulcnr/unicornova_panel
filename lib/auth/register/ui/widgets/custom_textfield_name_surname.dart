 import 'package:flutter/material.dart'; 
import 'package:flutter_unicornova_panel/auth/register/view_model/register_view_model.dart';

class CustomTextFieldNameAndSurname extends StatelessWidget {
  RegisterViewModel registerViewModel;
  String hintText;
  TextEditingController controller;
  bool isName=false;

  CustomTextFieldNameAndSurname({super.key,  
    required this.registerViewModel,
    required this.hintText,
    required this.controller,
    this.isName = false,
  }) ;
 

  @override
  Widget build(BuildContext context) {
      RegisterViewModel registerViewModel=   this.registerViewModel;
    return TextField(
      onChanged: (value) {
       // TODO: debugPrint( isName.toString());
       // debugPrint(value);
          isName 
            ? registerViewModel.name = value
            : registerViewModel.surname = value;
      },
      controller:   controller,
      decoration: InputDecoration(hintText:   hintText),
    );
  }
}
