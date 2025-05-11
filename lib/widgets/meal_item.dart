import 'package:flutter/material.dart';
import 'package:meals_app/module/meal.dart';
import 'package:meals_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';
class MealItem extends StatelessWidget {
  const MealItem({super.key,required this.meal, required this.onMealSelected});
  final Meal meal;
  final void Function(BuildContext context,Meal meal) onMealSelected;

  String get complexityText
  {
    //We just want to uppercase the first letter 
    return meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);
  }
  String get affordabilityText
  {
    //We just want to uppercase the first letter 
    return meal.affordability.name[0].toUpperCase() + meal.affordability.name.substring(1);
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      onTap: ()
      {
        onMealSelected(context ,meal);
      },
      child: Card(
        margin:const EdgeInsets.all(12),
        shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(8)),
        clipBehavior: Clip.hardEdge, //This will cut any content goes out of the shape boundries card
        elevation: 2,      
        child: Stack(        
          children: [
            FadeInImage(placeholder: MemoryImage(kTransparentImage),
             image: NetworkImage(meal.imageUrl),
             fit: BoxFit.cover,
             height: 200, //We define the height so the im
             width: double.infinity,
             ),
             
             Positioned(
              
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 40),
                color: Colors.black54,
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,                    
                      ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis, //This will add to the end of overflowed text ...
                    ),
                    const SizedBox(height: 12,),
                    //Note that we didnt need to wrap row with Expanded (we usually wrap row with expanded if it was inside a column or row)
                    //But here the parent of the row the (Column) has a fixed width (not infinity) because it is wrapped with positioned which set the boundries of column using left: 0 , right: 0
                    Row(
                      children: [
                        MealItemTrait(icon: Icons.schedule, label: '${meal.duration} min'),
                        const Spacer(),
                        MealItemTrait(icon: Icons.work, label: complexityText,),
                        const Spacer(),
                        MealItemTrait(icon: Icons.attach_money, label: affordabilityText,)
                      ],
                      )
                  ],
                ),
              ))
          ],
        ),
      ),
    );
  }
  
  
}