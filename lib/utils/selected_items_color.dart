
import 'package:flutter/material.dart';
import '../model/item_model.dart';






//Change the color of itemGrid upon the selection
Color getItemColor(Item item, List<Item> selectedItems,BuildContext context) {
  bool isSelected = selectedItems.any((selectedItem) => selectedItem.itemCode == item.itemCode);

  return isSelected?Theme.of(context).colorScheme.secondaryContainer : Colors.transparent;
}