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
  ModelHubApp({super.key});

  final SubscriptionViewModel _viewModel = SubscriptionViewModel();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ModelHub",
      home: FutureBuilder<bool>(
        future: _viewModel.hasSub(), // проверяем подписку
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!) {
              return MainScreen(); // есть подписка → главный экран
            } else {
              return Onboarding(); // нет подписки → онбординг
            }
          } else {
            // пока идёт проверка — показываем индикатор
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
        },
      ),
      routes: {
        '/onboarding': (context) => Onboarding(),
        '/paywall': (context) => SubscriptionScreen(),
        '/main': (context) => MainScreen(),
      },
    );
  }
}


