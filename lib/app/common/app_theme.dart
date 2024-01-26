import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTheme {
  static themeData() => ThemeData(
        colorScheme: const ColorScheme.light(
          primary: AppColors.primaryColor,
          secondary: AppColors.primaryColor,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          brightness: Brightness.light,
        ),
        fontFamily: 'Manrope',
        useMaterial3: true,
        textTheme: GoogleFonts.manropeTextTheme(
          const TextTheme(
            headlineLarge: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor),
            headlineMedium: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: AppColors.blackTextColor,
            ),
            headlineSmall: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: AppColors.blackTextColor,
            ),
            titleLarge: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.blackTextColor,
            ),
            titleMedium: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.blackTextColor,
            ),
            titleSmall: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.blackTextColor,
            ),
            bodyLarge: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.blackTextColor,
            ),
            bodyMedium: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.blackTextColor,
            ),
            bodySmall: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.blackTextColor,
            ),
          ),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: AppColors.primaryColor,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            padding: const EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: AppColors.lightGrey,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: AppColors.lightGrey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: AppColors.lightGrey,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: AppColors.lightGrey,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: AppColors.lightGrey,
            ),
          ),
          errorStyle: const TextStyle(
            color: Colors.red,
          ),
          labelStyle: const TextStyle(
            color: Colors.black,
          ),
          hintStyle: TextStyle(
            color: Colors.black.withOpacity(0.5),
          ),
        ),
      );

  static TextStyle hyperLinkStyle() {
    return const TextStyle(
      color: AppColors.primaryColor,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.underline,
    );
  }
}
