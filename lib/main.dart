import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ime_pay_test/test_project.dart';

import 'app_setup/app_init.dart';

void main() => initializeApp();

Future initializeApp() async => runZonedGuarded(() async {
      await AppInit.initialize();
      runApp(const TestProject());
    }, (error, stack) {});
