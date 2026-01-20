import 'package:flutter/material.dart';
import 'package:temp_project/view/main_screen.dart';
import 'package:temp_project/view/onboarding_screen.dart';
import 'package:temp_project/view/subscription_screen.dart';
import 'package:temp_project/viewmodels/subscription_viewmodel.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // обязательно для async-операций
  runApp(ModelHubApp());
}

class ModelHubApp extends StatelessWidget {
  const ModelHubApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ModelHub",
      home: Onboarding(), // Всегда онбординг при запуске
      routes: {
        '/onboarding': (context) => Onboarding(),
        '/paywall': (context) => SubscriptionScreen(),
        '/main': (context) => MainScreen(),
      },
    );
  }
}


