import 'package:notes_app/src/data/notes_facade.dart';
import 'package:riverpod/riverpod.dart';

import 'notes_providers.dart';

class NoteActionController {
  const NoteActionController(this.ref);

  final Ref ref;

  Future<void> createNote({
    required String title,
    required String content,
  }) async {
    final noteService = ref.read(noteFacadeProvider);

    try {
      await noteService.create(title: title, content: content);

      ref.refresh(notesProvider);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> updateNote({
    required String id,
    required String title,
    required String content,
  }) async {
    final noteService = ref.read(noteFacadeProvider);

    try {
      await noteService.update(id: id, title: title, content: content);

      ref.refresh(notesProvider);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
