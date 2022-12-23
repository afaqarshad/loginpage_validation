import 'package:flutter/material.dart';

class MyTextFormFields extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData icon;
  final String validationMsg;

  const MyTextFormFields({
    super.key,
    required this.controller,
    required this.labelText,
    required this.icon,
    required this.validationMsg,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return validationMsg;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
        prefixIcon: Icon(icon),
      ),
    );
  }
}
