import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:hacker_news/src/data/hacker_news_api_facade.dart';
import 'package:hacker_news/src/data/models/story.dart';
import 'package:hacker_news/src/ui/story/story_details_view.dart';
import 'package:hacker_news/src/ui/story/story_controller.dart';

import 'package:hacker_news/src/ui/story/story_web_view.dart';
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

class _StoryListViewState extends State<StoryListView>
    with AutomaticKeepAliveClientMixin {
  late final StoryController _storyController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _storyController = StoryController(context.read())
      ..getStories(widget.storiesType);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return ChangeNotifierProvider.value(
      value: _storyController,
      child: Scaffold(
        body: Selector<StoryController, UnmodifiableListView<Story>>(
          selector: (context, controller) => controller.stories,
          builder: (context, stories, child) {
            return ListView.builder(
              itemCount: stories.length,
              itemBuilder: (BuildContext context, int index) {
                final story = stories[index];

                return ListTile(
                  title: Text(
                    story.title,
                  ),
                  subtitle: GestureDetector(
                    onTap: () => _navigateToStoryComments(story),
                    child: Text('${story.descendants} comments'),
                  ),
                  trailing: IconButton(
                    onPressed: () => _navigateToWebview(story),
                    icon: const Icon(Icons.exit_to_app),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  void _navigateToStoryComments(Story story) {
    Navigator.of(context).pushNamed(
      StoryDetailsView.routeName,
      arguments: StoryDetailsViewArguments(story.id),
    );
  }

  void _navigateToWebview(Story story) {
    Navigator.of(context).pushNamed(
      StoryWebView.routeName,
      arguments: StoryWebViewArguments(story.id),
    );
  }
}
