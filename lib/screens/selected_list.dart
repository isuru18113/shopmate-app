
import 'package:flutter/material.dart';

import '../model/item_model.dart';
import '../services/add_list_to_database.dart';
import '../utils/handle_selected_item_helper.dart';
import '../widgets/divider_widget.dart';
import 'home.dart';

class SelectedList extends StatefulWidget {
  const SelectedList({Key? key}) : super(key: key);


  @override
  State<SelectedList> createState() {
    return _SelectedListState();
  }

}

class _SelectedListState extends State<SelectedList> {
  // Access the selectedItems list
  List<Item> userSelectedItemList = HandleSelectedItem().selectedItems;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: selectedItemAppBar(),
      body: selectedListView(),
    );
  }

  AppBar selectedItemAppBar() {
    return AppBar(
      centerTitle: true,
      title: const Text("Selected List"),
      actions: [
        Visibility(
          visible: userSelectedItemList.isNotEmpty,
          child: IconButton(

            //send to home once data uploaded
              onPressed: () {
                createMap(userSelectedItemList).then((value) => {
                      addListToDatabase(value).whenComplete(() {

                        userSelectedItemList.clear();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const Home()),
                          (route) => false,
                        );
                      }),
                    });
              },
              icon: const Icon(Icons.check_rounded)),
        )
      ],
    );
  }

  Widget selectedListView() {
    return userSelectedItemList.isNotEmpty
        ? ListView.separated(
            itemCount: userSelectedItemList.length,
            itemBuilder: (context, index) {
              final item = userSelectedItemList[index].itemCode as String;
              return Dismissible(
                key: Key(item),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  setState(() {
                    HandleSelectedItem().removeItemWhere(item);
                  });
                },
                background: Container(
                  color: Colors.red.shade300,
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.delete_forever),
                    ),
                  ),
                ),
                child: ListTile(
                  titleAlignment: ListTileTitleAlignment.center,
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  tileColor: Colors.green.shade50,
                  leading: SizedBox(
                      width: 60,
                      height: 60,
                      child: Image.asset(
                          userSelectedItemList[index].itemImageUrl.toString())),
                  title: Text(userSelectedItemList[index].itemName.toString()),
                ),
              );
            }, separatorBuilder: (BuildContext context, int index) {
                return customDivider();
    },)
        : Center(
            child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Go to item menu")),
          );
  }
}
