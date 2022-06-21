import 'package:dart_frog/dart_frog.dart';
import 'package:notes_common/notes_common.dart';

import '../../data/notes.dart';

Future<Response> onRequest(RequestContext context, String id) async {
  switch (context.request.method) {
    case HttpMethod.put:
      return _handlePut(context, id);
    case HttpMethod.delete:
      return _handleDelete(context, id);
    // ignore: no_default_cases
    default:
      return Response(statusCode: 404);
  }
}

Future<Response> _handlePut(RequestContext context, String id) async {
  final body = await context.request.json();
  final note = Note.fromMap(body).copyWith(id: id);
  notes = notes.map((e) => e.id == note.id ? note : e).toList();

  return Response.json(
    body: note.toMap(),
  );
}

Response _handleDelete(RequestContext context, String id) {
  notes = notes.where((note) => note.id != id).toList();

  return Response(statusCode: 204);
}
