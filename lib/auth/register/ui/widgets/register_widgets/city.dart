// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../view_model/register_view_model.dart';

class CityWidget extends StatefulWidget {
  RegisterViewModel registerViewModel;

  CityWidget({
    super.key,
    required this.registerViewModel,
  });

  @override
  State<CityWidget> createState() => _CityWidgetState();
}

class _CityWidgetState extends State<CityWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<RegisterViewModel>(context, listen: false)
          .getCities(); // İlleri getir.
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
          const Text("Şehir seç :"),
          const SizedBox(
            width: 10,
          ),
          widget.registerViewModel.statusCities.index == 1
              ? const CircularProgressIndicator()
              : DropdownButton(
                  value: widget.registerViewModel.citySelectedItem,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: widget.registerViewModel.citiesMenuItems
                      .map((String city) {
                    return DropdownMenuItem(
                      value: city,
                      child: Text(city),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (newValue) {
                    widget.registerViewModel.citySelectedItem = newValue!;
                  },
                ),
        ],
      ),
    );
  }
}
