import 'package:flutter/material.dart';

class ContactEditView extends StatelessWidget {
  const ContactEditView({
    Key? key,
    this.id,
  }) : super(key: key);

  final int? id;

  static const routeNameEdit = '/contact-edit';
  static const routeNameCreate = '/contact-create';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(id == null ? 'Create contact' : 'Edit contact'),
      ),
      body: const Center(
        child: Text('More Information Here'),
      ),
    );
  }
}
