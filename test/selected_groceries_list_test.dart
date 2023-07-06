import 'package:flutter_test/flutter_test.dart';
import 'package:shopmate/model/item_model.dart';
import 'package:shopmate/utils/handle_selected_item_helper.dart';


void main() {
  group('SelectedItems', () {
    test('should add item correctly', () {
      final selectedItems = HandleSelectedItem();

      final item = Item(itemCode: 'banana_1', itemName: 'Banana', itemImageUrl: 'image1.png');
      selectedItems.addItem(item);

      expect(selectedItems.selectedItems.length, 1);
      expect(selectedItems.selectedItems.first, equals(item));
    });

    test('should remove item correctly', () {
      final selectedItems = HandleSelectedItem();


      final item1 = Item(itemCode: 'banana_1', itemName: 'Banana', itemImageUrl: 'image1.png');
      final item2 = Item(itemCode: 'mango_1', itemName: 'Mango', itemImageUrl: 'image2.png');


      selectedItems.addItem(item1);
      selectedItems.addItem(item2);

      selectedItems.removeItemWhere('banana_1');

      expect(selectedItems.selectedItems.length, 1);
      expect(selectedItems.selectedItems.first, equals(item2));
    });

    test('should handle selected item correctly', () {
      final selectedItems = HandleSelectedItem();

      final item1 = Item(itemCode: 'banana_1', itemName: 'Banana', itemImageUrl: 'image1.png');
      final item2 = Item(itemCode: 'mango_1', itemName: 'Mango', itemImageUrl: 'image2.png');

      selectedItems.handleItemSelected(item1);

      expect(selectedItems.selectedItems.length, 1);
      expect(selectedItems.selectedItems.first, equals(item1));

      selectedItems.handleItemSelected(item2);

      expect(selectedItems.selectedItems.length, 2);
      expect(selectedItems.selectedItems, contains(item1));
      expect(selectedItems.selectedItems, contains(item2));

      selectedItems.handleItemSelected(item1);

      expect(selectedItems.selectedItems.length, 1);
      expect(selectedItems.selectedItems.first, equals(item2));
    });
  });
}
