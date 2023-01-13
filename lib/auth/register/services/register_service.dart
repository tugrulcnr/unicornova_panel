 
class RegisterService {
  dynamic countries = "";
  dynamic cities="";
  Future<List<String>> getCountries() async {

    countries = [
      'Türkiye',
      'Azerbeycan',
      'Amerika',
      'Almanya',
      'Danimarka',
    ];

    return countries;
  }

  Future<List<String>> getCities() async {
    cities = [
      'Ankara',
      'İstanbul',
      'Konya',
      'Kırşehir',
      'Malatya',
    ];
  return cities;
  }
}
