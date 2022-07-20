import 'package:chapter_2/localization/localization.dart';
import 'package:chapter_2/routes.dart';
import 'package:chapter_2/routes/home_page/results_tab.dart';
import 'package:chapter_2/routes/home_page/standings_tab.dart';
import 'package:flutter/material.dart';

/// The home page of the app contains the overall results of the various races
/// and the standings.
class HomePage extends StatelessWidget {
  /// Creates a [HomePage] widget.
  const HomePage({
    Key? key,
  }) : super(key: key);

  void _openNextRaces(BuildContext context) {
    Navigator.of(context).pushNamed(RouteGenerator.nextRacesPage);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.app_title),
          elevation: 5,
          actions: [
            IconButton(
              onPressed: () => _openNextRaces(context),
              icon: const Icon(Icons.calendar_today_outlined),
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                icon: const Icon(Icons.list),
                text: context.l10n.results,
              ),
              Tab(
                icon: const Icon(Icons.group),
                text: context.l10n.standings,
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ResultsTab(),
            StandingsTab(),
          ],
        ),
      ),
    );
  }
}
