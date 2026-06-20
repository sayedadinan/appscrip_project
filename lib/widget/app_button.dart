// ignore_for_file: must_be_immutable

import 'package:appscrip_project/utils/mediaquery.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function() function;
  final String text;
  final double fontSize;
  final Color buttonTextColor;
  final Color borderColor;

  FontWeight? fontWeight;

  final List<Color> gradientColors;

  CustomButton({
    super.key,
    required this.function,
    required this.text,
    this.gradientColors = const [Color(0xFF3120D8), Color(0xFF9C0AB6)],
    required this.fontSize,
    required this.buttonTextColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(60),
      child: InkWell(
        borderRadius: BorderRadius.circular(60),
        onTap: function,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(13),
          ),
          child: Center(
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: mediaquerywidth(0.12, context),
                    vertical: mediaquerywidth(0.04, context)),
                child: Text(
                  text,
                  style: TextStyle(color: Colors.white),
                )),
          ),
        ),
      ),
    );
  }
}
