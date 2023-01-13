// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import 'package:flutter_unicornova_panel/auth/register/view_model/register_view_model.dart';

class PhoneWidget extends StatefulWidget {
  RegisterViewModel registerViewmodel;
  PhoneWidget({
    Key? key,
    required this.registerViewmodel,
  }) : super(key: key);

  @override
  State<PhoneWidget> createState() => _PhoneWidgetState();
}

class _PhoneWidgetState extends State<PhoneWidget> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    RegisterViewModel registerViewModel = widget.registerViewmodel;

    String initialCountryCode =
        registerViewModel.initialCountryCode; // Telefon numarsı başlangıç kodu
    String phoneNumber = registerViewModel.phoneNumber;
    PhoneNumber number =
        PhoneNumber(isoCode: initialCountryCode, phoneNumber: phoneNumber);

    return Column(
      children: <Widget>[
        InternationalPhoneNumberInput(
          hintText: "Telefon numarsı giriniz",
          onInputChanged: (PhoneNumber number) {
            debugPrint(number.phoneNumber);
            registerViewModel.phoneNumber = number.phoneNumber!;
          },
          onInputValidated: (bool value) {
            registerViewModel.validatedPhoneNumber = value;
            debugPrint(value.toString());
          },
          selectorConfig: const SelectorConfig(
            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
          ),
          ignoreBlank: false,
          autoValidateMode: AutovalidateMode.disabled,
          selectorTextStyle: const TextStyle(color: Colors.black),
          initialValue: number,
          textFieldController: controller,
          formatInput: true,
          keyboardType: const TextInputType.numberWithOptions(
              signed: true, decimal: true),
          inputBorder: const OutlineInputBorder(),
          onSaved: (PhoneNumber number) {
            debugPrint('On Saved: $number');
          },
        ),
      ],
    );
  }
}
