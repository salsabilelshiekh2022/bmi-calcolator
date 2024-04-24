import 'package:bmi_test2/features/previous_results/cubit/previous_results_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_text_styles.dart';
import 'widgets/previous_results_body.dart';

class PreviousResultsPage extends StatelessWidget {
  const PreviousResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Previous Results',
          style: AppTextStyle.font22BlackWeight500,
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => PreviousResultsCubit(),
        child: const PreviousResultsBody(),
      ),
    );
  }
}
