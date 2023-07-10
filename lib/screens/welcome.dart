import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopmate/routes/routes.dart';
import '../utils/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: welcomeScreenView(context),
    );
  }

  Widget welcomeScreenView(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Theme.of(context).colorScheme.secondaryContainer,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              Constants.appLogo,
              scale: 5,
            ),
            Text(
              Constants.appName,
              style: GoogleFonts.patuaOne(fontSize: 50),
            ),
            const Text(Constants.appSlogan),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: TextButton(
                  onPressed: () {

                    //Navigate to home screen
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      homeRoute,
                      (route) => false,
                    );
                  },
                  child: Text(
                    AppLocalizations.of(context)!.getStarted,
                    style: const TextStyle(fontSize: 18),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
