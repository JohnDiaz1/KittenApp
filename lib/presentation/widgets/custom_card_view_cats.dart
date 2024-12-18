import 'package:flutter/material.dart';
import 'package:kitten_app/presentation/widgets/widgets.dart';
import 'package:kitten_app/domain/models/cat_details.dart';
import 'package:go_router/go_router.dart';
import 'package:kitten_app/controllers/cat_controller.dart';

class CustomCardViewCats extends StatelessWidget {
  final CatDetails catDetails;

  CustomCardViewCats({super.key, required this.catDetails});

  final CatController catController = CatController();

  Future<CatImage?> _fetchImageUrl() async {
    if (catDetails.image == null || catDetails.referenceImageId!.isEmpty || catDetails.referenceImageId == null) {
      return await catController.getRandomCatImage();
    } else {
      return await catController.getCatImage(catDetails.referenceImageId!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go('/home/0/cat', extra: catDetails),
      child: Card.outlined(
        surfaceTintColor: Colors.white,
        margin: const EdgeInsets.only(left: 30, right: 30, top: 10),
        elevation: 7,
        shape: RoundedRectangleBorder(
          side: const BorderSide(),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: FutureBuilder<CatImage?>(
                    future: _fetchImageUrl(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return const Center(child: Icon(Icons.error, size: 50, color: Colors.red));
                      } else {
                        catDetails.referenceImageId = snapshot.data!.id;
                        return Image.network(
                          snapshot.data!.url,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(
                              child: Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: catDetails.name,
                    fontSize: 25,
                    isBold: true,
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 10.0,
                    children: [
                      CustomCarViewDetails(
                        text: '${catDetails.lifeSpan} Years',
                        backgroundColor: Colors.green,
                        icon: const Icon(Icons.favorite, color: Colors.green),
                      ),
                      CustomCarViewDetails(
                        text: '${catDetails.weight.metric} Kg',
                        backgroundColor: Colors.blue,
                        icon: const Icon(Icons.fitness_center_outlined, color: Colors.blue),
                      ),
                      CustomCarViewDetails(
                        text: '${catDetails.intelligence.toString()} Intelligence',
                        backgroundColor: Colors.purple,
                        icon: const Icon(Icons.lightbulb, color: Colors.purple),
                      ),
                      CustomCarViewDetails(
                        text: '${catDetails.energyLevel} Energy',
                        backgroundColor: Colors.teal,
                        icon: const Icon(Icons.battery_charging_full, color: Colors.teal),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
