import 'package:contacts_app/src/ui/contact/contact.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final appRouter = GoRouter(
  navigatorBuilder: (context, state, child) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ContactController(),
        ),
      ],
      builder: (_, __) => child,
    );
  },
  routes: [
    GoRoute(
      path: '/',
      redirect: (_) => '/contacts',
    ),
    GoRoute(
      path: '/contacts',
      name: ContactListView.routeName,
      builder: (context, state) {
        return ContactListView(key: state.pageKey);
      },
      routes: [
        GoRoute(
          path: ':id/details',
          name: ContactDetailsView.routeName,
          builder: (context, state) {
            final id = int.parse(state.params['id']!);

            return ContactDetailsView(id: id);
          },
        ),
        GoRoute(
          path: ':id/edit',
          name: ContactEditView.routeNameEdit,
          builder: (context, state) {
            final id = int.parse(state.params['id']!);

            return ContactEditView(id: id);
          },
        ),
        GoRoute(
          path: 'new',
          name: ContactEditView.routeNameCreate,
          builder: (context, state) {
            return const ContactEditView();
          },
        )
      ],
    ),
  ],
);
