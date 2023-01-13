// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_unicornova_panel/auth/register/view_model/register_view_model.dart';

class CustomTextFormFieldPassword extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  bool isPasswordValidate = false;
  RegisterViewModel registerViewModel;

  CustomTextFormFieldPassword({
    required this.controller,
    required this.hintText,
    this.isPasswordValidate = false,
    required this.registerViewModel,
  });
  @override
  State<CustomTextFormFieldPassword> createState() =>
      _CustomTextFormFieldPasswordState();
}

class _CustomTextFormFieldPasswordState
    extends State<CustomTextFormFieldPassword> {
  bool _passwordVisible = false;

  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    RegisterViewModel registerViewModel = widget.registerViewModel;
    return TextFormField(
      controller: widget.controller,
      onChanged: (value) {
        widget.isPasswordValidate
            ? registerViewModel.password = value
            : registerViewModel.passwordValidate = value;
      },
      keyboardType: TextInputType.text,
      obscureText: !_passwordVisible, //This will obscure text dynamically
      decoration: InputDecoration(
        labelText: 'Parola',
        hintText: widget.hintText,
        // Here is key idea
        suffixIcon: IconButton(
          icon: Icon(
            // Based on passwordVisible state choose the icon
            _passwordVisible ? Icons.visibility : Icons.visibility_off,
            color: Theme.of(context).primaryColorDark,
          ),
          onPressed: () {
            // Update the state i.e. toogle the state of passwordVisible variable
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
      ),
    );
  }
}
