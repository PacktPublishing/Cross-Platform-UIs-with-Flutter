import 'package:flutter/material.dart';

class StoryDetailsView extends StatelessWidget {
  const StoryDetailsView({
    Key? key,
    required this.storyId,
  }) : super(key: key);

  final int storyId;

  static const routeName = '/story-details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
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
    );
  }
}
