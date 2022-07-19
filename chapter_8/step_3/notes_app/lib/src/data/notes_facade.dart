import 'package:dio/dio.dart';
import 'package:notes_app/src/common/util/device.dart';
import 'package:notes_common/notes_common.dart';
import 'package:riverpod/riverpod.dart';

class NoteFacade {
  NoteFacade(this.dio);

  final Dio dio;

  Future<List<Note>> getAll() async {
    final response = await dio.get<List<dynamic>>('/notes');
    final notes = response.data
            ?.cast<Map<String, dynamic>>()
            .map(Note.fromMap)
            .toList() ??
        [];

    return notes;
  }

  Future<void> create({
    required String title,
    required String content,
  }) async {
    await dio.post('/notes', data: {
      'title': title,
      'content': content,
    });
  }

  Future<void> update({
    required String id,
    required String title,
    required String content,
  }) async {
    await dio.put('/notes/$id', data: {
      'title': title,
      'content': content,
    });
  }

  Future<void> delete({
    required String id,
  }) async {
    await dio.delete('/notes/$id');
  }
}

final noteFacadeProvider = Provider<NoteFacade>((ref) {
  final baseUrl =
      isMobileDevice ? 'http://10.0.2.2:8080' : 'http://localhost:8080';
  final options = BaseOptions(baseUrl: baseUrl);

  return NoteFacade(Dio(options));
});
