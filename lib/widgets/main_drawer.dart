import 'package:flutter/material.dart';

class MainDrawer extends StatefulWidget {
MainDrawer({required this.onSelectScreen,super.key});
void Function(String) onSelectScreen;
  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return  Drawer(
      elevation: 3,      
      child: Column(
        children: [
          DrawerHeader(            
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.77)
              ])
            ),
            child: Row(
            children: [ 
            Icon(Icons.fastfood,size: 48, color: Theme.of(context).colorScheme.primary,),
           const  SizedBox(width: 18,),
             Text('Cooking Up!', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.primary),)],
          )),
          ListTile(title: Text('Meals',style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Theme.of(context).colorScheme.onSurface,fontSize: 24) ),
          leading: Icon(Icons.restaurant, size: 26,color: Theme.of(context).colorScheme.onSurface,
          ),
          onTap: (){
            widget.onSelectScreen('meals');
          },
          ),
          ListTile(
            leading:  Icon(Icons.settings, size: 26,color: Theme.of(context).colorScheme.onSurface),
            title: Text('Filters',style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Theme.of(context).colorScheme.onSurface,fontSize: 24) ),
            onTap: (){
              widget.onSelectScreen('filters');
            },
          )
        ],
      ),      
    );
  }
}