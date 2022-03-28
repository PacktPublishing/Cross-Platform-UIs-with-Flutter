import 'package:contacts_app/src/data/data.dart';
import 'package:contacts_app/src/ui/contact/contact.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

class ContactEditView extends StatefulWidget {
  const ContactEditView({
    Key? key,
    this.id,
  }) : super(key: key);

  final int? id;

  static const routeNameEdit = '/contact-edit';
  static const routeNameCreate = '/contact-create';

  @override
  State<ContactEditView> createState() => _ContactEditViewState();
}

class _ContactEditViewState extends State<ContactEditView> {
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;

  late final _contact = context
      .read<ContactController?>()
      ?.contacts
      .firstWhereOrNull((contact) => contact.id == widget.id);

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController(text: _contact?.firstName);
    _lastNameController = TextEditingController(text: _contact?.lastName);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(_contact == null ? 'Create contact' : 'Edit contact'),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              if (Form.of(context)!.validate()) {}
            },
            icon: const Icon(Icons.save),
            label: const Text('Save'),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
          body: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 32,
            ),
            children: [
              TextFormField(
                controller: _firstNameController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  label: Text('First name'),
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    (value?.isEmpty ?? true) ? 'First name is required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _lastNameController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  label: Text('Last name'),
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    (value?.isEmpty ?? true) ? 'Last name is required' : null,
              ),
              ElevatedButton(
                onPressed: () {
                  Form.of(context)!.reset();
                },
                child: const Text('Reset'),
              )
            ],
          ),
        );
      }),
    );
  }
}
