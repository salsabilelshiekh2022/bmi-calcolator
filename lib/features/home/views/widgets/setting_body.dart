import 'package:bmi_test2/core/routing/routes.dart';
import 'package:bmi_test2/core/utils/extensions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/widgets/app_button.dart';

class SettingBody extends StatelessWidget {
  const SettingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 40.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppButton(
                text: 'Show results',
                onTap: () {
                  context.pushReplacementNamed(Routes.previousResultsPage);
                }),
            verticalSpace(24),
            AppButton(
                text: 'Log out',
                onTap: () async {
                  context.pushReplacementNamed(Routes.signInPage);
                  await FirebaseAuth.instance.signOut();
                  getIt<CacheHelper>().clearData();
                }),
          ],
        ));
  }
}
