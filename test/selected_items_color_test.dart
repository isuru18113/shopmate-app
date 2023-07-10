








import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopmate/model/item_model.dart';
import 'package:shopmate/utils/selected_items_color.dart';

import 'package:mockito/mockito.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  group('getItemColor', () {
    test('should return secondaryContainer color when item is selected', () {
      final selectedItems = <Item>[
        Item(itemCode: 'banana_1', itemName: 'Banana', itemImageUrl: 'image1.png'),
        Item(itemCode: 'mango_1', itemName: 'Mango', itemImageUrl: 'image2.png'),
      ];

      final item = Item(itemCode: 'banana_1', itemName: 'Banana', itemImageUrl: 'image1.png');

      final mockContext = MockBuildContext();

      final color = getItemColor(item, selectedItems, mockContext);

      expect(color, equals(Theme.of(mockContext).colorScheme.secondaryContainer));
    });

    test('should return transparent color when item is not selected', () {
      final selectedItems = <Item>[
        Item(itemCode: 'mango_1', itemName: 'Mango', itemImageUrl: 'image2.png'),
      ];

      final item = Item(itemCode: 'banana_1', itemName: 'Banana', itemImageUrl: 'image1.png');

      final mockContext = MockBuildContext();

      final color = getItemColor(item, selectedItems, mockContext);

      expect(color, equals(Colors.transparent));
    });
  });
}





