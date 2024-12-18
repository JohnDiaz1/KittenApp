import 'package:flutter/material.dart';
import 'package:kitten_app/domain/models/cat_details.dart';
import 'package:kitten_app/presentation/widgets/widgets.dart';

class CatScreen extends StatefulWidget {
  static const name = 'cat-screen';
  final CatDetails catDetails;

  const CatScreen({super.key, required this.catDetails});

  @override
  State<CatScreen> createState() => _CatScreenState();
}

class _CatScreenState extends State<CatScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: size.height / 2,
                  width: double.infinity,
                  color: Colors.orange,
                  child: Image.network(
                     widget.catDetails.image!.url,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomText(
                                  text: widget.catDetails.name,
                                  fontSize: 25,
                                isBold: true,
                              ),
                              CustomText(
                                text: '(${widget.catDetails.temperament})',
                                fontSize: 16,
                                textColor: Colors.grey,
                                maxLines: 3,
                              ),
                              const SizedBox(height: 8),
                              Container(
                                width: double.infinity,
                                child: Wrap(
                                  alignment: WrapAlignment.start,
                                  spacing: 10.0,
                                  children: [
                                    CustomCarViewDetails(
                                        text: '${widget.catDetails.adaptability} Adaptability',
                                        backgroundColor: Colors.green,
                                        icon: const Icon(Icons.favorite, color: Colors.green,)

                                    ),
                                    CustomCarViewDetails(
                                      text: '${widget.catDetails.socialNeeds} Social',
                                      backgroundColor: Colors.blue,
                                      icon: const Icon(Icons.social_distance, color: Colors.blue),
                                    ),
                                    CustomCarViewDetails(
                                      text: '${widget.catDetails.dogFriendly.toString()} Dog Friendly',
                                      backgroundColor: Colors.purple,
                                      icon: const Icon(Icons.pets, color: Colors.purple),
                                    ),
                                    CustomCarViewDetails(
                                      text: '${widget.catDetails.grooming} Grooming',
                                      backgroundColor: Colors.teal,
                                      icon: const Icon(Icons.bathtub, color: Colors.teal),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              CustomText(
                                icon: const Icon(Icons.location_on, color: Colors.red),
                                  text: widget.catDetails.origin,
                                  fontSize: 15
                              )
                            ],
                          ),
                        ),
                      ),
                       const SizedBox(height: 16),
                      const CustomText(
                        text: "Description",
                        isBold: true,
                        fontSize: 20,
                      ),
                      const SizedBox(height: 16),
                      CustomText(
                          text: widget.catDetails.description,
                          fontSize: 16,
                          textColor: Colors.grey[700],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
