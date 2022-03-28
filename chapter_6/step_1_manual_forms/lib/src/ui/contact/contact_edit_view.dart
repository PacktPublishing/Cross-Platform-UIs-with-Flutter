import 'package:flutter/material.dart';

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
  final _firstNameController = TextEditingController(text: 'John');
  final _lastNameController = TextEditingController(text: 'Smith');

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  String? _firstNameErrorMessage;
  String? _lastNameErrorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.id == null ? 'Create contact' : 'Edit contact'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            _firstNameErrorMessage = _firstNameController.text.isEmpty
                ? 'First name is required'
                : null;
            _lastNameErrorMessage = _lastNameController.text.isEmpty
                ? 'Last name is required'
                : null;
          });
        },
        icon: const Icon(Icons.add),
        label: const Text('Create contact'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 32,
        ),
        children: [
          TextField(
            controller: _firstNameController,
            decoration: InputDecoration(
              label: const Text('First name'),
              border: const OutlineInputBorder(),
              errorText: _firstNameErrorMessage,
            ),
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _lastNameController,
            decoration: InputDecoration(
              label: const Text('Last name'),
              border: const OutlineInputBorder(),
              errorText: _lastNameErrorMessage,
            ),
          ),
        ],
      ),
    );
  }
}
