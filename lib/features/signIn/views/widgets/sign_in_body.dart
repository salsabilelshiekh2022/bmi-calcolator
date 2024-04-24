import 'package:bmi_test2/core/routing/routes.dart';
import 'package:bmi_test2/core/utils/extensions.dart';
import 'package:bmi_test2/core/utils/snack_bar.dart';
import 'package:bmi_test2/features/signIn/cubit/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/app_button.dart';
import 'loading_button.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Body mass index',
              style: AppTextStyle.font24BlackWeight600,
            ),
            verticalSpace(6),
            SizedBox(
              width: 250.w,
              child: Text(
                'Knowing your BMI is important part of best healthy',
                textAlign: TextAlign.center,
                style: AppTextStyle.font16GreyWeight400,
              ),
            ),
            verticalSpace(100),
            Image.asset(AppAssets.bmi),
            const Spacer(),
            BlocConsumer<SignInCubit, SignInState>(
              listener: (context, state) {
                if (state is SignInSuccessState) {
                  showSnackBar('Signed in successfully', Colors.green);
                  context.pushReplacementNamed(Routes.homePage);
                } else if (state is SignInFailureState) {
                  showSnackBar(state.message, Colors.red);
                }
              },
              builder: (context, state) {
                return state is SignInLoadingState
                    ? const LoadingButton()
                    : AppButton(
                        text: 'Sign in as guest',
                        onTap: () {
                          context.read<SignInCubit>().signInAnonymous();
                        },
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
