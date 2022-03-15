import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class StoryDetailsView extends StatelessWidget {
  const StoryDetailsView({
    Key? key,
    required this.storyId,
  }) : super(key: key);

  final int storyId;

  static const routeName = '/story-comments';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: 'https://news.ycombinator.com/item?id=$storyId',
        gestureRecognizers: <Factory<VerticalDragGestureRecognizer>>{
          Factory<VerticalDragGestureRecognizer>(
            () => VerticalDragGestureRecognizer(),
          )
        },
      ),
    );
  }
}

class StoryDetailsViewArguments {
  StoryDetailsViewArguments(this.storyId);

  final int storyId;
}
