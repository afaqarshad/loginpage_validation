import 'package:flutter/material.dart';

class MyTextFormFields extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData icon;
  final String validationMsg;
  // final bool? obsText;

  const MyTextFormFields({
    super.key,
    required this.controller,
    required this.labelText,
    required this.icon,
    required this.validationMsg,
    // this.obsText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // obscureText: obsText!,
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
