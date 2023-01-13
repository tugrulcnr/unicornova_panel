// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_unicornova_panel/auth/register/ui/widgets/custom_textfield_name_surname.dart';
import '../../../view_model/register_view_model.dart';

class NameSurnameWidget extends StatefulWidget {
  RegisterViewModel registerViewModel;
  NameSurnameWidget({
    Key? key,
    required this.registerViewModel,
  }) : super(key: key);

  @override
  State<NameSurnameWidget> createState() => _NameSurnameWidgetState();
}

class _NameSurnameWidgetState extends State<NameSurnameWidget> {
  final nameController = TextEditingController();
  final surnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    RegisterViewModel registerViewModel = widget.registerViewModel;
    nameController.text = registerViewModel.name;
    surnameController.text = registerViewModel.surname;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomTextFieldNameAndSurname(
              registerViewModel: registerViewModel,
              hintText: "İsim Giriniz",
              controller: nameController,
              isName: true,
            ),
            CustomTextFieldNameAndSurname(
                registerViewModel: registerViewModel,
                hintText: "Soyisim Giriniz",
                controller: surnameController),
          ],
        ),
      ),
    );
  }
}
