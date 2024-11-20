import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kitten_app/domain/models/cat_details.dart';
import 'package:kitten_app/controllers/cat_controller.dart';

final catApiServiceProvider = Provider((ref) => CatController());

final catBreedsProvider = FutureProvider<List<CatDetails>>((ref) async {
  final service = ref.read(catApiServiceProvider);
  final catBreeds = await service.getCats();

  return catBreeds;
});
