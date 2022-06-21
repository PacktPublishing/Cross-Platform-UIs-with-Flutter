import 'package:faker/faker.dart';
import 'package:notes_common/notes_common.dart';

List<Note> notes = List.generate(
  10,
  (index) => Note(
    id: index.toString(),
    title: _faker.lorem.sentence(),
    content: _faker.lorem.sentences(5).join(' '),
  ),
);

final _faker = Faker();
