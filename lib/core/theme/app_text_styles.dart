import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

abstract class AppTextStyle {
  static TextStyle font24BlackWeight600 = TextStyle(
    fontSize: 24.sp,
    color: AppColors.black,
    fontWeight: FontWeight.w600,
  );
  static TextStyle font16GreyWeight400 = TextStyle(
    fontSize: 16.sp,
    color: AppColors.grey,
    fontWeight: FontWeight.w400,
  );

  static TextStyle font16WhiteWeight600 = TextStyle(
    fontSize: 16.sp,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );

  static TextStyle font22BlackWeight500 = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.w500,
    fontSize: 22.sp,
  );

  static TextStyle font20BlackWeight400 = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.w400,
    fontSize: 20.sp,
  );

  static TextStyle font14Grey400Weight400 = TextStyle(
    fontSize: 14.sp,
    color: Colors.grey[400],
    fontWeight: FontWeight.w400,
  );

  static TextStyle font32GreyWeight500 = TextStyle(
    fontSize: 32.sp,
    color: AppColors.grey,
    fontWeight: FontWeight.w500,
  );

  static TextStyle font18GreenWeight600 = TextStyle(
    fontSize: 18.sp,
    color: Colors.green,
    fontWeight: FontWeight.w600,
  );

  static TextStyle font60GreyWeight600 = TextStyle(
      fontSize: 60.sp,
      color: AppColors.grey,
      fontWeight: FontWeight.w600,
      letterSpacing: 3);

  static TextStyle font18BlackWeight400 = TextStyle(
    fontSize: 18.sp,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
  );

  static TextStyle font18GreyWeight500 = TextStyle(
    fontSize: 18.sp,
    color: AppColors.grey,
    fontWeight: FontWeight.w500,
  );
}
