import 'package:bmi_test2/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required this.text,
      this.onTap,
      this.color = AppColors.black,
      this.width = double.infinity});
  final String text;
  final void Function()? onTap;
  final Color color;
  final double width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 56.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(22.r),
        ),
        child: Center(
          child: Text(
            text,
            style: AppTextStyle.font16WhiteWeight600,
          ),
        ),
      ),
    );
  }
}
