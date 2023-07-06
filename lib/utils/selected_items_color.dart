
import 'package:flutter/material.dart';
import '../model/item_model.dart';




//Change the color of itemGrid upon the selection
Color getItemColor(Item item, List<Item> selectedItems) {
  bool isSelected = selectedItems.any((selectedItem) => selectedItem.itemCode == item.itemCode);
  return isSelected ? Colors.green.shade100 : Colors.transparent;
}