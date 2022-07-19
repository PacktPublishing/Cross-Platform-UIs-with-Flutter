import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:notes_app/src/app_router.dart';
import 'package:notes_app/src/ui/notes/note_details_view.dart';

import 'notes_providers.dart';

class NotesListView extends ConsumerWidget {
  const NotesListView({Key? key}) : super(key: key);

  static const routeName = '/notes';

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        actions: [
          Consumer(builder: (context, ref, _) {
            final layout = ref.watch(layoutProviderProvider);
            final iconData =
                layout == Layout.grid ? Icons.grid_view : Icons.view_stream;

            return IconButton(
              icon: Icon(iconData),
              onPressed: () {
                final newLayout =
                    layout == Layout.grid ? Layout.list : Layout.grid;
                ref.read(layoutProviderProvider.notifier).state = newLayout;
              },
            );
          }),
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.zero,
        child: FloatingActionButton.extended(
          elevation: 0,
          onPressed: () {
            appRouter.pushNamed(NoteDetailsView.routeNameCreate);
          },
          label: const Text('Add note'),
        ),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Consumer(
          builder: (context, __, _) {
            final notes = ref.watch(notesProvider);
            final layout = ref.watch(layoutProviderProvider);

            return RefreshIndicator(
              onRefresh: () => ref.refresh(notesProvider.future),
              child: notes.maybeWhen(
                data: (data) {
                  if (layout == Layout.grid) {
                    return SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1200),
                        child: StaggeredGrid.count(
                          crossAxisCount: 2,
                          children: data.map(
                            (note) {
                              return Card(
                                elevation: 0,
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  side: const BorderSide(color: Colors.grey),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        note.title,
                                        maxLines: 2,
                                      ),
                                      const Gap(8),
                                      Text(
                                        note.content,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 4,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final note = data[index];

                      return GestureDetector(
                        onTap: () => appRouter.pushNamed(
                          NoteDetailsView.routeNameEdit,
                          params: {'id': note.id},
                        ),
                        child: Card(
                          elevation: 0,
                          color: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                            side: const BorderSide(color: Colors.grey),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  note.title,
                                  maxLines: 2,
                                ),
                                const Gap(8),
                                Text(
                                  note.content,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 4,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: data.length,
                  );
                },
                orElse: () => Container(),
              ),
            );
          },
        ),
      ),
    );
  }
}

final layoutProviderProvider = StateProvider<Layout>((ref) {
  return Layout.list;
});

enum Layout { grid, list }
