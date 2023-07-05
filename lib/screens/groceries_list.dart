import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopmate/screens/selected_list.dart';
import 'package:shopmate/services/fetch_groceries_list.dart';


import '../model/item_model.dart';

import '../utils/selected_groceries_list.dart';
import '../widgets/item_widget.dart';

class GroceriesList extends StatefulWidget {
  const GroceriesList({Key? key}) : super(key: key);

  @override
  State<GroceriesList> createState() {
    return _GroceriesListState();
  }
}

class _GroceriesListState extends State<GroceriesList> {

  //Selected item list
  List<Item>? userSelectItemList = SelectedItems().selectedItems;

  //ScrollController for bottomList
  final ScrollController scrollControllerBottomList = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: groceriesTabs(),
      bottomNavigationBar: selectedItemsBottomListView(),
    );
  }

  AppBar groceriesListAppBar() {
    return AppBar(
      centerTitle: true,
      title: const Text(
        "Create A List",
      ),
      bottom: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        isScrollable: true,
        tabs: tabNames(),
      ),
    );
  }

  Widget groceriesTabs() {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: groceriesListAppBar(),
        body: TabBarView(
          children: [
            groceryTabView(loadVegetable()),
            groceryTabView(loadFruit()),
            groceryTabView(loadVegetable()),
            groceryTabView(loadVegetable()),
            groceryTabView(loadVegetable()),
            groceryTabView(loadVegetable()),
          ],
        ),
      ),
    );
  }

  //Tab Names
  List<Widget> tabNames() {
    return [
      const Tab(
          child: Text("🥕 Vegetable")
      ),
      const Tab(
          child: Text("🍎 Fruit")
      ),
      const Tab(
        child: Text("🥩 Meat"),
      ),
      const Tab(
        child: Text("🍤 Seafood"),
      ),
      const Tab(
        child: Text("🧀 Dairy"),
      ),
      const Tab(
        child: Text("🧂 Ingredient"),
      ),
    ];
  }

  // Tab View
  Widget groceryTabView(Future<List<Item>> loadItemList) {
    return FutureBuilder<List<Item>>(
      future: loadItemList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
              itemCount: snapshot.data?.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
              ),
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            SelectedItems()
                                .handleItemSelected(snapshot.data![index]);
                            bottomListScrollController();
                          });
                        },
                        child: itemGrid(snapshot, index)));
              });
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return const CircularProgressIndicator();
      },
    );
  }

  //Selected Item bottom list controller
  void bottomListScrollController() {
    scrollControllerBottomList.animateTo(
      scrollControllerBottomList.position.maxScrollExtent * 1.5,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
  }


//Selected Item list bottom List
  Widget selectedItemsBottomListView() {
    return Container(
      color: Colors.green.shade50,
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Consumer<SelectedItems>(builder: (context, list, child) {
                return GridView.builder(
                  controller: scrollControllerBottomList,
                  shrinkWrap: true,
                  itemCount: list.selectedItems.length,
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return selectedBottomGrid(list.selectedItems, index);
                  },
                );
              }),
            ),

            Visibility(
              visible: userSelectItemList!.isNotEmpty,
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SelectedList())).then((value) {

                            setState(() {
                              groceriesTabs();
                            });
                    });

                  },

                  icon: const Icon(Icons.navigate_next_rounded)),
            )
          ],
        ),
      ),
    );
  }
}
