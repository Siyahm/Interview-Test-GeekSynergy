import 'package:api_test/helpers/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.text,
    required this.controller,
    this.validation,
    this.perffixIcon,
    this.keyboard,
  });

  final String text;
  final TextEditingController controller;
  final String? Function(String?)? validation;
  final Widget? perffixIcon;
  final TextInputType? keyboard;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: TextFormField(
        toolbarOptions: const ToolbarOptions(paste: false),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: keyboard,
        validator: validation,
        style: const TextStyle(fontSize: 18),
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: perffixIcon,
          border: InputBorder.none,
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.errorColor),
          ),
          fillColor: AppColors.textFieldColor,
          filled: true,
          label: Text(
            text,
            style: const TextStyle(
              color: AppColors.greyColor,
            ),
          ),
        ),
      ),
    );
  }
}
