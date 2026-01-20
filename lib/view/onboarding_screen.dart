import 'package:flutter/material.dart';
import 'package:temp_project/viewmodels/subscription_viewmodel.dart';

class Onboarding extends StatelessWidget {
  Onboarding({super.key});

  final SubscriptionViewModel _viewModel = SubscriptionViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: [
              Column(
                children: [
                  GestureDetector(
                    onDoubleTap: _viewModel.resetSubscription,
                    child: Text(
                      "Model Hub",
                      style: TextStyle(
                        fontFamily: 'Iceland',
                        fontSize: 80,
                        color: Color.fromARGB(255, 83, 58, 113),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.35),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: Color.fromARGB(255, 83, 58, 113),
                          width: 3,
                        ),
                      ),
                      child: Text("Продолжить"),
                      onPressed: () async {
                        print('--- Проверка подписки начата ---');
                        try {
                          final hasSubscription = await _viewModel.hasSub();
                          print(
                            'Результат проверки: hasSubscription = $hasSubscription',
                          );

                          if (hasSubscription) {
                            print(
                              'Пользователь имеет подписку → переход на /main',
                            );
                            Navigator.pushNamed(context, '/main');
                          } else {
                            print('Подписки нет → переход на /paywall');
                            Navigator.pushNamed(context, '/paywall');
                          }
                        } catch (e) {
                          print('Ошибка при проверке подписки: $e');
                          // В случае ошибки — отправляем на экран подписок
                          Navigator.pushNamed(context, '/paywall');
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
