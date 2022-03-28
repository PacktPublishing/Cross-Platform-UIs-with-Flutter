import 'package:contacts_app/src/app_router.dart';
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
  late final _contact = context
      .read<ContactController?>()
      ?.contacts
      .firstWhereOrNull((contact) => contact.id == widget.id);

  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController(text: _contact?.firstName);
    _lastNameController = TextEditingController(text: _contact?.lastName);
    _emailController = TextEditingController(text: _contact?.emailAddress);
    _phoneController = TextEditingController(text: _contact?.phoneNumber);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
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
            onPressed: () async {
              ScaffoldFeatureController? scaffoldController;

              if (Form.of(context)!.validate()) {
                final contactController = context.read<ContactController>();
                if (_contact == null) {
                  final newContact = Contact(
                    id: contactController.contacts.length + 1,
                    firstName: _firstNameController.text,
                    lastName: _lastNameController.text,
                    emailAddress: _emailController.text,
                    phoneNumber: _phoneController.text,
                  );
                  contactController.addContact(newContact);
                  scaffoldController =
                      ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:
                          Text('Successfully created ${newContact.firstName}'),
                    ),
                  );
                  await scaffoldController.closed;
                  appRouter.goNamed(ContactDetailsView.routeName, params: {
                    'id': newContact.id.toString(),
                  });
                } else {
                  final updatedContact = _contact!.copyWith(
                    firstName: _firstNameController.text,
                    lastName: _lastNameController.text,
                    emailAddress: _emailController.text,
                    phoneNumber: _phoneController.text,
                  );
                  contactController.updateContact(updatedContact);
                  scaffoldController =
                      ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:
                          Text('Successfully updated ${_contact!.firstName}'),
                    ),
                  );
                  await scaffoldController.closed;
                  appRouter.pop();
                }
              }
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  controller: _firstNameController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    label: Text('First name'),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => (value?.isEmpty ?? true)
                      ? 'First name is required'
                      : null,
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  controller: _lastNameController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    label: Text('Last name'),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      (value?.isEmpty ?? true) ? 'Last name is required' : null,
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  controller: _phoneController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    label: Text('Phone'),
                    border: OutlineInputBorder(),
                  ),
                  validator: _handlePhoneValidation,
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  controller: _emailController,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    label: Text('Email'),
                    border: OutlineInputBorder(),
                  ),
                  validator: _handleEmailValidation,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  String? _handlePhoneValidation(String? value) {
    final isMissing = value?.isEmpty ?? true;

    if (isMissing || !isPhoneNumber(value)) {
      return 'Please provide a valid phone number';
    }

    return null;
  }

  String? _handleEmailValidation(String? value) {
    final isMissing = value?.isEmpty ?? true;

    if (isMissing || !isEmail(value)) {
      return 'Please provide a valid email address';
    }

    return null;
  }
}
