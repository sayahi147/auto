import 'package:flutter/material.dart';

class ThemeHelper {
  static Color primaryColor = Color.fromARGB(255, 88, 192, 88);
  static Color accentColor = Color.fromARGB(255, 190, 32, 32);
  static Color shadowColor = Color.fromARGB(255, 15, 15, 184);

  static ThemeData getThemeData() {
    return ThemeData(
      fontFamily: 'Baloo',
      primarySwatch: Colors.deepPurple,
      
      colorScheme: ColorScheme.light(primary: Color.fromARGB(255, 247, 246, 248), secondary: Colors.teal),
      textTheme: TextTheme(
          headline3: TextStyle(
            color: accentColor,
            fontFamily: 'Baloo',
          ),
          headline4: TextStyle(
            color: accentColor,
            fontFamily: 'Baloo',
          )),
    );
  }

  static BoxDecoration fullScreenBgBoxDecoration() {
    return BoxDecoration(
      color: Colors.white
    );
  }

  static roundBoxDeco({Color color = Colors.white, double radius = 15}) {
    return BoxDecoration(color: color, borderRadius: BorderRadius.all(Radius.circular(radius)));
  }
}
