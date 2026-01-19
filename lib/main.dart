import 'package:flutter/material.dart';
import 'package:temp_project/view/onboarding_screen.dart';

void main() {
  runApp(
    MaterialApp(
      title: "ModelHub",
      home: Onboarding(),
      routes: {
        '/onboarding': (context) => Onboarding(),
      }
    )
  );
}


