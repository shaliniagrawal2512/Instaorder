import 'package:untitled/components/place_autocomplete.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

abstract class BasePlaceRepository {
  Future<List<PlaceAutoComplete>?> getAutocomplete(String searchInput) async {}
}

class PlaceRepository extends BasePlaceRepository {
  final String key = 'AIzaSyCU85_Xt-DGTl_5JOlKhDiQ7ExnRqQOIW0';
  final String types = 'geocode';
  Future<List<PlaceAutoComplete>> getAutocomplete(String searchInput) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json&input=$searchInput&types=$types&keys=$key';
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var results = json['predictions'] as List;
    if (results.isEmpty) print("hello world");
    return results.map((place) => PlaceAutoComplete.fromJson(place)).toList();
  }
}
