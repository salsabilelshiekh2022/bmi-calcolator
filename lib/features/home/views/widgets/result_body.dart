import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'result_box.dart';

class ResultBody extends StatelessWidget {
  const ResultBody({super.key, required this.status, required this.result});
  final String status;
  final int result;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 60.h),
      child: ResultBox(
        status: status,
        result: result,
      ),
    );
  }
}
