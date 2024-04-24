import 'package:bmi_test2/core/utils/extensions.dart';
import 'package:bmi_test2/features/previous_results/cubit/previous_results_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/models/bmi_result.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_form_field.dart';

class PreviousResultsEditBottomSheet extends StatelessWidget {
  const PreviousResultsEditBottomSheet({super.key, required this.result});
  final BmiResult result;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          top: 40.h,
          bottom: MediaQuery.of(context).viewInsets.bottom == 0 ? 16.h : 236.h,
        ),
        child: SizedBox(
          height: 470.h,
          child: Form(
            key: context.read<PreviousResultsCubit>().formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Edit BMI', style: AppTextStyle.font20BlackWeight400),
              verticalSpace(24),
              AppTextFormField(
                initialValue: result.height,
                label: 'Height',
                onChanged: (value) {
                  context.read<PreviousResultsCubit>().height =
                      int.parse(value);
                },
              ),
              verticalSpace(16),
              AppTextFormField(
                initialValue: result.weight,
                label: 'Weight',
                onChanged: (value) {
                  context.read<PreviousResultsCubit>().weight =
                      int.parse(value);
                },
              ),
              verticalSpace(16),
              AppTextFormField(
                initialValue: result.age,
                label: 'Age',
                onChanged: (value) {
                  context.read<PreviousResultsCubit>().age = int.parse(value);
                },
              ),
              verticalSpace(40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppButton(
                    text: 'Cancle',
                    onTap: () {
                      context.pop();
                    },
                    width: 160.w,
                  ),
                  AppButton(
                    text: 'Edit',
                    onTap: () {
                      context.read<PreviousResultsCubit>().calculateBmi(result);
                      context.pop();
                    },
                    width: 160.w,
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
