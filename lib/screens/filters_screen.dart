import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:meals_app/screens/tabs_screen.dart';
// import 'package:meals_app/screens/tabs_screen.dart';
// import 'package:meals_app/widgets/main_drawer.dart';
import 'package:meals_app/providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});
  

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return
      Scaffold(
        appBar: AppBar(title: const Text('Your filters'),),
        // drawer: MainDrawer(onSelectScreen: (identifier){
        //   if(identifier == 'meals')
        //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> TabsScreen()));
        // }),
        body: Column(
          children: [
            SwitchListTile(
             value: activeFilters[Filters.glutinFree],          
             onChanged:(isChecked){
              ref.read(filtersProvider.notifier).setFilter(Filters.glutinFree, isChecked);

             },
             title: Text('Gluten-free', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onSurface),),
             subtitle:  Text('Only-include gluten-free meals.', style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Theme.of(context).colorScheme.onSurface),),
             contentPadding:const  EdgeInsets.only(left: 35, right: 24),
              ),
      
      
              SwitchListTile(value: activeFilters[Filters.lactoseFree],          
             onChanged:(isChecked){
                ref.read(filtersProvider.notifier).setFilter(Filters.lactoseFree, isChecked);
             },
             title: Text('Lactose-free', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onSurface),),
             subtitle:  Text('Only-include lactose-free meals.', style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Theme.of(context).colorScheme.onSurface),),
             contentPadding:const  EdgeInsets.only(left: 35, right: 24),
              ),
      
      
      
              SwitchListTile(value: activeFilters[Filters.vegan],          
             onChanged:(isChecked){
              ref.read(filtersProvider.notifier).setFilter(Filters.vegan, isChecked);
             },
             title: Text('Vegan', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onSurface),),
             subtitle:  Text('Only-include vegan meals.', style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Theme.of(context).colorScheme.onSurface),),
             contentPadding:const  EdgeInsets.only(left: 35, right: 24),
              ),
      
      
                    
              SwitchListTile(value: activeFilters[Filters.vegetarian],          
             onChanged:(isChecked){
              ref.read(filtersProvider.notifier).setFilter(Filters.vegetarian, isChecked);
             },
             title: Text('Vegetarnian', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onSurface),),
             subtitle:  Text('Only-include vegetarian meals.', style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Theme.of(context).colorScheme.onSurface),),
             contentPadding:const  EdgeInsets.only(left: 35, right: 24),
              ),
              
      
          ],
        ),
      
    );
  }
}