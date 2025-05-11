import 'package:flutter/material.dart';
import 'package:meals_app/module/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';
import 'package:meals_app/screens/meel_details_screen.dart';
class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key,this.title, required this.meals});
  final String? title;
  final List<Meal> meals;
  
    void onMealSelected(BuildContext context,Meal meal) 
  {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MealDetailsScreen(meal,),));
  }



  @override
  Widget build(BuildContext context) {
  Widget content = (meals.isNotEmpty)? 
        ListView.builder(
          itemCount: meals.length,
          itemBuilder:         
          (ctx,index)=>
          MealItem(
            meal: meals[index],
            onMealSelected: onMealSelected,)
        )                    
        : Center(
         child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
           children: [
              
             Text('Uh oh ... nothing here',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Theme.of(context).colorScheme.onSurface)),
             const SizedBox(height: 16,),
             Text('try selecting a different category!',
             style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onSurface))

           ],
         )
        );
    
    if(title == null)
    {
      return content;
    }

    return
     Scaffold(
      appBar: AppBar(title: Text(title!),),      
      body: content        
      ,
      
    );
  }
}