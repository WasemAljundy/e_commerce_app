import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final String labelText;
  final String? hintText;
  final bool obscureText;
  final Color textColor;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final String? errorText;

  AppTextField({
    required this.textEditingController,
    this.textInputType = TextInputType.text,
    required this.labelText,
    this.hintText,
    this.textColor = Colors.black,
    this.obscureText = false,
    required this.prefixIcon,
    this.suffixIcon,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      keyboardType: textInputType,
      obscureText: obscureText,
      decoration: InputDecoration(
        counterText: '',
        labelText: labelText,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: Icon(prefixIcon),
        suffixIcon: Icon(suffixIcon),
        errorText: errorText,
        errorBorder: getBorder(borderColor: Colors.red),
        border: getBorder(),
        disabledBorder: getBorder(borderColor: Colors.red.shade200),
        enabledBorder: getBorder(),
        focusedBorder: getBorder(borderColor: Colors.blue),
        constraints: const BoxConstraints(
          minHeight: 10,
          maxHeight: 100,
        ),
      ),
    );
  }

  OutlineInputBorder getBorder({Color borderColor = Colors.grey}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: borderColor,
        width: 1.5,
      ),
    );
  }
}
