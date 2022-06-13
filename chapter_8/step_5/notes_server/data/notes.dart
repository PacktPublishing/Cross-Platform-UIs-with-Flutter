import 'package:faker/faker.dart';
import 'package:notes_common/notes_common.dart';

List<Note> notes = [
  Note(
    id: '1',
    title: _faker.lorem.sentence(),
    content: _faker.lorem.sentences(5).join(' '),
  ),
  Note(
    id: '2',
    title: _faker.lorem.sentence(),
    content: _faker.lorem.sentences(5).join(' '),
  ),
];

final _faker = Faker();
