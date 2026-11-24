import 'package:flutter/material.dart';

/// Brightness-aware colors for surfaces that a Material [ColorScheme] does not
/// describe: cards, fields, borders, hints and muted text.
///
/// Read it from a widget with `context.palette`.
@immutable
class AppPalette extends ThemeExtension<AppPalette> {
  const AppPalette({
    required this.surface,
    required this.card,
    required this.fieldFill,
    required this.border,
    required this.divider,
    required this.hint,
    required this.subtitle,
    required this.mutedIcon,
    required this.accent,
    required this.onPrimary,
    required this.selectedSurface,
    required this.softSurface,
    required this.placeholder,
    required this.shadow,
  });

  final Color surface;
  final Color card;
  final Color fieldFill;
  final Color border;
  final Color divider;
  final Color hint;
  final Color subtitle;
  final Color mutedIcon;
  final Color accent;
  final Color onPrimary;
  final Color selectedSurface;
  final Color softSurface;
  final Color placeholder;
  final Color shadow;

  static const light = AppPalette(
    surface: Colors.white,
    card: Color(0xFFF3F5F7),
    fieldFill: Color(0xFFF9FAFA),
    border: Color(0xFFE6E9E9),
    divider: Color(0xFFDCDEDE),
    hint: Color(0xFF949D9E),
    subtitle: Color(0xFF4E5556),
    mutedIcon: Color(0xFF949D9E),
    accent: Color(0xFF1F5E3B),
    onPrimary: Colors.white,
    selectedSurface: Color(0xFFF1F4F2),
    softSurface: Color(0xFFEEF8ED),
    placeholder: Colors.grey,
    shadow: Color(0x0A000000),
  );

  static const dark = AppPalette(
    surface: Color(0xFF1E1E1E),
    card: Color(0xFF242424),
    fieldFill: Color(0xFF2A2A2A),
    border: Color(0xFF414141),
    divider: Color(0xFF3A3A3A),
    hint: Color(0xFFAAB2AD),
    subtitle: Color(0xFFCBD2CD),
    mutedIcon: Color(0xFFAAB2AD),
    accent: Color(0xFF7BD7A0),
    onPrimary: Colors.white,
    selectedSurface: Color(0xFF2A4033),
    softSurface: Color(0xFF1D3528),
    placeholder: Color(0xFF424242),
    shadow: Color(0x40000000),
  );

  @override
  AppPalette copyWith({
    Color? surface,
    Color? card,
    Color? fieldFill,
    Color? border,
    Color? divider,
    Color? hint,
    Color? subtitle,
    Color? mutedIcon,
    Color? accent,
    Color? onPrimary,
    Color? selectedSurface,
    Color? softSurface,
    Color? placeholder,
    Color? shadow,
  }) {
    return AppPalette(
      surface: surface ?? this.surface,
      card: card ?? this.card,
      fieldFill: fieldFill ?? this.fieldFill,
      border: border ?? this.border,
      divider: divider ?? this.divider,
      hint: hint ?? this.hint,
      subtitle: subtitle ?? this.subtitle,
      mutedIcon: mutedIcon ?? this.mutedIcon,
      accent: accent ?? this.accent,
      onPrimary: onPrimary ?? this.onPrimary,
      selectedSurface: selectedSurface ?? this.selectedSurface,
      softSurface: softSurface ?? this.softSurface,
      placeholder: placeholder ?? this.placeholder,
      shadow: shadow ?? this.shadow,
    );
  }

  @override
  AppPalette lerp(covariant AppPalette? other, double t) {
    if (other == null) return this;
    return AppPalette(
      surface: Color.lerp(surface, other.surface, t)!,
      card: Color.lerp(card, other.card, t)!,
      fieldFill: Color.lerp(fieldFill, other.fieldFill, t)!,
      border: Color.lerp(border, other.border, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      hint: Color.lerp(hint, other.hint, t)!,
      subtitle: Color.lerp(subtitle, other.subtitle, t)!,
      mutedIcon: Color.lerp(mutedIcon, other.mutedIcon, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      selectedSurface: Color.lerp(selectedSurface, other.selectedSurface, t)!,
      softSurface: Color.lerp(softSurface, other.softSurface, t)!,
      placeholder: Color.lerp(placeholder, other.placeholder, t)!,
      shadow: Color.lerp(shadow, other.shadow, t)!,
    );
  }
}

extension AppPaletteContext on BuildContext {
  AppPalette get palette =>
      Theme.of(this).extension<AppPalette>() ?? AppPalette.light;
}
