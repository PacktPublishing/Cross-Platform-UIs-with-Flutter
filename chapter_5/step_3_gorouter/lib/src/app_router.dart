import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_news/src/data/hacker_news_api_facade.dart';
import 'package:hacker_news/src/ui/home/home_view.dart';
import 'package:hacker_news/src/ui/story/story_details_view.dart';
import 'package:hacker_news/src/ui/story/story_web_view.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      redirect: (_) => '/stories/${StoriesType.newStories.name}',
    ),
    GoRoute(
      path: '/stories/:storyType',
      builder: (context, state) {
        final storyTypeName =
            state.params['storyType'] ?? StoriesType.newStories.name;
        final storyType = StoriesType.values.byName(storyTypeName);

        return HomeView(key: state.pageKey, storyType: storyType);
      },
      routes: [
        GoRoute(
          path: 'story/:id/details',
          name: StoryDetailsView.routeName,
          builder: (context, state) {
            final id = int.parse(state.params['id']!);

            return StoryDetailsView(key: state.pageKey, storyId: id);
          },
        ),
        GoRoute(
          path: 'story/:id/source',
          name: StoryWebView.routeName,
          builder: (context, state) {
            final id = int.parse(state.params['id']!);

            return StoryWebView(key: state.pageKey, storyId: id);
          },
        )
      ],
    ),
  ],
);
