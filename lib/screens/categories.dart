import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/dummy_categories_data.dart';

import 'package:meals_app/module/category.dart';
import 'package:meals_app/module/meal.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';
class CategoriesScreen extends ConsumerWidget {



bool checkFiltersOnMeal(Meal meal, WidgetRef ref) {
  final filters = ref.read(filtersProvider);
  return (filters[Filters.glutinFree]! ? meal.isGlutenFree : true) &&
         (filters[Filters.lactoseFree]! ? meal.isLactoseFree : true) &&
         (filters[Filters.vegan]! ? meal.isVegan : true) &&
         (filters[Filters.vegetarian]! ? meal.isVegetarian : true);
}

  
  void _selectCategory(BuildContext context,WidgetRef ref, Category category)  
  {
    final meals = ref.watch(mealsProvider);
    Navigator.push(context, 
    MaterialPageRoute(
      builder: (context) =>
       MealsScreen(title: category.title,
        meals: ref.watch(filteredMealsProvider).where((meal)=> meal.categories.contains(category.id)).toList(),
        ),
    ),
    );
  }
  const CategoriesScreen({super.key});  
  // final Map<Filters,bool> filtersMap;
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    return 
       GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2 ,
           childAspectRatio: 3/2,
           mainAxisSpacing: 20,
           crossAxisSpacing: 20),
      children:  availableCategories.map(
          (category)=> CategoryGridItem(category: category,onCategorySelected:
          (){ _selectCategory(context,ref, category); })
          ).toList()      
      // [        
      //   // for(final category in availableCategories)
      //   // CategoryGridItem(category: category)
      // ],
      
    );
  }
}