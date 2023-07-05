import 'package:flutter/cupertino.dart';

import '../model/item_model.dart';

class SelectedItems extends ChangeNotifier {
  static final SelectedItems selectedInstance = SelectedItems._internal();

  List<Item> selectedItems = [];

  factory SelectedItems() {
    return selectedInstance;
  }

  SelectedItems._internal();

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
      SelectedItems().removeItemWhere(userClickedItems.itemCode.toString());
    } else {
      addItem(userClickedItems);
    }
  }
}
