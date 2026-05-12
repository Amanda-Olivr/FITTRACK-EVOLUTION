import 'package:flutter/material.dart';
import 'package:fittrack_evolution/theme/app_theme.dart';
import 'package:fittrack_evolution/views/main_shell.dart';

void main() {
  runApp(const FitTrackApp());
}

class FitTrackApp extends StatelessWidget {
  const FitTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fit Track Evolution',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: const MainShell(),
    );
  }
}
