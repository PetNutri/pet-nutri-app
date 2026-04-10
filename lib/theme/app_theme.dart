import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // "Natural Organic" tema — zelena + krem + narandzasta
  static const background = Color(0xFF3DD98B);      // duboka zelena pozadina
  static const surface = Color(0xFFF7FAFC);         // krem/skoro bela
  static const card = Color(0xFFF7FAFC);            // krem kartice
  static const primary = Color(0xFF635BFF);         // ljubicasta za glavne akcije
  static const primaryLight = Color(0xFF8B85FF);
  static const accent = Color(0xFFFFA500);          // narandzasta za dugmad
  static const warning = Color(0xFFD97706);
  static const danger = Color(0xFFDC2626);
  static const success = Color(0xFF059669);
  static const textPrimary = Color(0xFF1A202C);     // skoro crna
  static const textSecondary = Color(0xFF2D3748);   // tamno siva
  static const textMuted = Color(0xFF718096);       // srednja siva
  static const glassBorder = Color(0x12000000);
  static const glassBackground = Color(0x06000000);
}

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.accent,
        surface: AppColors.surface,
      ),
      textTheme: GoogleFonts.interTextTheme(ThemeData.light().textTheme),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}

class GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double borderRadius;

  const GlassCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.borderRadius = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: const Color(0x0A000000)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(16),
        child: child,
      ),
    );
  }
}
