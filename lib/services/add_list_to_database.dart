import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../model/item_model.dart';
import '../utils/selected_groceries_list.dart';

// Access the selectedItems list
List<Item> userSelectedItemList = SelectedItems().selectedItems;

//get data from userSelectedItem list and create a map
Future<Map<String, dynamic>> createMap() async {
  Map<String, dynamic> jsonData = {
    "grocery_list": {
      "createdAt": DateTime.now().toString(),
      "selected_items": {},
    }
  };

  for (var item in userSelectedItemList) {
    jsonData["grocery_list"]["selected_items"][item.itemCode] = item.toJson();
  }

  return jsonData;
}

//Add data to realtime database
Future<void> addListToDatabase(Map<String, dynamic> jsonData) async {
  const url =
      'https://shopmate-19b1a-default-rtdb.europe-west1.firebasedatabase.app/all_grocery_list.json';
  final data = jsonData;

  final response = await http.post(
    Uri.parse(url),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(data),
  );

  if (response.statusCode == 200) {
    if (kDebugMode) {
      print('Document added successfully');
    }
  } else {
    if (kDebugMode) {
      print('Failed to add document. Error: ${response.statusCode}');
    }
  }
}
