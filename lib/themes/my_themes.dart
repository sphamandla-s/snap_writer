import 'package:flutter/material.dart';

class MyThemes {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: const Color(0XFF001823),
      colorScheme: const ColorScheme.dark(),
      primaryColor: const Color(0XFF0D6EFD),
  );
  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.grey.shade200,
      colorScheme: const ColorScheme.light(),
      primaryColor: const Color(0XFF0D6EFD),
  );

  static final lightIconColor = Colors.white;
  static final darkIconColor = Colors.black;

}


