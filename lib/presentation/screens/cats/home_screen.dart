import 'package:flutter/material.dart';
import 'package:kitten_app/presentation/views/HomeView.dart';

class HomeScreen extends StatelessWidget {

  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeView()
    );
  }
}
