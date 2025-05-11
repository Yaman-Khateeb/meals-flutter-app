import 'package:flutter/material.dart';
class SwitchTileFilterItem extends StatefulWidget {
   SwitchTileFilterItem({required this.title, required this.subTitle,required this.fieldFilterValue,super.key});
 final String title;
 final String subTitle;
  bool fieldFilterValue;

  @override
  State<SwitchTileFilterItem> createState() => _SwitchTileFilterItemState();
}

class _SwitchTileFilterItemState extends State<SwitchTileFilterItem> {
  @override
  Widget build(BuildContext context) {
    return   SwitchListTile(value: widget.fieldFilterValue,          
           onChanged:(isChecked){
            setState(() {
              widget.fieldFilterValue = isChecked;
            });
           },
           title: Text('Gluten-free', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onSurface),),
           subtitle:  Text('Only-include gluten-free meals.', style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Theme.of(context).colorScheme.onSurface),),
           contentPadding:const  EdgeInsets.only(left: 35, right: 24),
            );
  }
}