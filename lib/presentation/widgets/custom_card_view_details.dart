import 'package:flutter/material.dart';
import 'package:kitten_app/presentation/widgets/custom_text.dart';

class CustomCarViewDetails extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Icon icon;

  const CustomCarViewDetails({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.icon
  });

  Color lightenColor(Color color, [double amount = 0.3]) {
    return Color.lerp(color, Colors.white, amount)!;
  }

  @override
  Widget build(BuildContext context) {
    final lighterBackground = lightenColor(backgroundColor, 0.8).withOpacity(0.8);

    return Card(
      color: lighterBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
          padding: const EdgeInsets.all(10),
        child: CustomText(
          text: text,
          textColor: backgroundColor,
          fontSize: 15,
          isBold: true,
          icon: icon,
        ),
      ),
    );
  }
}
