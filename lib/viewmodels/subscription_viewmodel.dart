import 'package:shared_preferences/shared_preferences.dart';
import 'package:temp_project/models/subscription_model.dart';

class SubscriptionViewModel {
  SubscriptionModel? selectedPlan;
  final String _selectedPlanKey = 'selected_plan'; 

  String getPriceByPlan(String plan){
    return plan == "30" ? '590' : '4990';
  }

  Future<void> selectPlan(String plan) async{
    final prefs = await SharedPreferences.getInstance();
    final savedPlan = prefs.getString(_selectedPlanKey);
    selectedPlan = SubscriptionModel(
      plan: plan, 
      price: getPriceByPlan(plan), 
      isSelected: true
    );
  }

  Future<bool> hasSub() async{
    final prefs = await SharedPreferences.getInstance();
    final savedPlan = prefs.getString(_selectedPlanKey);
    return savedPlan != null;
  }
}