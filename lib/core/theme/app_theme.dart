import 'package:flutter/material.dart';

class AppColors {
  static const Color primario = Color(0xFFBF360C); // rojo-naranja ladrillo
  static const Color primarioClaro = Color(0xFFFFF0DC); // crema
  static const Color acento = Color(0xFF37474F); // gris acero
  static const Color textoPrincipal = Color(0xFF212121);
  static const Color textoSecundario = Color(0xFF607D8B);
  static const Color fondo = Color(0xFFF4F4F4);
}

class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
}

class AppRadius {
  static const double chico = 12;
  static const double tarjeta = 16;
  static const double banner = 24;
}

ThemeData buildAppTheme() {
  final colorScheme = ColorScheme.fromSeed(
    seedColor: AppColors.primario,
    primary: AppColors.primario,
    secondary: AppColors.acento,
    surface: Colors.white,
  );

  return ThemeData(
    useMaterial3: true,
    fontFamily: 'Roboto',
    colorScheme: colorScheme,
    scaffoldBackgroundColor: AppColors.fondo,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.acento,
      foregroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
    ),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.textoPrincipal,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.textoPrincipal,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: AppColors.textoSecundario,
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.primarioClaro,
      selectedColor: AppColors.primario,
      checkmarkColor: Colors.white,
      showCheckmark: false,
      labelStyle: const TextStyle(
        color: AppColors.textoPrincipal,
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ),
      secondaryLabelStyle: const TextStyle(
        color: Colors.white,
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ),
      side: const BorderSide(color: AppColors.textoPrincipal),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.symmetric(horizontal: 4),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      hintStyle: const TextStyle(color: AppColors.textoSecundario),
      prefixIconColor: AppColors.textoSecundario,
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.chico),
        borderSide: const BorderSide(color: AppColors.acento),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.chico),
        borderSide: const BorderSide(color: AppColors.acento),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.chico),
        borderSide: const BorderSide(color: AppColors.primario, width: 2),
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.acento,
      contentTextStyle: const TextStyle(color: Colors.white),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primario,
        foregroundColor: Colors.white,
        disabledBackgroundColor: AppColors.primario.withValues(alpha: 0.4),
        disabledForegroundColor: Colors.white70,
        elevation: 0,
        minimumSize: const Size(0, 48),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.chico),
        ),
      ),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.tarjeta),
      ),
    ),
  );
}
