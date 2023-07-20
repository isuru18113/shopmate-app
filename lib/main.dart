import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopmate/routes/routes.dart';
import 'package:shopmate/screens/groceries_check_list.dart';
import 'package:shopmate/screens/groceries_list.dart';
import 'package:shopmate/screens/home.dart';
import 'package:shopmate/screens/selected_list.dart';
import 'package:shopmate/screens/settings.dart';
import 'package:shopmate/screens/welcome.dart';
import 'package:shopmate/utils/handle_selected_item_helper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'color_schemes.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => HandleSelectedItem(),
      child: const MyHomePage(),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();

  //Set app theme
  static void setAppTheme(BuildContext context, ThemeMode themeMode) {
    _MyHomePageState? state =
        context.findAncestorStateOfType<_MyHomePageState>();
    state?.changeTheme(themeMode);
  }

  //Set app language
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyHomePageState? state =
        context.findAncestorStateOfType<_MyHomePageState>();
    state?.setLocale(newLocale);
  }
}

class _MyHomePageState extends State<MyHomePage> {
  ThemeMode _themeMode = ThemeMode.system;
  Locale? appLocale;

  changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  setLocale(Locale locale) {
    setState(() {
      appLocale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      themeMode: _themeMode,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: appLocale,
      initialRoute: welcomeRoute,
      routes: {
        welcomeRoute: (context) => const Welcome(),
        homeRoute: (context) => const Home(),
        groceryListRoute: (context) => const GroceriesList(),
        selectedListRoute: (context) => const SelectedList(),
        settingsRoute: (context) => const Settings(),
      },

      onGenerateRoute: (settings) {
        if (settings.name == groceryCheckListRoute) {
          final value = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
              builder: (_) => GroceriesCheckList(selectedItems: value));
        }
        return null;
      },
    );
  }
}
