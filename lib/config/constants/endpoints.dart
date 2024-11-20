import 'package:flutter_dotenv/flutter_dotenv.dart';

String? home = dotenv.env['URL_API_CAT'] ?? 'URL_API_CAT not found';
String? apiKey = dotenv.env['API_KEY_CAT'] ?? 'API_KEY_CAT not found';

String get getBreeds => '$home/breeds';
String get getCatImageById => '$home/images';
String get getCatRandomImage => '$home/images/search';