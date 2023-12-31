import 'package:flutter/material.dart';
import 'package:shopmate/model/item_model.dart';
import '../utils/handle_selected_item_helper.dart';
import '../utils/selected_items_color.dart';

// Access the selectedItems list
List<Item> selectedItems = HandleSelectedItem().selectedItems;

//Grocery item view
Widget selectedBottomGrid(
    List<Item> selectedItems, int index, BuildContext context) {
  return GridTile(
    header: Center(
        child: SizedBox(
            height: 50,
            width: 50,
            child: Image.asset(
              selectedItems[index].itemImageUrl!,
              scale: 1,
            ))),
    child: Container(color: Theme.of(context).colorScheme.secondaryContainer

        // color: Colors.green,
        ),
  );
}

//Grocery item view
Widget itemGrid(
    AsyncSnapshot<List<Item>> snapshot, int index, BuildContext context) {
  Item item = snapshot.data![index];

  return GridTile(
    header: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        snapshot.data![index].itemImageUrl!,
        width: 100,
        height: 100,
      ),
    ),
    footer: Center(
        child: Text(
      snapshot.data![index].itemName!,
      style: const TextStyle(fontWeight: FontWeight.w500),
    )),
    child: Container(
      decoration: BoxDecoration(
        color: getItemColor(item, selectedItems, context),
        border: Border.all(
          width: 2,
          color: Theme.of(context).colorScheme.primary,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        //color: Colors.green,
      ),
      // color: Colors.green,
    ),
  );
}
