import 'package:api/data/models/country.dart';
import 'package:api/data/provider/country_api.dart';

class CountryService {
  final _api = CountryApi();
  
  Future<List<Country>?> getAllCountries() async {
    return _api.getAllCountries();
  }
}