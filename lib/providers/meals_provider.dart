import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/dummy_meals_data.dart';
import 'package:meals_app/module/meal.dart';

final Provider<List<Meal>> mealsProvider = Provider<List<Meal>>(
  (ref)
  {
    return dummyMeals;
  }
);