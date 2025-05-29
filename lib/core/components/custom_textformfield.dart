import 'package:flutter/material.dart';
import 'package:tasky_app_iti/core/styles/colors.dart';

class CustomTextformfield extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final String? Function(String?)? validator;
  final int? maxLines ;

  const CustomTextformfield({
    super.key,
    required this.controller,
    required this.hint,
    this.validator,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLines: maxLines??1,
      style: const TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        fillColor: const Color(0xFF282828),
        filled: true,
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
          color: const Color(0xFF6D6D6D),
        ),
        errorStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
          color: redErrorColor,
        ),
        labelStyle: const TextStyle(color: Color(0xFF6D6D6D)),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(16),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
