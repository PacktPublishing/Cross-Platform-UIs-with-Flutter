import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:hacker_news/src/ui/home/home_view.dart';
import 'package:hacker_news/src/ui/story/story_details_view.dart';
import 'package:hacker_news/src/ui/story/story_list_view.dart';
import 'package:hacker_news/src/ui/story/story_web_view.dart';

class HackerNewsApp extends StatelessWidget {
  const HackerNewsApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      restorationScopeId: 'app',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
      ],
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case StoryDetailsView.routeName:
                assert(routeSettings.arguments != null);
                final arguments =
                    routeSettings.arguments as StoryDetailsViewArguments;

                return StoryDetailsView(
                  storyId: arguments.storyId,
                );

              case StoryWebView.routeName:
                assert(routeSettings.arguments != null);
                final arguments =
                    routeSettings.arguments as StoryWebViewArguments;

                return StoryWebView(
                  storyId: arguments.storyId,
                );

              case StoryListView.routeName:
              default:
                return const HomeView();
            }
          },
        );
      },
      home: const HomeView(),
    );
  }
}
