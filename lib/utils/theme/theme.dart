import 'package:e_mart/utils/theme/custom_themes/appbar_theme.dart';
import 'package:e_mart/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:e_mart/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:e_mart/utils/theme/custom_themes/chip_theme.dart';
import 'package:e_mart/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:e_mart/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:e_mart/utils/theme/custom_themes/text_field_theme.dart';
import 'package:e_mart/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class TAppTheme{
  TAppTheme._();    //private constructor

  static ThemeData lightTheme=ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: const Color.fromRGBO(32, 201, 151, 1),
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    chipTheme: TChipTheme.lightChipTheme
  );
  static ThemeData darkTheme=ThemeData(
     useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: const Color.fromRGBO(32, 201, 151, 1),
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.darkTextTheme ,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    chipTheme: TChipTheme.darkChipTheme
  );
}