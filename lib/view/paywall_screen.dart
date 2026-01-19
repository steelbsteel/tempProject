import 'package:flutter/material.dart';
import 'package:temp_project/viewmodels/paywall_viewmodel.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  late final SubscriptionViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = SubscriptionViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Подписка')),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: 300,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Оформите подписку', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              const Text('- безлимитный доступ ко всем 3д моделям\n- возможность выкладывать и продавать свои модели', textAlign: TextAlign.center),
              const SizedBox(height: 30),
              _buildSubscriptionCard('30', Colors.purple, _viewModel.selectedPlan?.plan == '30'),
              const SizedBox(height: 20),
              _buildSubscriptionCard('365', Colors.green, _viewModel.selectedPlan?.plan == '365'),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => _handlePremiumButton(),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                child: const Text('Подключить премиум'),
              ),
              const SizedBox(height: 20),
              const Text('Условия подписки...', style: TextStyle(fontSize: 10)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubscriptionCard(String days, Color color, bool isSelected) {
    return InkWell(
      onTap: () => _viewModel.selectPlan(days),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          border: isSelected ? Border.all(color: Colors.white, width: 3) : null,
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(days, style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white)),
                const Text('ДНЕЙ', style: TextStyle(fontSize: 14, color: Colors.white)),
              ],
            ),
            Text(_viewModel.getPriceByPlan(days), style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white)),
            if (isSelected) const Icon(Icons.check, color: Colors.white, size: 24),
          ],
        ),
      ),
    );
  }

  void _handlePremiumButton() {
    if (_viewModel.selectedPlan != null) {
      // Логика подключения премиум
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Подписка ${_viewModel.selectedPlan!.plan} дней оформлена!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Выберите тариф!')),
      );
    }
  }
}