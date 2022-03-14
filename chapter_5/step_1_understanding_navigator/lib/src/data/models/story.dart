import 'dart:convert';

import 'package:hacker_news/src/data/models/item.dart';

class Story extends Item {
  Story({
    required String by,
    required int descendants,
    required String title,
    required int id,
    required int score,
    required List<int>? kids,
    required DateTime time,
    required ItemType type,
    required Uri url,
  }) : super(
          by: by,
          descendants: descendants,
          title: title,
          id: id,
          score: score,
          kids: kids,
          time: time,
          type: type,
          url: url,
        );

  @override
  factory Story.fromMap(Map<String, dynamic> map) {
    return Story(
      by: map['by'],
      descendants: map['descendants']?.toInt() ?? 0,
      title: map['title'],
      id: map['id']!.toInt(),
      kids: List<int>.from(map['kids']),
      score: map['score']?.toInt() ?? 0,
      type: ItemType.values.byName(map['type']),
      time: DateTime.fromMillisecondsSinceEpoch(map['time']),
      url: Uri.parse(map['url']),
    );
  }

  factory Story.fromJson(String source) => Story.fromMap(json.decode(source));
}
