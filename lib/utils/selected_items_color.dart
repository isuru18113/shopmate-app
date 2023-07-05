
import 'package:flutter/material.dart';
import 'package:shopmate/utils/selected_groceries_list.dart';
import '../model/item_model.dart';

// Access the selectedItems list
List<Item> selectedItems = SelectedItems().selectedItems;


//Change the color of itemGrid upon the selection
Color getItemColor(Item item) {
  bool isSelected = selectedItems.any((selectedItem) => selectedItem.itemCode == item.itemCode);
  return isSelected ? Colors.green.shade100 : Colors.transparent;
}