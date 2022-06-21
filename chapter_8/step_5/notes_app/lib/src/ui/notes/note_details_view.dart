import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notes_app/src/app_router.dart';

import 'notes_providers.dart';
import 'widgets/note_form.dart';

class NoteDetailsView extends StatefulWidget {
  const NoteDetailsView({
    Key? key,
    this.id,
  }) : super(key: key);

  final String? id;

  static const routeNameEdit = '/note-edit';
  static const routeNameCreate = '/note-create';

  @override
  State<NoteDetailsView> createState() => _NoteDetailsViewState();
}

class _NoteDetailsViewState extends State<NoteDetailsView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        if (widget.id == null) {
          return NoteForm(
            formKey: _formKey,
            onSubmit: (formData) {
              ref.read(noteActionControllerProvider).createNote(
                    title: formData.title ?? '',
                    content: formData.content ?? '',
                  );

              appRouter.pop();
            },
          );
        }

        final note = ref.watch(
          notesProvider.select((data) => data.whenData(
              (data) => data.firstWhereOrNull((note) => note.id == widget.id))),
        );

        return note.maybeWhen(
          data: (data) => NoteForm(
            formKey: _formKey,
            onSubmit: (formData) {
              ref.read(noteActionControllerProvider).updateNote(
                    id: widget.id!,
                    title: formData.title ?? '',
                    content: formData.content ?? '',
                  );

              appRouter.pop();
            },
            note: NoteFormData(
              title: data?.title,
              content: data?.content ?? '',
            ),
          ),
          orElse: () => Container(),
        );
      },
    );
  }
}
