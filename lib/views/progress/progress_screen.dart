import 'package:flutter/material.dart';
import 'package:fittrack_evolution/theme/app_theme.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Text('Progress', style: AppTextStyles.headlineLg(color: AppColors.primaryFixed)),
      ),
    );
  }
}
