import 'package:flutter/material.dart' hide Colors, Text;
import 'package:pokedex/src/presentation/design_system/tokens.dart';

import '../../../gen/fonts.gen.dart';

final ThemeData mainTheme = ThemeData(
  primarySwatch: Colors.primary,
  fontFamily: FontFamily.poppins,
  scaffoldBackgroundColor: Colors.primary,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.primary),
  textTheme: const TextTheme(
    titleMedium: body3TextStyle,
  ),
  inputDecorationTheme: InputDecorationTheme(
    iconColor: Colors.dark,
    fillColor: Colors.white,
    filled: true,
    isCollapsed: true,
    isDense: false,
    hintStyle: body3TextStyle.copyWith(
      color: Colors.medium,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide.none,
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 8,
    ),
    prefixIconColor: Colors.primary,
  ),
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(color: Colors.white),
    backgroundColor: Colors.primary,
    iconTheme: IconThemeData(
      color: Colors.primary,
    ),
  ),
);
