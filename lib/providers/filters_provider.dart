

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/module/meal.dart';
import 'package:meals_app/providers/meals_provider.dart';

enum Filters{
  lactoseFree,
  glutinFree,
  vegan,
  vegetarian
}

class FiltersNotifier extends StateNotifier
{
  FiltersNotifier() : super(
    {
      Filters.lactoseFree : false,
      Filters.glutinFree : false,
      Filters.vegan : false,
      Filters.vegetarian : false
    }
    
  );

  void setFilter(Filters filter , bool isActive)
  {
    state = {
      ...state, //Use the old map values
      filter : isActive //just override this one
    };
  }

  void setFilters(Map <Filters, bool> filters)
  {
    state = filters;
  }
}

final filtersProvider = StateNotifierProvider((ref)=> FiltersNotifier());

final filteredMealsProvider = Provider<List<Meal>>((ref)
{
  final meals = ref.watch(mealsProvider);
  final filters = ref.watch(filtersProvider);
  return meals.where((meal)
  {
    return (filters[Filters.glutinFree]! ? meal.isGlutenFree : true) &&
         (filters[Filters.lactoseFree]! ? meal.isLactoseFree : true) &&
         (filters[Filters.vegan]! ? meal.isVegan : true) &&
         (filters[Filters.vegetarian]! ? meal.isVegetarian : true);
  }).toList();

});