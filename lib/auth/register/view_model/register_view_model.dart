import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_unicornova_panel/auth/register/services/register_service.dart';
import 'package:flutter_unicornova_panel/utils/utils.dart';

enum StatusCountries { initial, loading, finished }
enum StatusCities { initial, loading, finished }

class RegisterViewModel with ChangeNotifier {
  RegisterViewModel() {
 // getCountries();
  }

  final RegisterService _registerService = RegisterService();
  StatusCountries _statusCountries = StatusCountries.initial;
  StatusCities _statusCities = StatusCities.initial;

  List<String> _countriesMenuItemsList = [];
  List<String> _citiesMenuItemsList = [];

  dynamic _countrySelectedItem = '';
  dynamic _citySelectedItem = '';

  int _registerWidgetCount = 1;

  String _phoneNumber = "";
  bool _validatedPhoneNumber = false;
  String _initialCountryCode = "TR";

  String _emailAdress = "";

  String _name = "";
  String _surname = "";

  String _password = "";
  String _passwordValidate = "";

  StatusCountries get statusCountries => _statusCountries;
  StatusCities get statusCities => _statusCities;
  dynamic get countriesSelectedItem => _countrySelectedItem;
  int get registerWidgetCount => _registerWidgetCount;
  dynamic get citySelectedItem => _citySelectedItem;
  List<String> get countriesMenuItems => _countriesMenuItemsList;
  List<String> get citiesMenuItems => _citiesMenuItemsList;
  String get phoneNumber => _phoneNumber;
  bool get validatedPhoneNumber => _validatedPhoneNumber;
  String get initialCountryCode => _initialCountryCode;
  String get emailAdress => _emailAdress;
  String get name => _name;
  String get surname => _surname;
  String get password => _password;
  String get passwordValidate => _passwordValidate;

  set countriesSelectedItem(dynamic country) {
    _countrySelectedItem = country;
    notifyListeners();
  }

  set citySelectedItem(dynamic city) {
    _citySelectedItem = city;
    notifyListeners();
  }

  set phoneNumber(String phoneNumber) => _phoneNumber = phoneNumber;
  set validatedPhoneNumber(bool validatedPhoneNumber) =>
      _validatedPhoneNumber = validatedPhoneNumber;
  set initialCountryCode(String initialCountryCode) =>
      _initialCountryCode = initialCountryCode;
  set emailAdress(String emailAdress) => _emailAdress = emailAdress;
  set name(String name) => _name = name;
  set surname(String surname) => _surname = surname;
  set password(String password) => _password = password;
  set passwordValidate(String passwordValidate) =>
      _passwordValidate = passwordValidate;

  void _registerWidgetCountIncrease() {
    _registerWidgetCount = _registerWidgetCount + 1;
   // ignore: todo
   // _runMethodsForRegisterWidget(registerWidgetCount); //TODO: Silinecek sat??r.
    notifyListeners();
  }

  void _registerWidgetCountDecrease() {
    _registerWidgetCount = _registerWidgetCount - 1;
   // ignore: todo
   // _runMethodsForRegisterWidget(registerWidgetCount); TODO: Silinecek sat??r.
    notifyListeners();
  }

  void checkItAndIncrease(BuildContext context) {
    switch (registerWidgetCount) {
      case 3:
        if (phoneNumber.isNotEmpty && validatedPhoneNumber == true) {
          // Telefon numaras?? ge??erliyse ve bo?? de??ilse kay??ta devam et sonraki widget getir.
          _registerWidgetCountIncrease();
          debugPrint("Telefon numaras?? : $phoneNumber");
        } else {
          showSnackBar(context, "L??tfen ge??erli bir telefon numars?? giriniz");
        }
        break;
      case 4:
        if (EmailValidator.validate(emailAdress)) {
          // Girilen de??er , e mail adresi ise devam et.
          _registerWidgetCountIncrease();
          debugPrint(emailAdress);
        } else {
          showSnackBar(context, "L??tfen ge??erli bir e-mail adresi giriniz.");
        }
        break;
      case 5:
        if (name.isEmpty) {
          showSnackBar(context, "L??tfen ge??erli bir isim giriniz");
        } else if (surname.isEmpty) {
          showSnackBar(context, "L??tfen ge??erli bir soyisim giriniz");
        } else {
          _registerWidgetCountIncrease(); // ??sim ve Soyisim de??erleri girilmi?? ise devame et.
        }
        break;
      case 6:
        if (password.length >= 5 && passwordValidate.length >= 5) {
          if (password == passwordValidate) {
            _registerWidgetCountIncrease(); // parola en az 5 karakterse ve birbiri ile ayn?? ise devam et.
          } else {
            showSnackBar(context, "Parolalar??n ayn?? oldu??undan emin olun.");
          }
        } else {
          showSnackBar(context, "Parolan??z en az 5 karakter olmal??");
        }
        break;
        case 7:
        // ignore: prefer_interpolation_to_compose_strings
        debugPrint("??lke : "+countriesSelectedItem);
        // ignore: prefer_interpolation_to_compose_strings
        debugPrint("sehir : "+citySelectedItem);
        debugPrint("telefon : $phoneNumber");
        debugPrint("email : $emailAdress");
        debugPrint("isim : $name");
        debugPrint("soyisim : $surname");
        debugPrint("??ifre : $password");
        debugPrint("??ifre Tekrar : $passwordValidate");
        break;
      default:
        _registerWidgetCountIncrease();
    }
  }

  void checkItAndDecrease() {  
    // ignore: todo
    _registerWidgetCountDecrease(); // TODO: Buray?? tekrar d??????n bir eksiklik olabilir
  }

  Future<void> getCountries() async {
    _statusCountries = StatusCountries.loading;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    _countriesMenuItemsList = await _registerService.getCountries();

    countriesSelectedItem = countriesSelectedItem == "" ? _countriesMenuItemsList[0] :countriesSelectedItem; // TODO: Gelen veriler i??erisinde ??ehirlerden bir tanesini countriesSelectedItem'a atamak zorunday??z  

    _statusCountries = StatusCountries.finished;
    await Future.delayed(const Duration(seconds: 1));
    notifyListeners();
  }

  Future<void> getCities() async {
    _statusCities = StatusCities.loading;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    _citiesMenuItemsList = await _registerService.getCities();
    citySelectedItem = citySelectedItem == "" ?  _citiesMenuItemsList[0] : citySelectedItem  ; //  TODO: Gelen veriler i??erisinde ??ehirlerden bir tanesini buna vermek zorunday??z

    _statusCities = StatusCities.finished;
    await Future.delayed(const Duration(seconds: 1));
    notifyListeners();
  }

}
