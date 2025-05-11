import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/module/meal.dart';
import 'package:meals_app/providers/favorites_provider.dart';

class MealDetailsScreen extends ConsumerWidget {
  final Meal meal;

  const MealDetailsScreen(this.meal,{super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
      final favouriteMeals = ref.watch(favouriteMealProvider);
    return Scaffold(
      appBar: AppBar(title: Text(meal.title),
      actions: [
        IconButton(onPressed: (){
          //we will consume the favourite meals provider instead of sending onToggle function between screens
          final bool wasAdded = ref.read(favouriteMealProvider.notifier).
          toggleMealFavouriteStatus(meal); //We used read because we just want to access a provider not watching changes
          //Lets show a message that meal was added / removed
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(wasAdded? 'Meal added as favourite.' : 'Meal removed from favourites.')));
        }, icon:  Icon(Icons.star, 
        size: 26,
        color: favouriteMeals.contains(meal)? const Color.fromARGB(255, 207, 156, 4) : const Color.fromARGB(194, 180, 180, 180),))
      ],),
      body: SingleChildScrollView(
        
        child: Column(
          children: [
            Image.network(meal.imageUrl,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,),
            const SizedBox(height: 14,),
            Text('Ingrediants', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.primary),),            
            const SizedBox(height: 12,),
            
              Column(
                
                children: [                  
                    for(final ingrediant in meal.ingredients)
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(ingrediant, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onSurface),),
            ),    

            const SizedBox(height: 42,),
            
                    Text('Steps', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.primary),),            
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 22 ),
                child: Column(                
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [                  
                    
                      for(final step in meal.steps.asMap().entries)
                            Padding(
                padding: const EdgeInsets.all(8),
                child: Text('${step.key + 1}- ${step.value}', style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onSurface),),
                            ),    
                  ],
                ),
              ),
            
            
          ],
        ),
          ],
      ),
      )
    );
  }
}