import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:kitten_app/presentation/widgets/widgets.dart';
import 'package:kitten_app/presentation/screens/providers/cats_providers.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final catBreedsAsyncValue = ref.watch(catBreedsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kitten App'),
      ),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only( left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                });
              },
            ),
          ),
          Expanded(
              child: catBreedsAsyncValue.when(
                data: (catBreeds) {
                  final filteredCats = catBreeds.where((cat) {
                    return cat.name.toLowerCase().contains(searchQuery);
                  }).toList();

                  return ListView.builder(
                    itemCount: filteredCats.length,
                    itemBuilder: (context, index) {
                      final cat = filteredCats[index];
                      return CustomCardViewCats(catDetails: cat);
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, stack) => Center(child: Text('Error: $err')),
              ),
          ),
        ],
      )
    );
  }
}