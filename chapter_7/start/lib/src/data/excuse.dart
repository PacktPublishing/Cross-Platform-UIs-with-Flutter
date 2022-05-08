import 'package:equatable/equatable.dart';

class Excuse extends Equatable {
  final String? text;
  final int? id;

  Excuse.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        text = json['text'];

  @override
  List<Object?> get props => [id, text];

  @override
  bool? get stringify => true;
}
