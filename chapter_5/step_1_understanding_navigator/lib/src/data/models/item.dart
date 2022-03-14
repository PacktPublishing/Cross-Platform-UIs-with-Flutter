import 'dart:convert';

class Item {
  final String by;
  final int descendants;
  final String title;
  final int id;
  final List<int>? kids;
  final int score;
  final ItemType type;
  final DateTime time;
  final Uri url;

  Item({
    required this.by,
    required this.descendants,
    required this.title,
    required this.id,
    required this.score,
    required this.kids,
    required this.time,
    required this.type,
    required this.url,
  });

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
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

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));
}

enum ItemType {
  job,
  story,
  comment,
  poll,
}
