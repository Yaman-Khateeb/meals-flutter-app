import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favorites_provider.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import 'package:meals_app/providers/filters_provider.dart';
var kInintialFilters = {
  Filters.glutinFree : false,
  Filters.lactoseFree : false,
  Filters.vegan : false,
  Filters.vegetarian : false,
};
class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

// Map<Filters,bool> filters = kInintialFilters;

class _TabsScreenState extends ConsumerState<TabsScreen> {



// void _showMessage(String message)
// {
//   ScaffoldMessenger.of(context).clearSnackBars();
//   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
// }


void onSelectScreen(String screen) async
{

  Navigator.of(context).pop(); //To close the drawer
  if(screen == 'filters')
  {    
    print('Openning filters screen');
   await Navigator.of(context).push<Map<Filters,bool>>(MaterialPageRoute(builder: 
   (context) =>  const FiltersScreen()));
  //  print(result);
  //  print(result[Filters.glutinFree]? 'Yes glutin free' : 'Not glutin free');
   
   //It should be inside a set state because we need to update som UI
  //  setState(() {
  //     filters = result ?? kInintialFilters; //If the result is null set initial filters    
  //  });
   
  }
}

int _selectedTabIndex = 0;

  String _activePageTitle = 'Categories';

void _changeSelectedTab(int index)
{
  setState(() {
    _selectedTabIndex = index;
    
  });
}
  @override
  Widget build(BuildContext context) {
    Widget activeScreen =  CategoriesScreen();
    _activePageTitle = 'Categories';
    if(_selectedTabIndex == 1)
    {
      final favouritMeals = ref.watch(favouriteMealProvider);
      activeScreen = MealsScreen(meals: favouritMeals,);
      _activePageTitle = 'Favourites';
    }
    return Scaffold(
      appBar: AppBar(title: Text(_activePageTitle),),
      drawer:  MainDrawer(onSelectScreen: onSelectScreen,),

      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _changeSelectedTab,
        currentIndex: _selectedTabIndex,
        elevation: 2,
        items: 
      const [
         BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Categories'),
         BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites'),
         
      ]),
    );
  }
}