import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/grocery_list_model.dart';

//Read data from database
Future<List<GroceryList>> getGroceryLists() async {
  const url =
      'https://shopmate-19b1a-default-rtdb.europe-west1.firebasedatabase.app/all_grocery_list.json';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    List<GroceryList> tempList = [];
    data.forEach((key, value) {
      final groceryListData = value['grocery_list'];

      tempList.add(GroceryList(
        id: key,
        createdAt: DateTime.parse(groceryListData['createdAt']),
        selectedItems: groceryListData['selected_items'],
      ));
    });

    tempList.sort((a, b) => b.createdAt.compareTo(a.createdAt));



    return tempList;
  } else {
    throw Exception('Failed to fetch grocery lists');
  }
}
