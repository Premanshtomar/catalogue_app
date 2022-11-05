import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class MyTheme {
  static ThemeData get lightTheme => ThemeData(
      primarySwatch: Colors.deepPurple,
      cardColor: cremeColor,
      canvasColor: lightBlack,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          titleTextStyle: TextStyle(color: Colors.black)));










  static ThemeData get darkTheme => ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.deepPurple,

      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: lightPurple,
      canvasColor: lightBlack,
      appBarTheme: const AppBarTheme(
          color: Colors.black,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          titleTextStyle: TextStyle(color: Colors.white)));







  static Color cremeColor = const Color(0xfff5f5f5);
  static Color darkBlue = const Color(0xff403b58);
  static Color lightBlack = const Color(0xff252325);
  static Color lightPurple = const Color(0xFF4F5560);
}
