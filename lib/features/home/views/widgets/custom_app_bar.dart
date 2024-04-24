import 'package:bmi_test2/core/routing/routes.dart';
import 'package:bmi_test2/core/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

AppBar customAppBar(BuildContext context) {
  return AppBar(
    title: Text(
      'BMI calculator',
      style: AppTextStyle.font22BlackWeight500,
    ),
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        context.pushNamed(Routes.settingPage);
      },
      icon: const Icon(
        Icons.menu,
        color: AppColors.black,
      ),
    ),
  );
}
