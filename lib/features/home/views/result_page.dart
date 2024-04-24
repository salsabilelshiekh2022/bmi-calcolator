import 'package:flutter/material.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/result_body.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.result, required this.status});
  final int result;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: ResultBody(
        status: status,
        result: result,
      ),
    );
  }
}
