import 'package:collection/collection.dart';
import 'package:contacts_app/src/app_router.dart';
import 'package:contacts_app/src/data/data.dart';
import 'package:contacts_app/src/ui/contact/contact.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactDetailsView extends StatelessWidget {
  const ContactDetailsView({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  static const routeName = '/contact-details';

  @override
  Widget build(BuildContext context) {
    final contact = context.select<ContactController, Contact?>((controller) =>
        controller.contacts.firstWhereOrNull((contact) => contact.id == id));

    if (contact == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Text('This contact does not exist'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Details'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          appRouter.pushNamed(
            ContactEditView.routeNameEdit,
            params: {'id': id.toString()},
          );
        },
        icon: const Icon(Icons.edit),
        label: const Text('Edit contact'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 32,
        ),
        children: [
          ListTile(
            dense: true,
            title: const Text('Name'),
            subtitle: Text('${contact.firstName} ${contact.lastName}'),
          ),
          ListTile(
            dense: true,
            title: const Text('Phone'),
            subtitle: Text(contact.phoneNumber),
          ),
          ListTile(
            dense: true,
            title: const Text('Email'),
            subtitle: Text(contact.emailAddress),
          ),
        ],
      ),
    );
  }
}
