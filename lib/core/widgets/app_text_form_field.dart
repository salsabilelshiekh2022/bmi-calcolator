import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField(
      {super.key,
      this.onChanged,
      required this.initialValue,
      required this.label});

  final void Function(String)? onChanged;
  final int initialValue;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      cursorColor: AppColors.grey,
      validator: (value) => value!.isEmpty ? 'Required' : null,
      initialValue: initialValue.toString(),
      style: AppTextStyle.font16GreyWeight400,
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        errorBorder: inputBorder(
          Colors.red,
        ),
        focusedBorder: inputBorder(AppColors.black),
        enabledBorder: inputBorder(AppColors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.white),
        ),
        label: Text(label, style: AppTextStyle.font16GreyWeight400),
      ),
    );
  }
}

InputBorder inputBorder(Color color) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16.0),
    borderSide: BorderSide(color: color),
  );
}
