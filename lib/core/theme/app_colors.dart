import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ── Base Palette ──
  static const Color background = Color(0xFF0D0F1A);
  static const Color card = Color(0xFF141726);
  static const Color border = Color(0xFF1F2438);
  static const Color muted = Color(0xFF1F2438);
  static const Color mutedForeground = Color(0xFF8890A8);
  static const Color foreground = Color(0xFFEEF0F7);

  // ── Primary (Brand Violet 252°) ──
  static const Color primary = Color(0xFF7C5CFF);
  static const Color primaryForeground = Color(0xFFFFFFFF);
  static const Color secondary = Color(0xFF1F1640);
  static const Color secondaryForeground = Color(0xFF9A7AFF);

  // ── Semantic ──
  static const Color success = Color(0xFF2ECC71);
  static const Color warning = Color(0xFFF5A623);
  static const Color destructive = Color(0xFFFF5C5C);
  static const Color destructiveForeground = Color(0xFFFFFFFF);

  // ── Gradient Stops ──
  static const Color gradientHeroStart = Color(0xFF2A1F7A);
  static const Color gradientHeroMid = Color(0xFF4F43D8);
  static const Color gradientHeroEnd = Color(0xFF6C5FE6);

  static const Color gradientCtaStart = Color(0xFF7C5CFF);
  static const Color gradientCtaEnd = Color(0xFF8B5CF6);

  // ── Gradient Lists ──
  static const List<Color> heroGradient = [
    gradientHeroStart,
    gradientHeroMid,
    gradientHeroEnd,
  ];

  static const List<Color> ctaGradient = [
    gradientCtaStart,
    gradientCtaEnd,
  ];

  // ── Pre-computed Alpha Variants ──

  /// primary at 10% — icon wrappers, tinted surfaces
  static const Color primary10 = Color(0x1A7C5CFF);

  /// primary at 25% — tap highlights, active borders
  static const Color primary25 = Color(0x407C5CFF);

  /// border at 50% — card borders, structural separation
  static const Color border50 = Color(0x801F2438);

  /// border at 45% — inset section dividers
  static const Color border45 = Color(0x731F2438);

  /// white at 20% — budget progress-bar track
  static const Color white20 = Color(0x33FFFFFF);

  /// white at 90% — budget progress-bar fill
  static const Color white90 = Color(0xE6FFFFFF);

  /// card at 95% — nav-bar background with blur
  static const Color card95 = Color(0xF2141726);

  // ── Fab Glow ──
  static const Color fabGlow = Color(0x807850FF);

  // ── Helpers ──

  /// Returns [color] with the given [opacity] (0.0 → 1.0).
  static Color withAlpha(Color color, double opacity) {
    final a = (opacity * 255).round().clamp(0, 255);
    return Color.fromARGB(a, color.red, color.green, color.blue);
  }

  /// Returns [primary] at [opacity] (0.0 → 1.0).
  static Color primaryAlpha(double opacity) => withAlpha(primary, opacity);

  /// LinearGradient for hero surfaces (135°).
  static const LinearGradient heroGradientLinear = LinearGradient(
    colors: heroGradient,
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// LinearGradient for primary CTA buttons (135°).
  static const LinearGradient ctaGradientLinear = LinearGradient(
    colors: ctaGradient,
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
