import 'package:flutter/material.dart';

class CustomThemes {

  static TextStyle primaryTextColorTextTheme(context) =>
      Theme.of(context).textTheme.headlineLarge!;
  static TextStyle secondaryTextColorTextTheme(context) =>
      Theme.of(context).textTheme.bodyLarge!;
  static TextStyle whiteTextColorTextTheme(context) =>
      Theme.of(context).textTheme.titleLarge!;
  static TextStyle primaryColorTextTheme(context) =>
      Theme.of(context).textTheme.titleMedium!;
}