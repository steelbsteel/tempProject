import 'package:shared_preferences/shared_preferences.dart';
import 'package:temp_project/models/subscription_model.dart';

class SubscriptionViewModel {
  SubscriptionModel? _selectedPlan;
  final String _selectedPlanKey = 'selected_plan'; 
  static const String _hasSubscriptionKey = 'has_subscription';

  String getPriceByPlan(String plan){
    return plan == "30" ? '590₽' : '4 990₽';
  }

  SubscriptionModel? get selectedPlan => _selectedPlan;
  Future<void> selectPlan(String plan) async{
    print('Saving plan: $plan');
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_hasSubscriptionKey, true);
    await prefs.setString(_selectedPlanKey, plan);
    _selectedPlan = SubscriptionModel(
      plan: plan, 
      price: getPriceByPlan(plan), 
      isSelected: true
    );
    print('Plan saved to SharedPreferences');
  }

  Future<bool> hasSub() async{
    final prefs = await SharedPreferences.getInstance();
    final savedPlan = prefs.getString(_selectedPlanKey);
    return savedPlan != null;
  }
}