import 'package:appscrip_project/utils/mediaquery.dart';
import 'package:flutter/material.dart';

class Inputfield extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String hinttext;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final Icon? icon;
  final bool? obscure;
  const Inputfield({
    this.controller,
    super.key,
    this.label,
    required this.hinttext,
    this.keyboardType,
    this.validator,
    this.icon,
    this.onChanged,
    this.obscure, // Use the constructor parameter directly
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: mediaquerywidth(0.01, context),
          right: mediaquerywidth(0.01, context),
          top: mediaqueryheight(0.02, context)),
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        validator: validator,
        onChanged: onChanged,
        decoration: InputDecoration(
          fillColor: Color.fromARGB(255, 176, 164, 164),
          filled: true,
          labelText: label,
          hintText: hinttext,
          hintStyle: TextStyle(color: Colors.white),
          prefixIcon: icon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        keyboardType: keyboardType,
      ),
    );
  }
}

class PasswordField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String hinttext;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final Icon? icon;

  const PasswordField({
    this.controller,
    super.key,
    this.label,
    required this.hinttext,
    this.keyboardType,
    this.validator,
    this.icon,
    this.onChanged, // Use the constructor parameter directly
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: mediaquerywidth(0.01, context),
          right: mediaquerywidth(0.01, context),
          top: mediaqueryheight(0.02, context)),
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        validator: validator,
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          fillColor: Color.fromARGB(255, 176, 164, 164),
          filled: true,
          labelText: label,
          hintText: hinttext,
          hintStyle: TextStyle(color: Colors.white),
          prefixIcon: icon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        keyboardType: keyboardType,
      ),
    );
  }
}
