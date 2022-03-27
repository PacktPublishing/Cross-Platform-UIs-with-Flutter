import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hacker_news/src/data/models/story.dart';
import 'package:hacker_news/src/ui/story/story_controller.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class StoryWebView extends StatefulWidget {
  const StoryWebView({
    Key? key,
    required this.storyId,
  }) : super(key: key);

  final int storyId;

  static const routeName = '/story-source';

  @override
  State<StoryWebView> createState() => _StoryWebViewState();
}

class _StoryWebViewState extends State<StoryWebView> {
  late final StoryController _storyController;

  @override
  void initState() {
    super.initState();
    _storyController = StoryController(context.read())
      ..getStoryById(widget.storyId);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _storyController,
      child: Scaffold(
        appBar: AppBar(),
        body: Selector<StoryController, Story?>(
          selector: (context, controller) => controller.selectedStory,
          builder: (context, story, child) {
            if (story == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (story.url == null) {
              return const Center(
                child: Text('This story does not have a link'),
              );
            }
            return WebView(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: story.url.toString(),
              gestureRecognizers: <Factory<VerticalDragGestureRecognizer>>{
                Factory<VerticalDragGestureRecognizer>(
                  () => VerticalDragGestureRecognizer(),
                )
              },
            );
          },
        ),
      ),
    );
  }
}

class StoryWebViewArguments {
  StoryWebViewArguments(this.storyId);

  final int storyId;
}
