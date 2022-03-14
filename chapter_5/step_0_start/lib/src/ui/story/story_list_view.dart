import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:hacker_news/src/data/hacker_news_api_facade.dart';
import 'package:hacker_news/src/data/models/story.dart';
import 'package:hacker_news/src/ui/story/story_controller.dart';
import 'package:provider/provider.dart';

class StoryListView extends StatefulWidget {
  static const routeName = '/stories';

  const StoryListView({
    Key? key,
    this.storiesType = StoriesType.newStories,
    this.storyController,
  }) : super(key: key);

  final StoriesType storiesType;
  final StoryController? storyController;

  @override
  State<StoryListView> createState() => _StoryListViewState();
}

class _StoryListViewState extends State<StoryListView> {
  late final StoryController _storyController;

  @override
  void initState() {
    super.initState();
    _storyController = StoryController(context.read());
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _storyController,
      child: Scaffold(
        body: Selector<StoryController, UnmodifiableListView<Story>>(
          selector: (context, controller) => controller.stories,
          builder: (context, state, child) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text('Story List'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
