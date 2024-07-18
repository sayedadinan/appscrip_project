import 'package:appscrip_project/utils/app_text.dart';
import 'package:flutter/material.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 92, 101, 109),
        Color.fromARGB(255, 39, 32, 32)
      ])),
      child: const Center(
        child: AppText(text: 'Appscrip Users', size: 0.07),
      ),
    );
  }
}
