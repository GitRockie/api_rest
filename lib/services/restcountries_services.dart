import 'dart:convert';
import 'dart:developer';

import 'package:api_rest/models/country_v3_model_model.dart';
import 'package:http/http.dart' as http;

class ResCountriesServicesV3 {
  Future<void> getCountries() async {
    //var url = Uri.parse("https://restcountries.com/v2/name/$pais");
    var url = Uri.parse("https://restcountries.com/v3/all");
    //print(url);
    await http.get(url).then((response) {
      //print(response.body);

      final List<dynamic> bodyDecoded = jsonDecode(response.body);
      //print(bodyDecoded);

      /// final peru = Country.fromJson(bodyDecoded);
      /// type 'List<dynamic>' is not a subtype of type 'Map<String, dynamic>'
      /// (Instance of 'Country')
      final paises = bodyDecoded.map((element) {
        try {
          return CountryV3Model.fromJson(element);
        } catch (e) {
          log("$e");
          return CountryV3Model();
        }
      });

      ///[Instance of 'Country']
      final List<CountryV3Model> listPaises = paises.toList();

      //print(paises);
      //print(listPaises.first.name);

      for (var i = 0; i < listPaises.length; i++) {
        print('El país es: ${listPaises[i].name?.official}');
        print('La población es: ${listPaises[i].population?.toDouble()}');
        print('La capital es: ${listPaises[i].capital?.first}');
      }
    });
  }
}
