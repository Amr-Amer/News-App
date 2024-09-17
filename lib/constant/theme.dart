import 'package:flutter/material.dart';

import 'colors.dart';

class MyTheme {

  static ThemeData lightTheme = ThemeData(
      primaryColor: AppColors.primaryLightColor,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primaryLightColor,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          ),
        ),
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          fontFamily: "Almarai",
          color: AppColors.whiteColor,
        ),
        titleMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: "Almarai",
          color: AppColors.blackColor,
        ),
        titleSmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: "Almarai",
          color: AppColors.blackColor,
        ),
      ));
}