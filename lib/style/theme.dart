import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const mainColor = Color(0xFFFF7643);
const Color secondColor = Color(0xb63e539a);
const mainLightColor = Color(0xFFFFECDF);
const mainGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const secondaryColor = Color(0xFF979797);
const textColor = Color(0xFF757575);

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  fontFamily: "My Font",
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    systemOverlayStyle: SystemUiOverlayStyle.dark,
  ),
  textTheme: const TextTheme(
      bodyText1: TextStyle(color: textColor),
      headline1: TextStyle(
        fontSize: 30,
        color: mainColor,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14
      )
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
