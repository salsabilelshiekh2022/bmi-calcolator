import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/spacing.dart';
import '../../cubit/home_cubit.dart';
import 'plus_or_minus_button.dart';

class InputBox extends StatelessWidget {
  const InputBox(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.number,
      this.plus,
      this.minus});
  final String title;
  final String subTitle;
  final int number;
  final void Function()? plus;
  final void Function()? minus;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(12.w),
          width: double.infinity,
          height: 150.h,
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
              Text(title, style: AppTextStyle.font20BlackWeight400),
              Text(
                subTitle,
                style: AppTextStyle.font14Grey400Weight400,
              ),
              verticalSpace(24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PlusOrMinusButton(
                    plusOrMinus: 'plus',
                    onTap: plus,
                  ),
                  Text(
                    number.toString(),
                    style: AppTextStyle.font32GreyWeight500,
                  ),
                  PlusOrMinusButton(
                    plusOrMinus: 'minus',
                    onTap: minus,
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
