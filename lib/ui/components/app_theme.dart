import 'package:flutter/material.dart';

ThemeData makeAppTheme() {
  const primaryColor = Color(0XffAB7105);
  const primaryColorLight = Color(0xffFFDF00);
  const primaryColorDark = Color(0xff361701);
  const secondaryColor = Color(0xffA5BEFA);
  const disabledColor = Color(0XffE1E1E1);
  const dividerColor = Colors.grey;

  const inputDecorationTheme = InputDecorationTheme(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: primaryColorLight),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: primaryColor),
    ),
    alignLabelWithHint: true,
    hintStyle: TextStyle(
      color: Color(0xffC5C2BC), 
      fontWeight: FontWeight.bold
    )
  );
  
  ButtonThemeData buttonTheme = const ButtonThemeData(
    colorScheme: ColorScheme.light(primary: primaryColor),
    buttonColor: primaryColor,
    splashColor: primaryColorLight,
    textTheme: ButtonTextTheme.primary,
  );

  ElevatedButtonThemeData elevatedButtonThemeData = ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all(
        const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      foregroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return Colors.grey;
        }
        return Colors.white;
      }),
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return disabledColor;
        }
        return primaryColor;
      }),
      padding: MaterialStateProperty.all(
        const EdgeInsets.only(top: 14.0, bottom: 14.0)
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        )
      )
    )
  );

  final checkBoxThemeData = CheckboxThemeData(
    checkColor: MaterialStateProperty.all(Colors.white),
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return disabledColor;
      }
      return primaryColor;
    }),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5)
    ),
  );

  const appBarTheme = AppBarTheme(
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    iconTheme: IconThemeData(color: primaryColor)
  );

  const bottomAppBarTheme = BottomAppBarTheme(
    elevation: 0
  );

  return ThemeData(
    appBarTheme: appBarTheme,
    primaryColor: primaryColor,
    primaryColorDark: primaryColorDark,
    primaryColorLight: primaryColorLight,
    highlightColor: secondaryColor,
    secondaryHeaderColor: secondaryColor,
    disabledColor: disabledColor,
    dividerColor: dividerColor,
    colorScheme: const ColorScheme.light(primary: primaryColor),
    backgroundColor: Colors.white,
    inputDecorationTheme: inputDecorationTheme,
    buttonTheme: buttonTheme,
    scaffoldBackgroundColor: Colors.white,
    bottomAppBarTheme: bottomAppBarTheme,
    elevatedButtonTheme: elevatedButtonThemeData,
    checkboxTheme: checkBoxThemeData
  );
}