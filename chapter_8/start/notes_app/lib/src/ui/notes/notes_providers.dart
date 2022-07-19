import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:notes_app/src/ui/notes/note_action_controller.dart';
import 'package:notes_app/src/data/notes_facade.dart';

import 'package:notes_common/notes_common.dart';
import 'package:riverpod/riverpod.dart';

final notesProvider = FutureProvider<List<Note>>((ref) async {
  final notesService = ref.read(noteFacadeProvider);

  try {
    return notesService.getAll();
  } on DioError catch (e) {
    if (kDebugMode) {
      print(e.message);
    }
    rethrow;
  }
});

final noteActionControllerProvider = Provider<NoteActionController>((ref) {
  return NoteActionController(ref);
});
