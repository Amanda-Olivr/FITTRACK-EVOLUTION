import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ─── COLOR TOKENS (High-Energy Sports System) ──────────────────────────────
class AppColors {
  // Backgrounds / Surfaces
  static const Color background = Color(0xFF131313);
  static const Color surface = Color(0xFF131313);
  static const Color surfaceContainerLowest = Color(0xFF0E0E0E);
  static const Color surfaceContainerLow = Color(0xFF1C1B1B);
  static const Color surfaceContainer = Color(0xFF201F1F);
  static const Color surfaceContainerHigh = Color(0xFF2A2A2A);
  static const Color surfaceContainerHighest = Color(0xFF353534);
  static const Color surfaceBright = Color(0xFF3A3939);
  static const Color surfaceVariant = Color(0xFF353534);

  // Cards (from HTML: #121212 / #1A1A1A)
  static const Color cardSurface = Color(0xFF121212);
  static const Color cardActive = Color(0xFF1A1A1A);
  static const Color cardBorder = Color(0xFF222222);

  // Primary — Electric Lime
  static const Color primary = Color(0xFFFFFFFF);
  static const Color primaryFixed = Color(0xFFCAF300);    // Electric Lime #D4FF00 / Stitch: #CAF300
  static const Color primaryFixedDim = Color(0xFFB0D500);
  static const Color primaryContainer = Color(0xFFCAF300);
  static const Color onPrimary = Color(0xFF2A3400);
  static const Color onPrimaryFixed = Color(0xFF171E00);
  static const Color onPrimaryContainer = Color(0xFF596C00);

  // Secondary — Neon Orange
  static const Color secondary = Color(0xFFFFB693);
  static const Color secondaryContainer = Color(0xFFFE6B00);
  static const Color onSecondary = Color(0xFF561F00);
  static const Color onSecondaryContainer = Color(0xFF572000);

  // On-Surface / Text
  static const Color onSurface = Color(0xFFE5E2E1);
  static const Color onSurfaceVariant = Color(0xFFC5C9AC);
  static const Color onBackground = Color(0xFFE5E2E1);

  // Outline
  static const Color outline = Color(0xFF8F9378);
  static const Color outlineVariant = Color(0xFF444932);

  // Error
  static const Color error = Color(0xFFFFB4AB);
  static const Color onError = Color(0xFF690005);
  static const Color errorContainer = Color(0xFF93000A);

  // Intensity gradient: Lime → Orange
  static const List<Color> intensityGradient = [
    Color(0xFFCAF300),
    Color(0xFFFE6B00),
  ];
}

// ─── TYPOGRAPHY ────────────────────────────────────────────────────────────
class AppTextStyles {
  static TextStyle displayLg({Color? color}) => GoogleFonts.anton(
        fontSize: 48,
        fontWeight: FontWeight.w400,
        height: 52 / 48,
        letterSpacing: 48 * 0.02,
        color: color ?? AppColors.onSurface,
      );

  static TextStyle headlineLg({Color? color}) => GoogleFonts.anton(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        height: 36 / 32,
        letterSpacing: 32 * 0.02,
        color: color ?? AppColors.onSurface,
      );

  static TextStyle headlineMd({Color? color}) => GoogleFonts.anton(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        height: 28 / 24,
        letterSpacing: 24 * 0.01,
        color: color ?? AppColors.onSurface,
      );

  static TextStyle statLg({Color? color}) => GoogleFonts.anton(
        fontSize: 40,
        fontWeight: FontWeight.w400,
        height: 1.0,
        letterSpacing: 40 * -0.01,
        color: color ?? AppColors.onSurface,
      );

  static TextStyle bodyLg({Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.inter(
        fontSize: 18,
        fontWeight: fontWeight ?? FontWeight.w400,
        height: 28 / 18,
        color: color ?? AppColors.onSurface,
      );

  static TextStyle bodyMd({Color? color, FontWeight? fontWeight}) =>
      GoogleFonts.inter(
        fontSize: 16,
        fontWeight: fontWeight ?? FontWeight.w400,
        height: 24 / 16,
        color: color ?? AppColors.onSurface,
      );

  static TextStyle bodySm({Color? color}) => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 20 / 14,
        color: color ?? AppColors.onSurfaceVariant,
      );

  static TextStyle labelBold({Color? color}) => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        height: 16 / 12,
        letterSpacing: 12 * 0.05,
        color: color ?? AppColors.onSurfaceVariant,
      );
}

// ─── SPACING ───────────────────────────────────────────────────────────────
class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;
  static const double gutter = 16;
  static const double marginMobile = 16;
}

// ─── THEME DATA ────────────────────────────────────────────────────────────
class AppTheme {
  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.dark(
        surface: AppColors.surface,
        primary: AppColors.primaryFixed,
        onPrimary: AppColors.onPrimaryFixed,
        secondary: AppColors.secondary,
        onSecondary: AppColors.onSecondary,
        error: AppColors.error,
        onError: AppColors.onError,
        onSurface: AppColors.onSurface,
        outline: AppColors.outline,
      ),
      textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
    );
  }
}
