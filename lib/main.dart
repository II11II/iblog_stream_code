import 'dart:async';
import 'package:flutter/material.dart';
import 'package:iblogs_roadmap/features/app.dart';

void main() {
  runZonedGuarded(() {
    runApp(const AppProvider());
  }, (error, stacktrace) {});
}
