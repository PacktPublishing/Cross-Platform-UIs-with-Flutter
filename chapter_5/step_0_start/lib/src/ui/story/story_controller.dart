import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:hacker_news/src/data/hacker_news_api_facade.dart';
import 'package:hacker_news/src/data/models/story.dart';

class StoryController with ChangeNotifier {
  StoryController(HackerNewsApiFacade? hackerNewsApiFacade)
      : _hackerNewsApiFacade = hackerNewsApiFacade ?? HackerNewsApiFacade();

  final HackerNewsApiFacade _hackerNewsApiFacade;

  List<Story> _stories = [];

  UnmodifiableListView<Story> get stories => UnmodifiableListView(_stories);
  Story? selectedStory;

  Future<void> getStories({
    StoriesType storiesType = StoriesType.newStories,
  }) async {
    final stories = await _hackerNewsApiFacade.getItems(
      storiesType: storiesType,
      fromMap: Story.fromMap,
    );

    _stories = stories;
    notifyListeners();
  }

  Future<void> getStoryById(int id) async {
    final story =
        await _hackerNewsApiFacade.getItem(id.toString(), Story.fromMap);

    selectedStory = story;
    notifyListeners();
  }
}
