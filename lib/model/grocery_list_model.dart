class GroceryList {
  final String id;
  final DateTime createdAt;
  final Map<String, dynamic> selectedItems;

  GroceryList(
      {required this.id, required this.createdAt, required this.selectedItems});
}
