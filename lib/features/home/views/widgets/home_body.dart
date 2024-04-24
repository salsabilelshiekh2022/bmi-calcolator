import 'package:bmi_test2/core/utils/extensions.dart';
import 'package:bmi_test2/features/home/views/widgets/input_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/app_button.dart';
import '../../cubit/home_cubit.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.only(left: 24.w, right: 24.w, top: 32.h, bottom: 40.h),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(24),
                InputBox(
                  title: 'Height',
                  subTitle: 'cm',
                  number: context.read<HomeCubit>().height,
                  plus: () => context.read<HomeCubit>().heightPlus(),
                  minus: () => context.read<HomeCubit>().heightMinus(),
                ),
                verticalSpace(24),
                InputBox(
                  title: 'Weight',
                  subTitle: 'kg',
                  number: context.read<HomeCubit>().weight,
                  plus: () => context.read<HomeCubit>().weightPlus(),
                  minus: () => context.read<HomeCubit>().weightMinus(),
                ),
                verticalSpace(24),
                InputBox(
                  title: 'Age',
                  subTitle: 'year',
                  number: context.read<HomeCubit>().age,
                  plus: () => context.read<HomeCubit>().agePlus(),
                  minus: () => context.read<HomeCubit>().ageMinus(),
                ),
                verticalSpace(24),
                const Spacer(),
                AppButton(
                    text: 'Calculate',
                    onTap: () {
                      context.read<HomeCubit>().calculateBmi();
                      context.pushNamed(Routes.resultPage, arguments: {
                        'result': context.read<HomeCubit>().result,
                        'status': context.read<HomeCubit>().status,
                      });
                    }),
              ],
            );
          },
        ));
  }
}
