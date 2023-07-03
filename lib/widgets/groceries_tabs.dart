import 'package:flutter/material.dart';

import '../model/item_model.dart';
import '../services/fetch_groceries_list.dart';
import 'item_widget.dart';

//Tab Names
List<Widget> tabNames() {
  return [
    const Tab(child: Text("🥕 Vegetable")),
    const Tab(child: Text("🍎 Fruit")),
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

//Vegetable Tab
Widget vegetableWidget() {
  return FutureBuilder<List<Item>>(
    future: loadVegetable(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return GridView.builder(
            itemCount: snapshot.data?.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return itemGrid(snapshot, index);
              //return Text("${snapshot.data?[index].name}");
            });
      } else if (snapshot.hasError) {
        print(snapshot.error.toString());
        return Text("${snapshot.error}");
      }
      return const CircularProgressIndicator();
    },
  );
}

//Fruit Tab
Widget fruitWidget() {
  return FutureBuilder<List<Item>>(
    future: loadFruit(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return GridView.builder(
            itemCount: snapshot.data?.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return itemGrid(snapshot, index);
              //return Text("${snapshot.data?[index].name}");
            });
      } else if (snapshot.hasError) {
        print(snapshot.error.toString());
        return Text("${snapshot.error}");
      }
      return CircularProgressIndicator();
    },
  );
}

//Meat Tab
Widget meatWidget() {
  return FutureBuilder<List<Item>>(
    future: loadVegetable(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return GridView.builder(
            itemCount: snapshot.data?.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return itemGrid(snapshot, index);
              //return Text("${snapshot.data?[index].name}");
            });
      } else if (snapshot.hasError) {
        print(snapshot.error.toString());
        return Text("${snapshot.error}");
      }
      return CircularProgressIndicator();
    },
  );
}

//Seafood Tab
Widget seafoodWidget() {
  return FutureBuilder<List<Item>>(
    future: loadVegetable(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return GridView.builder(
            itemCount: snapshot.data?.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return itemGrid(snapshot, index);
              //return Text("${snapshot.data?[index].name}");
            });
      } else if (snapshot.hasError) {
        print(snapshot.error.toString());
        return Text("${snapshot.error}");
      }
      return CircularProgressIndicator();
    },
  );
}

//Dairy Tab
Widget dairyWidget() {
  return FutureBuilder<List<Item>>(
    future: loadVegetable(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return GridView.builder(
            itemCount: snapshot.data?.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return itemGrid(snapshot, index);
              //return Text("${snapshot.data?[index].name}");
            });
      } else if (snapshot.hasError) {
        print(snapshot.error.toString());
        return Text("${snapshot.error}");
      }
      return CircularProgressIndicator();
    },
  );
}

//Ingredient Tab
Widget ingredientWidget() {
  return FutureBuilder<List<Item>>(
    future: loadVegetable(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return GridView.builder(
            itemCount: snapshot.data?.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return itemGrid(snapshot, index);
              //return Text("${snapshot.data?[index].name}");
            });
      } else if (snapshot.hasError) {
        print(snapshot.error.toString());
        return Text("${snapshot.error}");
      }
      return CircularProgressIndicator();
    },
  );
}
