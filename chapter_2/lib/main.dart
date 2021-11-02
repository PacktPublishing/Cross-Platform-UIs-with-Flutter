import 'package:chapter_2/localization/localization.dart';
import 'package:chapter_2/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  // Registering fonts licences
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  // Running the app
  runApp(
    const EquationsApp(),
  );
}

/// The root widget of the app.
class EquationsApp extends StatelessWidget {
  /// Creates an [EquationsApp] instance.
  const EquationsApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Localized app title
      onGenerateTitle: (context) => context.l10n.app_title,

      // Localization setup
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,

      // Routing setup
      onGenerateRoute: RouteGenerator.generateRoute,

      // Theme
      theme: ThemeData.light().copyWith(
        textTheme: GoogleFonts.latoTextTheme(),
      ),

      // Hiding the debug banner
      debugShowCheckedModeBanner: false,
    );
  }
}
