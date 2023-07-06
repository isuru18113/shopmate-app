import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopmate/screens/home.dart';

import 'package:shopmate/utils/handle_selected_item_helper.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => HandleSelectedItem(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
          tabBarTheme: const TabBarTheme(
              labelStyle: TextStyle(fontWeight: FontWeight.w600),
              labelColor: Colors.green)),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: welcomeScreenView(),
    );
  }

  Widget welcomeScreenView() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.green.shade50,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/app_logo/appLogo.png",
              scale: 5,
            ),
            Text(
              "ShopMate",
              style: GoogleFonts.patuaOne(fontSize: 50),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: TextButton(
                  onPressed: () {

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                          (route) => false,
                    );

                  },
                  child: const Text("Get Started",style: TextStyle(fontSize: 18),)),
            )
          ],
        ),
      ),
    );
  }
}
