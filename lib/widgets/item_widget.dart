import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopmate/model/item_model.dart';

//Grocery item view
Widget itemGrid(AsyncSnapshot<List<Item>> snapshot, int index) {
  return GridTile(
    header: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(snapshot.data![index].itemImageUrl!),
    ),
    footer: Center(
        child: Text(
      snapshot.data![index].itemName!,
      style: TextStyle(fontWeight: FontWeight.w500),
    )),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.cyan,
        border: Border.all(
          width: 2,
          color: Colors.green,
        ),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        //color: Colors.green,
      ),
      // color: Colors.green,
    ),
  );
}
