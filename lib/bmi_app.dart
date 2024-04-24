import 'package:bmi_test2/features/previous_results/cubit/previous_results_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/utils/snack_bar.dart';
import 'core/theme/app_colors.dart';

import 'core/routing/app_router.dart';

class BmiApp extends StatelessWidget {
  final AppRouter appRouter;
  const BmiApp({
    super.key,
    required this.appRouter,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: BlocProvider(
        create: (context) => PreviousResultsCubit(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          scaffoldMessengerKey: scaffoldKey,
          theme: ThemeData(
            fontFamily: 'Poppins',
            primaryColor: AppColors.black,
            appBarTheme: const AppBarTheme(
              elevation: 0.0,
              backgroundColor: Colors.white,
            ),
            scaffoldBackgroundColor: AppColors.lightBlue,
          ),
          onGenerateRoute: appRouter.generateRoute,
        ),
      ),
    );
  }
}
