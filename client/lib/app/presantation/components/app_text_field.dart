import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {super.key,
      required this.controller,
      required this.labelText,
      this.obscureText = false});

  final TextEditingController controller;
  final String labelText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: emptyValodator,
      maxLength: 1,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
    );
  }

  String? emptyValodator(String? value) {
    if (value!.isEmpty) {
      return "Обязательное полу";
    }
    return null;
  }
}
