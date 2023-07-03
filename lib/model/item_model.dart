class Item {
  String? itemCode;
  String? itemName;
  String? itemImageUrl;

  Item({this.itemCode, this.itemName, this.itemImageUrl});

  factory Item.fromJson(Map<String, dynamic> parsedJson) {
    return Item(
        itemCode: parsedJson['code'],
        itemName: parsedJson['name'],
        itemImageUrl: parsedJson['image_url']);
  }
}
