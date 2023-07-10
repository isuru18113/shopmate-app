import 'package:flutter/material.dart';
import '../model/item_model.dart';
import '../routes/routes.dart';
import '../services/add_list_to_database.dart';
import '../utils/handle_selected_item_helper.dart';
import '../widgets/divider_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      title: Text(AppLocalizations.of(context)!.selected_list),
      actions: [
        Visibility(
          visible: userSelectedItemList.isNotEmpty,
          child: IconButton(

              //send to home screen once data uploaded
              onPressed: () {
                createMap(userSelectedItemList).then((value) => {
                      addListToDatabase(value).whenComplete(() {
                        //Clear the remaining list
                        userSelectedItemList.clear();

                        //Navigate to home screen
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          homeRoute,
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
                resizeDuration: const Duration(milliseconds: 1),
                movementDuration: const Duration(milliseconds: 1),
                key: Key(item),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  setState(() {
                    HandleSelectedItem().removeItemWhere(item);
                  });
                },
                background: Container(
                  color: Theme.of(context).colorScheme.errorContainer,
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
                  tileColor: Theme.of(context).colorScheme.secondaryContainer,
                  leading: SizedBox(
                      width: 60,
                      height: 60,
                      child: Image.asset(
                          userSelectedItemList[index].itemImageUrl.toString())),
                  title: Text(userSelectedItemList[index].itemName.toString()),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return customDivider();
            },
          )
        : Center(
            child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(AppLocalizations.of(context)!.createAListTitle)),
          );
  }
}
