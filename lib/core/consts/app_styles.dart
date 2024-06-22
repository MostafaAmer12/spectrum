import 'package:flutter/material.dart';

class AppStyles {
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  const AppStyles({
    required this.fontSize,
    required this.fontWeight,
    required this.color,
  });
  TextStyle toTextStyle() {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static const TextStyle customTextStyleBl = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: AppStyles.primaryBl,
  );
  static const TextStyle customTextStyleBl2 = TextStyle(
    fontSize: 26.0,
    fontWeight: FontWeight.bold,
    color: AppStyles.primaryBl,
  );
  static const TextStyle customTextStyleBl3 = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: AppStyles.primaryBl,
  );
  static const TextStyle customTextStyleBl4 = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    color: AppStyles.primaryBl,
  );

  static const TextStyle customTextStyleG = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
    color: AppStyles.primaryG,
  );

  static const Color primaryB = Color(0xFF1F4967);

  static const Color primaryBl = Color(0xFF454545);

  static const Color primaryW = Color(0xFFFFFFFF);
  static const Color primaryW2 = Color(0xFFFBF5F2);

  static const Color primaryG = Color(0xFF4D5359);
  static const Color primaryG2 = Color(0xFFD9D9D9);

  static const Color primaryO = Color.fromARGB(255, 218, 124, 18);
}
