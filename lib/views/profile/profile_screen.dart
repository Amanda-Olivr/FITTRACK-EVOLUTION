import 'package:flutter/material.dart';
import 'package:fittrack_evolution/theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Text('Profile', style: AppTextStyles.headlineLg(color: AppColors.primaryFixed)),
      ),
    );
  }
}
