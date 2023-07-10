import 'package:flutter/material.dart';
import '../main.dart';
import '../model/language_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool? isLight;
  @override
  Widget build(BuildContext context) {
    //Get current brightness of the app
    isLight = Theme.of(context).brightness == Brightness.light;

    return Scaffold(
      appBar: settingsAppBar(),
      body: settingsListView(),
    );
  }

  Widget settingsListView() {
    return ListView(
      children: [
        languageSettings(),
        appThemeSetting(),
      ],
    );
  }

  AppBar settingsAppBar() {
    return AppBar(
      title: Text(AppLocalizations.of(context)!.settings),
    );
  }

  Widget languageSettings() {
    return ListTile(
      title: Text(AppLocalizations.of(context)!.change_language),
      leading: const Icon(Icons.language_rounded),
      trailing: PopupMenuButton<Language>(
        onSelected: (Language? language) async {
          if (language != null) {
            MyHomePage.setLocale(context, Locale(language.languageCode, " "));
          }
        },
        itemBuilder: (BuildContext context) {
          return Language.languageList()
              .map<PopupMenuEntry<Language>>(
                (Language e) => PopupMenuItem<Language>(
                  value: e,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(e.countryFlag),
                      Text(e.name),
                    ],
                  ),
                ),
              )
              .toList();
        },
      ),
    );
  }

  Widget appThemeSetting() {
    return ListTile(
        title: Text(AppLocalizations.of(context)!.app_theme),
        leading: const Icon(Icons.format_paint_outlined),
        trailing: Switch(
          value: isLight!,
          thumbIcon: MaterialStateProperty.resolveWith<Icon?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return const Icon(Icons.circle);
            }
            return const Icon(Icons.wb_sunny);
          }),
          onChanged: (bool value) {
            if (value) {
              MyHomePage.setAppTheme(context, ThemeMode.light);
            } else {
              MyHomePage.setAppTheme(context, ThemeMode.dark);
            }

            setState(() {
              isLight = value;
            });
          },
        ));
  }
}
