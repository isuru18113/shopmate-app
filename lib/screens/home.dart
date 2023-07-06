import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../model/grocery_list_model.dart';

import '../services/get_list_from_database.dart';
import '../widgets/divider_widget.dart';
import 'groceries_check_list.dart';
import 'groceries_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  late final Map<String, dynamic> itemList;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(),
      body: groceryListView(),
    );
  }

  //home app bar
  AppBar homeAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text("ShopMate", style: GoogleFonts.patuaOne()),
      actions: [
        IconButton(
            onPressed: () {
              //Navigate to create groceries list page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const GroceriesList()),
              );
            },
            icon: const Icon(Icons.create_rounded)),
      ],
    );
  }

  Widget groceryListView() {
    return FutureBuilder<List<GroceryList>>(
      future: fetchGroceryLists(),
      builder:
          (BuildContext context, AsyncSnapshot<List<GroceryList>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (snapshot.hasData) {
          List<GroceryList> groceryLists = snapshot.data!;

          return ListView.separated(
            itemCount: groceryLists.length,
            itemBuilder: (BuildContext context, int index) {
              GroceryList groceryList = groceryLists[index];

              return ListTile(
                tileColor: Colors.green.shade50,
                onTap: () {
                  Map<String, dynamic> selectedItems =
                      groceryList.selectedItems;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            GroceriesCheckList(selectedItems: selectedItems)),
                  );
                },
                leading: const Text(
                  "📋",
                  style: TextStyle(fontSize: 20),
                ),
                title: Text(
                  DateFormat.yMMMMd().add_jm().format(groceryList.createdAt),
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                subtitle: Text(groceryList.id.toString()),
                trailing: const Icon(Icons.navigate_next_rounded),
              );
            }, separatorBuilder: (BuildContext context, int index) {
            return customDivider();
          },
          );
        } else {
          return const Center(
            child: Text('No grocery lists available'),
          );
        }
      },
    );
  }
}
