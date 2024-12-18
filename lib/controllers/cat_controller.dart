import 'dart:convert';

import 'package:kitten_app/domain/models/cat_details.dart';
import 'package:kitten_app/services/cat_services.dart';

class CatController {
  final CatServices _services = CatServices();

  Future<List<CatDetails>> getCats() async {
    try {
      final response = await _services.getCats();

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);

        return jsonData.map((cat) => CatDetails.fromJson(cat)).toList();
      } else {
        throw Exception('Failed to load cats: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching cats: $e');
    }
  }

  Future<CatImage?> getCatImage(String imageId) async {
    try {
      final response = await _services.getCatImage(imageId);

      if(response.statusCode == 200) {
          final jsonData = json.decode(response.body);
          return CatImage.fromJson(jsonData);
      }else {
        throw Exception('Failed to load cat image: ${response.statusCode}');
      }

    } catch(e){
      throw Exception('Error fetching cats: $e');
    }
  }

  Future<CatImage?> getRandomCatImage() async {
    try {
      final response = await _services.getRandomCatImage();

      if(response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return CatImage.fromJson(jsonData[0]);
      }else {
        throw Exception('Failed to load random image cat: ${response.statusCode}');
      }

    } catch(e){
      throw Exception('Error fetching cats: $e');
    }
  }

}
