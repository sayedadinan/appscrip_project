import 'package:flutter/material.dart';
import 'package:appscrip_project/utils/mediaquery.dart';

class AppText extends StatelessWidget {
  final double size;
  final String text;
  final FontWeight? weight;

  const AppText({
    super.key,
    required this.text,
    required this.size,
    this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return const LinearGradient(
          colors: [
            Color.fromARGB(255, 178, 220, 255),
            Color.fromARGB(255, 234, 185, 50)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(bounds);
      },
      child: Text(
        text,
        style: TextStyle(
          fontWeight: weight,
          fontSize: mediaquerywidth(size, context),
          color: Colors.white,
        ),
      ),
    );
  }
}
