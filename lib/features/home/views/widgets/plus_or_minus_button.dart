import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';

class PlusOrMinusButton extends StatelessWidget {
  const PlusOrMinusButton({super.key, required this.plusOrMinus, this.onTap});

  final String plusOrMinus;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: AppColors.black)),
        child: Center(
          child: Icon(
            plusOrMinus == 'plus' ? Icons.add : Icons.remove,
            color: AppColors.black,
          ),
        ),
      ),
    );
  }
}
