import 'package:exinity_assessment/app.dart';
import 'package:exinity_assessment/locator.dart';
import 'package:exinity_assessment/utils/logger.dart';
import 'package:flutter/material.dart';

void main() async {
  logDebugMessage(message: 'Application Started ...');
  await setupLocator();
  runApp(const MyApp());
}
