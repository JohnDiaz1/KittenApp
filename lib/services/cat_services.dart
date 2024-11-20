import 'package:http/http.dart' as http;
import 'package:kitten_app/config/constants/endpoints.dart';
import 'dart:async';

class CatServices {
//TODO: Revisar esto de los endpoints y Api Key para hacerlo bien
  Future<http.Response> getCats() async {
      try {
        final response = await http.get(
          Uri.parse(getBreeds),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'x-api-key': apiKey!
          }
        );
        return response;
      } catch (e) {
        throw Exception('Error in service to obtain cats: ${e.toString()}');
      }
  }
  
  Future<http.Response> getCatImage(String imageId) async {
    try {
      final response = await http.get(
          Uri.parse("$getCatImageById/$imageId"),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'x-api-key': apiKey!
          }
      );
      return response;
    } catch (e) {
      throw Exception('Error in service to obtain image cats: ${e.toString()}');
    }
  }

  Future<http.Response> getRandomCatImage() async {
    try {
      final response = await http.get(
          Uri.parse("$getCatRandomImage?limit=1"),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'x-api-key': apiKey!
          }
      );
      return response;
    } catch (e) {
      throw Exception('Error in service to obtain image cats: ${e.toString()}');
    }
  }

}