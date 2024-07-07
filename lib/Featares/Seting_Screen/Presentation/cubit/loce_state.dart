

import 'package:flutter/material.dart';
abstract class LocaleState{}
class LocaleInitial {}
class ChangeLocaleState extends LocaleState{
  final Locale locale;
  ChangeLocaleState({
    required this.locale,
  });
}

