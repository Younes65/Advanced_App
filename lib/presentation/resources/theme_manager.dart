
import 'package:advanced_app/presentation/resources/color_manager.dart';
import 'package:advanced_app/presentation/resources/font_manager.dart';
import 'package:advanced_app/presentation/resources/style_manager.dart';
import 'package:advanced_app/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme(){
  return ThemeData(
    // main_screen colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark:ColorManager.darkPrimary ,
    disabledColor: ColorManager.darkGray,
    // card theme
    cardTheme:CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.Gray,
      elevation: AppSize.s4,
    ),

      // app bar theme
    appBarTheme: AppBarTheme(
        centerTitle: true,
      shadowColor: ColorManager.Gray ,
      elevation: AppSize.s4 ,
      color: ColorManager.primary,
    titleTextStyle: getRegularStyle(color: ColorManager.white)),

      // button theme
    buttonTheme: ButtonThemeData(
      disabledColor: ColorManager.Gray,
      buttonColor: ColorManager.primary,
      shape:  StadiumBorder()  ,
      splashColor: ColorManager.lightPrimary ,
    ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: getRegularStyle(color: ColorManager.white , fontSize:  FontSize.s17),
          backgroundColor: ColorManager.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s12)
          )
        )
  ),
    textTheme: TextTheme(
      displayLarge: getSemiBoldStyle(color: ColorManager.darkGray, fontSize: FontSize.s16) ,
      titleMedium: getMediumStyle(color: ColorManager.primary, fontSize: FontSize.s16) ,
      bodySmall: getRegularStyle(color: ColorManager.darkGray , fontSize: FontSize.s14) ,
      bodyLarge: getRegularStyle(color: ColorManager.Gray) ,
    )



  );
}