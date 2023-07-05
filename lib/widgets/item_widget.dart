import 'package:flutter/material.dart';
import 'package:shopmate/model/item_model.dart';
import '../utils/selected_items_color.dart';

//Grocery item view
Widget selectedBottomGrid(List<Item> selectedItems, int index) {
  return GridTile(
    header: Center(
        child: SizedBox(
            height: 50,
            width: 50,
            child: Image.asset(
              selectedItems[index].itemImageUrl!,
              scale: 1,
            ))),
    child: Container(
      color: Colors.green.shade50,

      // color: Colors.green,
    ),
  );
}

//Grocery item view
Widget itemGrid(AsyncSnapshot<List<Item>> snapshot, int index) {
  Item item = snapshot.data![index];

  return GridTile(
    header: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(snapshot.data![index].itemImageUrl!),
    ),
    footer: Center(
        child: Text(
      snapshot.data![index].itemName!,
      style: const TextStyle(fontWeight: FontWeight.w500),
    )),
    child: Container(
      decoration: BoxDecoration(
        color: getItemColor(item),
        border: Border.all(
          width: 2,
          color: Colors.green,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        //color: Colors.green,
      ),
      // color: Colors.green,
    ),
  );
}
