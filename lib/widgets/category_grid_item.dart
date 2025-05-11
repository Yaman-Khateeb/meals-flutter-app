import 'package:meals_app/module/category.dart';
import 'package:flutter/material.dart';
class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.category, required this.onCategorySelected});
  final Category category;
    final void Function() onCategorySelected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCategorySelected,
      splashColor: Theme.of(context).colorScheme.primary, //Preffered to use your primary color of theme
      borderRadius: BorderRadius.circular(16),  // InkWell needs its own borderRadius to clip the ripple (wavy) effect properly to match the container's shape.

      child: Container(
        decoration:  BoxDecoration(
          gradient: LinearGradient(colors: 
          [
            category.color.withValues(alpha: 0.55),
            category.color.withValues(alpha: 0.9),        
          ]
          ,begin: Alignment.topLeft,
          end: Alignment.bottomRight
          ),
          borderRadius: BorderRadius.circular(16)
        ),
          padding: const EdgeInsets.all(16),
        child:   Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.onSurface
          ),        
          ),
      ),
    );
  }
}