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

  Map<String, dynamic> toJson() {
    return {
      'code': itemCode,
      'name': itemName,
      'image_url': itemImageUrl,
    };
  }
}
