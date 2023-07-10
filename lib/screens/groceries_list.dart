import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopmate/services/fetch_groceries_list.dart';


import '../model/item_model.dart';

import '../routes/routes.dart';
import '../utils/handle_selected_item_helper.dart';
import '../widgets/item_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class GroceriesList extends StatefulWidget {
  const GroceriesList({Key? key}) : super(key: key);

  @override
  State<GroceriesList> createState() {
    return _GroceriesListState();
  }
}

class _GroceriesListState extends State<GroceriesList> {

  //Selected item list
  List<Item>? userSelectItemList = HandleSelectedItem().selectedItems;

  //ScrollController for bottomList
  final ScrollController scrollControllerBottomList = ScrollController();




  @override
  void initState() {
    super.initState();
    userSelectItemList?.clear();

  }


  @override
  void dispose() {
    super.dispose();
    scrollControllerBottomList.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: groceriesTabs(),
      bottomNavigationBar: selectedItemsBottomListView(),
    );
  }

  AppBar groceriesListAppBar() {
    return AppBar(
      title:  Text(
        AppLocalizations.of(context)!.createAListTitle,
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
            groceryTabView(loadMeat()),
            groceryTabView(loadSeafood()),
            groceryTabView(loadDairy()),
            groceryTabView(loadIngredient()),
          ],
        ),
      ),
    );
  }

  //Tab Names
  List<Widget> tabNames() {
    return [
       Tab(
          child: Text("🥕 ${AppLocalizations.of(context)!.vegetable}")
      ),
       Tab(
          child: Text("🍎 ${AppLocalizations.of(context)!.fruit}")
      ),
       Tab(
           child: Text("🥩 ${AppLocalizations.of(context)!.meat}")
      ),
       Tab(
           child: Text("🍤 ${AppLocalizations.of(context)!.seafood}")
      ),
       Tab(
           child: Text("🧀 ${AppLocalizations.of(context)!.dairy}")
      ),
       Tab(
           child: Text("🧂 ${AppLocalizations.of(context)!.ingredient}")
      ),
    ];
  }

  // Tab View
  Widget groceryTabView(Future<List<Item>> loadItemList) {
    return  FutureBuilder<List<Item>>(
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
                            HandleSelectedItem()
                                .handleItemSelected(snapshot.data![index]);
                            bottomListScrollController();
                          });
                        },
                        child: itemGrid(snapshot, index, context)));

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
      color: Theme.of(context).colorScheme.secondaryContainer,
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Consumer<HandleSelectedItem>(builder: (context, list, child) {
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
                    return selectedBottomGrid(list.selectedItems, index, context);
                  },
                );
              }),
            ),

            Visibility(
              visible: userSelectItemList!.isNotEmpty,
              child: IconButton(
                  onPressed: () {

                    //Navigate to selected item list screen
                    Navigator.pushNamed(context, selectedListRoute).whenComplete(() {
                      setState(() {

                        //refresh previous page
                        groceriesTabs();

                      });
                    } );


                  },

                  icon: const Icon(Icons.navigate_next_rounded)),
            )
          ],
        ),
      ),
    );
  }
}
