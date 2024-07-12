import "package:flutter/material.dart";

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
    colorScheme: ColorScheme.light(
        surface: Color.fromARGB(255, 213, 6, 6),
        primary: Color.fromARGB(255, 145, 1, 1),
        secondary: Color.fromARGB(255, 238, 0, 0),
        inversePrimary: Color.fromARGB(255, 255, 254, 254)));

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
        surface: Color.fromARGB(255, 87, 2, 2),
        primary: const Color.fromARGB(255, 72, 0, 0),
        secondary: const Color.fromARGB(255, 52, 0, 0),
        inversePrimary: Color.fromARGB(255, 255, 249, 249)));
