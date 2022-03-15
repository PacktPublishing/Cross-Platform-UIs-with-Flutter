import 'package:flutter/material.dart';

import 'package:hacker_news/src/data/hacker_news_api_facade.dart';
import 'package:hacker_news/src/ui/story/story_details_view.dart';
import 'package:hacker_news/src/ui/story/story_list_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late final TabController _controller;
  late final List<GlobalKey<NavigatorState>> _navigatorKeys =
      List.generate(StoriesType.values.length, (index) => GlobalKey());

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: StoriesType.values.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hacker News'),
        bottom: TabBar(
          controller: _controller,
          tabs: [
            for (final storiesType in StoriesType.values)
              Tab(text: storiesType.displayName)
          ],
          onTap: (index) => _tap(context, index),
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          for (final storiesType in StoriesType.values)
            Navigator(
              key: _navigatorKeys[StoriesType.values.indexOf(storiesType)],
              onGenerateRoute: (RouteSettings routeSettings) {
                return MaterialPageRoute<void>(
                  settings: routeSettings,
                  builder: (BuildContext context) {
                    switch (routeSettings.name) {
                      case StoryDetailsView.routeName:
                        assert(routeSettings.arguments != null);
                        final arguments = routeSettings.arguments
                            as StoryDetailsViewArguments;

                        return StoryDetailsView(
                          storyId: arguments.storyId,
                        );
                      case StoryListView.routeName:
                      default:
                        return StoryListView(
                          storiesType: storiesType,
                        );
                    }
                  },
                );
              },
            )
        ],
      ),
    );
  }

  void _tap(BuildContext context, int index) {
    final navigator = _navigatorKeys[index];

    if (index == _controller.index) {
      navigator.currentState?.maybePop();
    }
  }
}
