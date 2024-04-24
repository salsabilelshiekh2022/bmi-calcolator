import 'package:flutter/material.dart';
import '../../../core/theme/app_text_styles.dart';
import 'widgets/setting_body.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Setting',
          style: AppTextStyle.font22BlackWeight500,
        ),
        centerTitle: true,
      ),
      body: const SettingBody(),
    );
  }
}
