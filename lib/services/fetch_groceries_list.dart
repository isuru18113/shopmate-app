import 'dart:convert';

import 'package:flutter/services.dart';

import '../model/item_model.dart';

//Fetch Vegetable Data
Future<String> loadVegetableAsset() async {
  return await rootBundle
      .loadString('assets/groceries_list_data/vegetable.json');
}

Future<List<Item>> loadVegetable() async {

  String jsonString = await loadVegetableAsset();
  List<dynamic> jsonResponse = json.decode(jsonString);
  var list = jsonResponse.map((item) => Item.fromJson(item)).toList();
  return list;
}


//Fetch Fruits Data
Future<String> loadFruitAsset() async {
  return await rootBundle
      .loadString('assets/groceries_list_data/fruit.json');
}

Future<List<Item>> loadFruit() async {

  String jsonString = await loadFruitAsset();
  List<dynamic> jsonResponse = json.decode(jsonString);
  var list = jsonResponse.map((item) => Item.fromJson(item)).toList();
  return list;
}
