import 'package:bmi_test2/features/previous_results/views/widgets/previous_result_edit_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/models/bmi_result.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/spacing.dart';
import '../../cubit/previous_results_cubit.dart';

class PreviousResultsItem extends StatelessWidget {
  const PreviousResultsItem({super.key, required this.result});
  final BmiResult result;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      width: double.infinity,
      height: 220.h,
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
          ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('Height : ', style: AppTextStyle.font18BlackWeight400),
                  Text('${result.height}',
                      style: AppTextStyle.font18GreyWeight500),
                ],
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => PreviousResultsEditBottomSheet(
                      result: result,
                    ),
                  );
                },
                child: const Text(
                  'Edit',
                  style: TextStyle(color: Colors.blue),
                ),
              )
            ],
          ),
          verticalSpace(12),
          Row(
            children: [
              Text('Weight : ', style: AppTextStyle.font18BlackWeight400),
              Text('${result.weight}', style: AppTextStyle.font18GreyWeight500),
            ],
          ),
          verticalSpace(12),
          Row(
            children: [
              Text('Age : ', style: AppTextStyle.font18BlackWeight400),
              Text('${result.age}', style: AppTextStyle.font18GreyWeight500),
            ],
          ),
          verticalSpace(12),
          const Divider(),
          Row(
            children: [
              Text('Status : ', style: AppTextStyle.font18BlackWeight400),
              Text(result.status, style: AppTextStyle.font18GreenWeight600),
            ],
          ),
          verticalSpace(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('BMI : ', style: AppTextStyle.font18BlackWeight400),
                  Text('${result.bmi}',
                      style: AppTextStyle.font18GreenWeight600),
                ],
              ),
              InkWell(
                onTap: () {
                  context.read<PreviousResultsCubit>().deleteResult(result.id);
                },
                child: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.red),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
