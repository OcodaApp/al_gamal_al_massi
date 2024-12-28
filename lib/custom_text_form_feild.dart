import 'package:flutter/material.dart';

class AuthCustomTextFormField extends StatelessWidget {
  final String hintText;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextEditingController? controller;

  const AuthCustomTextFormField({
    super.key,
    required this.hintText,
    this.validator,
    this.obscureText = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
