import 'package:notes_common/notes_common.dart';
import 'package:riverpod/riverpod.dart';

class NoteFacade {
  NoteFacade();

  Future<List<Note>> getAll() async {
    return _notes;
  }

  Future<void> create({
    required String title,
    required String content,
  }) async {}

  Future<void> update({
    required String id,
    required String title,
    required String content,
  }) async {
    final note = Note(id: id, title: title, content: content);
    _notes = _notes.map((e) => e.id == note.id ? note : e).toList();
  }

  Future<void> delete({
    required String id,
  }) async {
    _notes = _notes.where((note) => note.id != id).toList();
  }
}

final noteFacadeProvider = Provider<NoteFacade>((ref) {
  return NoteFacade();
});

List<Note> _notes = [];
