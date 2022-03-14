import 'package:flutter/material.dart';
import 'package:hacker_news/src/data/models/story.dart';
import 'package:hacker_news/src/ui/story/story_controller.dart';
import 'package:provider/provider.dart';

class StoryDetailsView extends StatefulWidget {
  const StoryDetailsView({
    Key? key,
    required this.storyId,
    this.storyController,
  }) : super(key: key);

  final int storyId;
  final StoryController? storyController;

  static const routeName = '/story-details';

  @override
  State<StoryDetailsView> createState() => _StoryDetailsViewState();
}

class _StoryDetailsViewState extends State<StoryDetailsView> {
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
        appBar: AppBar(),
        body: Selector<StoryController, Story?>(
          selector: (context, controller) => controller.selectedStory,
          builder: (context, state, child) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Story Details'),
                if (Navigator.canPop(context))
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Go back'),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
