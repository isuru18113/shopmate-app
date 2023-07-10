import 'package:flutter/material.dart';
import '../model/item_model.dart';

class HandleSelectedItem extends ChangeNotifier {
  static final HandleSelectedItem selectedInstance = HandleSelectedItem._internal();

  List<Item> selectedItems = [];

  factory HandleSelectedItem() {
    return selectedInstance;
  }

  HandleSelectedItem._internal();

  //add new items to selectedListItem
  void addItem(Item item) {
    selectedItems.add(item);
    notifyListeners();
  }

  //remove items from selectedListItem
  void removeItemWhere(String clickedItemCode) {
    selectedItems.removeWhere((item) => item.itemCode == clickedItemCode);
    notifyListeners();
  }

  //handle the selectedItem list
  void handleItemSelected(Item userClickedItems) {
    bool isAlreadyAdded =
        selectedItems.any((item) => item.itemCode == userClickedItems.itemCode);

    if (isAlreadyAdded) {
      removeItemWhere(userClickedItems.itemCode.toString());
    } else {
      addItem(userClickedItems);
    }
  }
}
