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
    required Uri? url,
    required this.text,
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

  final String? text;

  @override
  factory Story.fromMap(Map<String, dynamic> map) {
    final int timeInMilliSeconds = int.parse('${map["time"]}000');

    return Story(
      by: map['by'],
      descendants: map['descendants']?.toInt() ?? 0,
      title: map['title'],
      text: map['text'],
      id: map['id']!.toInt(),
      kids: List<int>.from(map['kids'] ?? []),
      score: map['score']?.toInt() ?? 0,
      type: ItemType.values.byName(map['type']),
      time: DateTime.fromMillisecondsSinceEpoch(timeInMilliSeconds),
      url: Uri.tryParse(map['url'] ?? ''),
    );
  }

  factory Story.fromJson(String source) => Story.fromMap(json.decode(source));
}
