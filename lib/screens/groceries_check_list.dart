import 'package:flutter/material.dart';
import '../model/item_model.dart';
import '../widgets/divider_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GroceriesCheckList extends StatefulWidget {
  final Map<String, dynamic> selectedItems;
  const GroceriesCheckList({Key? key, required this.selectedItems})
      : super(key: key);

  @override
  State<GroceriesCheckList> createState() {
    return _GroceriesCheckListState();
  }
}

class _GroceriesCheckListState extends State<GroceriesCheckList> {
  //selected Item list
  late final Map<String, dynamic> selectedItems;

  //bool list for clicked items
  late final List<bool> checks;

  @override
  void initState() {
    super.initState();

    selectedItems = widget.selectedItems;

    checks = List.generate(selectedItems.length, (_) => false);
  }

  //Create a list for selected Items by user
  Future<List<Item>> createAList() async {
    List<Item> itemList = [];
    selectedItems.forEach((key, value) {
      String code = value['code'];
      String imageUrl = value['image_url'];
      String name = value['name'];
      Item item = Item(itemCode: code, itemName: name, itemImageUrl: imageUrl);
      itemList.add(item);
    });
    return itemList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: checkListAppBar(),
      body: checkListView(),
    );
  }

  AppBar checkListAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text(AppLocalizations.of(context)!.check_list),
    );
  }

  //all selected list items
  Widget checkListView() {
    return FutureBuilder<List<Item>>(
        future: createAList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Text('No data available');
          }
          return ListView.separated(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return StatefulBuilder(
                builder: (BuildContext context,
                    void Function(void Function()) setState) {
                  return CheckboxListTile(
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    tileColor: Theme.of(context).colorScheme.secondaryContainer,
                    onChanged: (bool? value) {
                      setState(() {
                        checks[index] = value!;
                      });
                    },
                    title: Text(snapshot.data![index].itemName.toString()),
                    value: checks[index],
                    secondary: Image.asset(
                      snapshot.data![index].itemImageUrl.toString(),
                      width: 50,
                    ),
                  );
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return customDivider();
            },
          );
        });
  }
}
