import 'dart:convert';

import 'package:flutter/services.dart';

import '../model/item_model.dart';

//load Vegetable Data
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


//load Fruits Data
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

//load meats Data
Future<String> loadMeatAsset() async {
  return await rootBundle
      .loadString('assets/groceries_list_data/meat.json');
}

Future<List<Item>> loadMeat() async {

  String jsonString = await loadMeatAsset();
  List<dynamic> jsonResponse = json.decode(jsonString);
  var list = jsonResponse.map((item) => Item.fromJson(item)).toList();
  return list;
}

//load seafoods Data
Future<String> loadSeafoodAsset() async {
  return await rootBundle
      .loadString('assets/groceries_list_data/seafood.json');
}

Future<List<Item>> loadSeafood() async {

  String jsonString = await loadSeafoodAsset();
  List<dynamic> jsonResponse = json.decode(jsonString);
  var list = jsonResponse.map((item) => Item.fromJson(item)).toList();
  return list;
}

//load dairy Data
Future<String> loadDairyAsset() async {
  return await rootBundle
      .loadString('assets/groceries_list_data/dairy.json');
}

Future<List<Item>> loadDairy() async {

  String jsonString = await loadDairyAsset();
  List<dynamic> jsonResponse = json.decode(jsonString);
  var list = jsonResponse.map((item) => Item.fromJson(item)).toList();
  return list;
}

//load ingredients Data
Future<String> loadIngredientAsset() async {
  return await rootBundle
      .loadString('assets/groceries_list_data/ingredient.json');
}

Future<List<Item>> loadIngredient() async {

  String jsonString = await loadIngredientAsset();
  List<dynamic> jsonResponse = json.decode(jsonString);
  var list = jsonResponse.map((item) => Item.fromJson(item)).toList();
  return list;
}
