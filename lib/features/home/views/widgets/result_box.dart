import 'package:bmi_test2/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_button.dart';

class ResultBox extends StatelessWidget {
  const ResultBox({super.key, required this.status, required this.result});
  final String status;
  final int result;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 350.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 40.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.13),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              result.toString(),
              style: AppTextStyle.font60GreyWeight600,
            ),
            Text(
              status,
              style: AppTextStyle.font18GreenWeight600,
            ),
            const Spacer(),
            AppButton(text: 'Go to home ', onTap: () => context.pop()),
          ],
        ));
  }
}
