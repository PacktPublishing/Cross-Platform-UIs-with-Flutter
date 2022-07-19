import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NoteForm extends StatefulWidget {
  const NoteForm({
    Key? key,
    this.formKey,
    this.note,
    this.onSubmit,
  }) : super(key: key);

  final NoteFormData? note;
  final Key? formKey;
  final void Function(NoteFormData)? onSubmit;

  @override
  State<NoteForm> createState() => _NoteFormState();
}

class _NoteFormState extends State<NoteForm> {
  late final TextEditingController _titleController;
  late final TextEditingController _contentController;
  late final _noteFormData = widget.note ?? const NoteFormData();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note?.title);
    _contentController = TextEditingController(text: widget.note?.content);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          widget.onSubmit?.call(
            _noteFormData.copyWith(
              title: _titleController.text,
              content: _contentController.text,
            ),
          );
        },
        label: const Text('Save'),
      ),
      body: Form(
        key: widget.formKey,
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            TextFormField(
              decoration: const InputDecoration(
                label: Text('Title'),
                hintText: 'Add a title',
                border: OutlineInputBorder(),
              ),
              controller: _titleController,
            ),
            const Gap(16),
            TextFormField(
              maxLines: 4,
              decoration: const InputDecoration(
                label: Text('Note'),
                hintText: 'Take a note',
                border: OutlineInputBorder(),
              ),
              controller: _contentController,
            ),
          ],
        ),
      ),
    );
  }
}

class NoteFormData {
  const NoteFormData({
    this.content,
    this.title,
  });

  final String? content;
  final String? title;

  NoteFormData copyWith({
    String? content,
    String? title,
  }) {
    return NoteFormData(
      content: content ?? this.content,
      title: title ?? this.title,
    );
  }

  @override
  String toString() => 'NoteFormData(content: $content, title: $title)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NoteFormData &&
        other.content == content &&
        other.title == title;
  }

  @override
  int get hashCode => content.hashCode ^ title.hashCode;
}
