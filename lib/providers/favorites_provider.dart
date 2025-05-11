

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/module/meal.dart';

class FavouriteMealsNotifier extends StateNotifier <List<Meal>>
{
  FavouriteMealsNotifier() : super([]);
//Returns true if a meal was added , a false if meal was removed
  bool toggleMealFavouriteStatus(Meal meal)
  {
    //You are not allowed for editing existing value in memory but you can reassign it
    //So we cannot mutate meals using: state.add(meal) or state.remove(meal) but we can read its elements
    //if the meal was removed from favourites
    
    final existingIndex = state.indexWhere((m)=> m.id == meal.id);
    if(existingIndex >= 0) //meal was favourite now it is toggled to be unfavourite
      {
        state = state.where((m)=> m.id != meal.id).toList();
        return false;
      }
      else //The meal is not a favourite yet , so lets add it
      {
        state = [...state, meal]; //we unfolded state wich is all favourtes to provide it as list values and we added a new value
        return true;
      }
  }
}

final favouriteMealProvider = 
StateNotifierProvider<FavouriteMealsNotifier,List<Meal>> ((ref){
  return FavouriteMealsNotifier();

});