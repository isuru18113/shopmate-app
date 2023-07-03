import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'groceries_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);



  @override
  State<Home> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(),
      body: sampleListView(),
    );
  }

  //home app bar
  AppBar homeAppBar(){

    return AppBar(
      automaticallyImplyLeading: false,
      title: Text("ShopMate",
      style: GoogleFonts.abel()
      ),
      actions: [
        IconButton(onPressed: (){

          //Navigate to groceries list page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const GroceriesList()),
          );

        }, icon: Icon(Icons.playlist_add))
      ],
    );
  }

  Widget sampleListView(){

    return ListView.builder(
        itemCount: 50,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              leading: const Icon(Icons.list),
              onTap: (){
                print("itmes");
              },
              title: Text("List item $index"));
        });

  }
}


