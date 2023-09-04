
import 'package:flutter/material.dart' ;
import 'package:advanced_app/presentation/resources/font_manager.dart';

TextStyle _getTextStyle (double fontSize , FontWeight fontWeight , Color color) {
  return TextStyle(
    fontFamily: FontConstants.fontFamily,
    fontWeight: fontWeight,
    color: color,
    fontSize: fontSize,
  );
}


TextStyle getRegularStyle
    ({ double fontSize = FontSize.s12 , required Color color}){
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}
TextStyle getLightStyle
    ({ double fontSize = FontSize.s12 , required Color color}){
  return _getTextStyle(fontSize, FontWeightManager.light, color);
}
TextStyle getMediumStyle
    ({ double fontSize = FontSize.s12 , required Color color}){
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}
TextStyle getSemiBoldStyle
    ({ double fontSize = FontSize.s12 , required Color color}){
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color);

}
TextStyle getBoldStyle
    ({ double fontSize = FontSize.s12 , required Color color}){
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}