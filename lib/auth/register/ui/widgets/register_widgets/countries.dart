import 'package:flutter/material.dart';
import 'package:flutter_unicornova_panel/auth/register/view_model/register_view_model.dart';
import 'package:provider/provider.dart';

class CountriesWidget extends StatefulWidget {
  CountriesWidget(this.registerViewModel, {super.key});
  RegisterViewModel registerViewModel;

  @override
  State<CountriesWidget> createState() => _CountriesWidgetState();
}

class _CountriesWidgetState extends State<CountriesWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      RegisterViewModel registerViewModel =
          Provider.of<RegisterViewModel>(context, listen: false);
      registerViewModel.getCountries(); // Üleleri getir.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 150),
      margin: const EdgeInsets.symmetric(horizontal: 25),
      decoration: const BoxDecoration(),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Ülke seç :"),
          const SizedBox(
            width: 10,
          ),
          widget.registerViewModel.statusCountries.index == 1
              ? const CircularProgressIndicator()
              : DropdownButton( 
                  // Initial Value
                  value: widget.registerViewModel.countriesSelectedItem,
                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),
                  // Array list of items
                  items: widget.registerViewModel.countriesMenuItems
                      .map((String country) {
                    return DropdownMenuItem( 
                      value: country,
                      child: Text(country),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (newValue) {
                    widget.registerViewModel.countriesSelectedItem = newValue!;
                  },
                ),
        ],
      ),
    );
  }
}
