import 'package:flutter/material.dart';

import 'package:hacker_news/src/data/hacker_news_api_facade.dart';
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
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          for (final storiesType in StoriesType.values)
            StoryListView(
              storiesType: storiesType,
            ),
        ],
      ),
    );
  }
}
