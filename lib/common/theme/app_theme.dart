import 'package:flutter/material.dart';


class AppTheme {
  static const Color primaryYellowLight =
      Color(0xFFf6b815);
  static const Color primaryYellowDark = Color(0xFFf6b815); 
  static const Color primaryBlack = Color(0xff1f1f1f);
  static const Color primaryWhite = Colors.white;
  static const Color secondaryBlackLight = Colors.black87;
  static const Color secondaryBlackDark = Colors.white70;
  static const Color backgroundLight = Colors.white;
  static const Color backgroundDark = Color(0xff1f1f1f);
  static const Color cardLight = Colors.white;
  static const Color cardDark = Color(0xFF1E1E1E);

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryYellowLight,
    scaffoldBackgroundColor: backgroundLight,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryYellowLight,
      titleTextStyle: TextStyle(
          color: primaryBlack, fontWeight: FontWeight.bold, fontSize: 20),
      iconTheme: IconThemeData(color: primaryBlack),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: secondaryBlackLight),
      bodyMedium: TextStyle(color: secondaryBlackLight),
      bodySmall: TextStyle(color: secondaryBlackLight),
      titleLarge: TextStyle(color: primaryBlack, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(color: primaryBlack, fontWeight: FontWeight.bold),
      titleSmall: TextStyle(color: primaryBlack),
    ),
    iconTheme: IconThemeData(color: primaryBlack),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryYellowLight,
        foregroundColor: primaryBlack,
        textStyle: TextStyle(fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    cardTheme: CardTheme(
      color: cardLight,
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: backgroundLight,
      selectedItemColor: primaryYellowDark,
      unselectedItemColor: Colors.grey[600],
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryYellowDark,
    scaffoldBackgroundColor: backgroundDark,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryYellowDark,
      titleTextStyle: TextStyle(
          color: secondaryBlackDark, fontWeight: FontWeight.bold, fontSize: 20),
      iconTheme: IconThemeData(color: secondaryBlackDark),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: secondaryBlackDark),
      bodyMedium: TextStyle(color: secondaryBlackDark),
      bodySmall: TextStyle(color: secondaryBlackDark),
      titleLarge:
          TextStyle(color: secondaryBlackDark, fontWeight: FontWeight.bold),
      titleMedium:
          TextStyle(color: secondaryBlackDark, fontWeight: FontWeight.bold),
      titleSmall: TextStyle(color: secondaryBlackDark),
    ),
    iconTheme: IconThemeData(color: secondaryBlackDark),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryYellowDark,
        foregroundColor: secondaryBlackDark,
        textStyle: TextStyle(fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    cardTheme: CardTheme(
      color: cardDark,
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: backgroundDark,
      selectedItemColor: primaryYellowLight,
      unselectedItemColor: Colors.grey[400],
    ),
  );
}
