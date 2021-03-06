import 'dart:convert';

import 'package:hacker_news/src/data/models/item.dart';
import 'package:hacker_news/src/data/models/story.dart';
import 'package:http/http.dart' as http;

class HackerNewsApiFacade {
  final Uri endpoint = Uri.parse('https://hacker-news.firebaseio.com/v0');
  final http.Client _client = http.Client();

  Future<List<Story>> getStories({
    int storyCount = 10,
    StoriesType storiesType = StoriesType.newStories,
  }) async {
    try {
      return await getItems(
        storiesType: storiesType,
        fromMap: Story.fromMap,
      );
    } catch (e) {
      print('HackerNewsClient.getTopStories $e');
      rethrow;
    }
  }

  Future<List<T>> getItems<T extends Item>({
    int count = 10,
    StoriesType storiesType = StoriesType.newStories,
    required T Function(Map<String, dynamic> json) fromMap,
  }) async {
    try {
      Uri url = Uri.parse('$endpoint/${storiesType.name.toLowerCase()}.json');
      http.Response response = await _client.get(url);
      if (response.statusCode == 200) {
        List<int> ids = List<int>.from(jsonDecode(response.body));

        ids.removeRange(count, ids.length);
        final items = await Future.wait(ids.map((int id) async {
          final item = await getItem<T>(id.toString(), fromMap);
          return item;
        }).toList());

        return items;
      }
      throw HackerNewsApiException(
        statusCode: response.statusCode,
        message: response.body,
      );
    } catch (e) {
      print('HackerNewsClient.getItems $e');
      rethrow;
    }
  }

  Future<T> getItem<T extends Item>(
      String id, T Function(Map<String, dynamic> json) fromMap) async {
    try {
      final url = Uri.parse('$endpoint/item/$id.json');
      final response = await _client.get(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);

        if (json['type'] == 'story') {
          return fromMap(json);
        }
      }

      throw HackerNewsApiException(
        statusCode: response.statusCode,
        message: response.body,
      );
    } catch (e) {
      print('HackerNewsClient.getItem $e');
      rethrow;
    }
  }
}

class HackerNewsApiException implements Exception {
  final int? statusCode;
  final String? message;

  const HackerNewsApiException({this.statusCode, this.message});
}

enum StoriesType {
  newStories,
  topStories,
  askStories,
  showStories,
  jobStories,
}

extension StoriesTypeDisplayName on StoriesType {
  String get displayName {
    assert(_storyTypeDisplayNameMap[this] != null);

    return _storyTypeDisplayNameMap[this]!;
  }
}

const _storyTypeDisplayNameMap = {
  StoriesType.newStories: 'New',
  StoriesType.topStories: 'Top',
  StoriesType.askStories: 'Ask',
  StoriesType.showStories: 'Show',
  StoriesType.jobStories: 'Job',
};
