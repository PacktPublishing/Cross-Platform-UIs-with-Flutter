import 'package:notes_app/src/ui/notes/notes.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      redirect: (_) => '/notes',
    ),
    GoRoute(
      path: '/notes',
      name: NotesListView.routeName,
      builder: (context, state) {
        return NotesListView(key: state.pageKey);
      },
      routes: [
        GoRoute(
          path: ':id/edit',
          name: NoteDetailsView.routeNameEdit,
          builder: (context, state) {
            final id = state.params['id']!;

            return NoteDetailsView(id: id);
          },
        ),
        GoRoute(
          path: 'new',
          name: NoteDetailsView.routeNameCreate,
          builder: (context, state) {
            return const NoteDetailsView();
          },
        )
      ],
    ),
  ],
);
