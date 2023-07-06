import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopmate/model/item_model.dart';
import 'package:shopmate/utils/selected_items_color.dart';


void main() {
  group('getItemColor', () {
    test('should return green color when item is selected', () {
      final selectedItems = <Item>[

      Item(itemCode: 'banana_1', itemName: 'Banana', itemImageUrl: 'image1.png'),
      Item(itemCode: 'mango_1', itemName: 'Mango', itemImageUrl: 'image2.png'),
      ];

      final item = Item(itemCode: 'banana_1', itemName: 'Banana', itemImageUrl: 'image1.png');

      final color = getItemColor(item, selectedItems);

      expect(color, equals(Colors.green.shade100));
    });

    test('should return transparent color when item is not selected', () {
      final selectedItems = <Item>[
        Item(itemCode: 'mango_1', itemName: 'Mango', itemImageUrl: 'image2.png'),
      ];

      final item = Item(itemCode: 'banana_1', itemName: 'Banana', itemImageUrl: 'image1.png');

      final color = getItemColor(item, selectedItems);

      expect(color, equals(Colors.transparent));
    });
  });
}
