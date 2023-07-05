

import 'package:flutter/cupertino.dart';

import '../model/item_model.dart';

class SelectedItemModel extends ChangeNotifier {
  static final SelectedItemModel _instance = SelectedItemModel._internal();

  List<Item> selectedItems = [];


  factory SelectedItemModel() {
    return _instance;
  }

  SelectedItemModel._internal();

  // Add methods to modify the selectedItems list
  void addItem(Item item) {
    selectedItems.add(item);
    notifyListeners();
  }

  void removeItemWhere(String clickedItemCode) {
    selectedItems.removeWhere((item) => item.itemCode == clickedItemCode);
    notifyListeners();
  }


}
