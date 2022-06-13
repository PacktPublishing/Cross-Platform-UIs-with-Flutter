import 'package:dart_frog/dart_frog.dart';
import 'package:notes_common/notes_common.dart';

import '../../data/notes.dart';

Future<Response> onRequest(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.get:
      return _handleGet(context);
    case HttpMethod.post:
      return _handlePost(context);
    // ignore: no_default_cases
    default:
      return Response(statusCode: 404);
  }
}

Response _handleGet(RequestContext context) {
  return Response.json(
    body: notes.map((e) => e.toMap()).toList(),
  );
}

Future<Response> _handlePost(RequestContext context) async {
  final body = await context.request.json();
  final note = Note.fromMap(body).copyWith(id: (notes.length + 1).toString());

  notes = [...notes, note];

  return Response.json(
    body: note.toMap(),
  );
}
