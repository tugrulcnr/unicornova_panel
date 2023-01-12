// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_unicornova_panel/auth/register/view_model/register_view_model.dart';

class EmailWidget extends StatefulWidget {
  RegisterViewModel registerViewModel;
  EmailWidget({
    Key? key,
    required this.registerViewModel,
  }) : super(key: key);

  @override
  State<EmailWidget> createState() => _EmailWidgetState();
}

class _EmailWidgetState extends State<EmailWidget> {
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    RegisterViewModel registerViewModel = widget.registerViewModel;
    emailController.text = widget.registerViewModel.emailAdress;
    return Container(
      padding: const EdgeInsets.all(15),
      child: Center(
        child: TextField(
          onChanged: (value) {
            registerViewModel.emailAdress = value;
          },
          onEditingComplete: () => registerViewModel.emailAdress,
          controller: emailController,
          decoration: const InputDecoration(hintText: "E-mail Adresi gir"),
        ),
      ),
    );
  }
}
