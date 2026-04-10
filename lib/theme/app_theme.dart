import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const background = Color(0xFFEDE7F6);     // svetla ljubicasta pozadina
  static const surface = Color(0xFFFFF3E0);         // svetlo narandzasta povrsina
  static const card = Color(0xFFFFF3E0);            // svetlo narandzaste kartice
  static const primary = Color(0xFF5E35B1);         // ljubicasta
  static const primaryLight = Color(0xFF7C6DD8);
  static const accent = Color(0xFFE65100);          // jako narandzasta za zivotinje
  static const warning = Color(0xFFD97706);
  static const danger = Color(0xFFDC2626);
  static const success = Color(0xFF059669);
  static const textPrimary = Color(0xFF1A1A2E);
  static const textSecondary = Color(0xFF374151);
  static const textMuted = Color(0xFF6B7280);
  static const glassBorder = Color(0x15000000);
  static const glassBackground = Color(0x08000000);
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
