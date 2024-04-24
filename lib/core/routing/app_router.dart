import 'package:bmi_test2/features/home/views/home_page.dart';
import 'package:bmi_test2/features/home/views/result_page.dart';
import 'package:bmi_test2/features/previous_results/views/previous_results_page.dart';
import 'package:flutter/material.dart';

import '../../features/home/views/setting_page.dart';
import '../../features/signIn/views/sign_in_page.dart';
import '../database/cache/cache_helper.dart';
import '../di/dependency_injection.dart';
import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.resultPage:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => ResultPage(
            result: args['result'],
            status: args['status'],
          ),
          settings: settings,
        );
      case Routes.signInPage:
        return MaterialPageRoute(
          builder: (_) => const SignInPage(),
        );
      case Routes.homePage:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case Routes.settingPage:
        return MaterialPageRoute(
          builder: (_) => const SettingPage(),
        );
      case Routes.previousResultsPage:
        return MaterialPageRoute(
          builder: (_) => const PreviousResultsPage(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => getIt<CacheHelper>().getData(key: "userId") != null
              ? const HomePage()
              : const SignInPage(),
        );
    }
  }
}
