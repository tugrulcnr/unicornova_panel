import 'package:flutter/material.dart';
import 'package:flutter_unicornova_panel/auth/register/ui/widgets/register_widgets/email.dart';
import 'package:flutter_unicornova_panel/auth/register/ui/widgets/register_widgets/name_surname.dart';
import 'package:flutter_unicornova_panel/auth/register/ui/widgets/register_widgets/password.dart';
import 'package:flutter_unicornova_panel/auth/register/ui/widgets/register_widgets/phone.dart';
import 'package:provider/provider.dart';
import '../view_model/register_view_model.dart';
import '../ui/widgets/register_widgets/city.dart';
import '../ui/widgets/register_widgets/countries.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    RegisterViewModel registerViewModel =
        Provider.of<RegisterViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        // elevation: 0.0,
        //  shadowColor: Colors.white,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              registerViewModel.checkItAndDecrease();
            }),
        actions: [
          Center(
            child: Text(
              "${registerViewModel.registerWidgetCount}/6",
              style: const TextStyle(fontSize: 25),
            ),
          ),
          const SizedBox(
            width: 15,
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: getRegisterWidget(registerViewModel),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FloatingActionButton(
          onPressed: (() {
            registerViewModel.checkItAndIncrease(context);
          }),
          child: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }

  Widget getRegisterWidget(RegisterViewModel registerViewModel) {
    switch (registerViewModel.registerWidgetCount) {
      case 1:
        return CountriesWidget(registerViewModel);
      case 2:
        return CityWidget(
          registerViewModel: registerViewModel,
        );
      case 3:
        return PhoneWidget(
          registerViewmodel: registerViewModel,
        );
      case 4:
        return EmailWidget(
          registerViewModel: registerViewModel,
        );
      case 5:
        return NameSurnameWidget(
          registerViewModel: registerViewModel,
        );

      case 6:
        return PasswordWidget(
          registerViewModel: registerViewModel,
        );
      default:
        return const Center(
          child: Text("Sonraki widget gösterildi.."),
        );
    }
  }
}
