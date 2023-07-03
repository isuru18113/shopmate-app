import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/groceries_tabs.dart';

class GroceriesList extends StatefulWidget {
  const GroceriesList({Key? key}) : super(key: key);

  @override
  State<GroceriesList> createState() {
    return _GroceriesListState();
  }
}

class _GroceriesListState extends State<GroceriesList> {
  bool _isItemSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: groceriesTabs());
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
        onTap: (selectedTabIndex) {},
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
          //controller: _controller,
          children: [
            vegetableWidget(),
            fruitWidget(),
            meatWidget(),
            seafoodWidget(),
            dairyWidget(),
            ingredientWidget()
          ],
        ),
      ),
    );
  }
}
