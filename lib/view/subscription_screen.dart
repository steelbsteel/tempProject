import 'package:flutter/material.dart';
import 'package:temp_project/view/main_screen.dart';
import 'package:temp_project/viewmodels/subscription_viewmodel.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  final SubscriptionViewModel _viewModel = SubscriptionViewModel();
  String? _selectedPlan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Выберите тариф'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  final plan = index == 0 ? '30' : '365';
                  final isYearly = plan == '365';
                  final price = _viewModel.getPriceByPlan(plan);
                  final oldPrice = isYearly ? '6 990₽' : null;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedPlan = plan;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                        border: _selectedPlan == plan
                            ? Border.all(color: Colors.purple, width: 2)
                            : null,
                      ),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start, 
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .center,
                                crossAxisAlignment: CrossAxisAlignment
                                    .start, 
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0,
                                    ), 
                                    child: Text(
                                      plan,
                                      style: TextStyle(
                                        fontFamily: 'Iceland',
                                        fontSize: 80,
                                        fontWeight: FontWeight.bold,
                                        color: _selectedPlan == plan
                                            ? Color.fromARGB(255, 83, 58, 113)
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 0,
                                      top: 0,
                                    ), 
                                    child: Text(
                                      'дней',
                                      style: TextStyle(
                                        fontSize: 32,
                                        color: _selectedPlan == plan
                                            ? Color.fromARGB(255, 83, 58, 113)
                                            : Colors.grey[600],
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              Column(
                                children: [
                                  if (oldPrice != null) ...[
                                    Text(
                                      oldPrice,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.red,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                  ],
                                  Text(
                                    price,
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: _selectedPlan == plan
                                          ? Colors.purple
                                          : Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          if (isYearly) ...[
                            const SizedBox(height: 8),
                            Text(
                              'Экономия 2 000₽',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 60,
              child: ElevatedButton(
                onPressed: _selectedPlan != null ? _handleSubscribe : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                ),
                child: const Text(
                  'Подключить премиум',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Условия подписки: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.grey[700],
                    ),
                  ),
                  TextSpan(
                    text:
                        'подписка «Премиум» даёт доступ к функциям, указанных в ст. 1 условия пользовательского соглашения, подписка является автообновляемой в соответствии со ст.5 пункт 3266 пользовательского соглашения',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleSubscribe() async {
    if (_selectedPlan == null) return;

    await _viewModel.selectPlan(_selectedPlan!);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainScreen()),
    );
  }
}
