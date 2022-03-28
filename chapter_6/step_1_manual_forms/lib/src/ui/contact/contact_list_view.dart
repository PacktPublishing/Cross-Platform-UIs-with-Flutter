import 'package:contacts_app/src/app_router.dart';
import 'package:contacts_app/src/ui/contact/contact.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Displays a list of SampleItems.
class ContactListView extends StatelessWidget {
  const ContactListView({
    Key? key,
  }) : super(key: key);

  static const routeName = 'contacts';

  @override
  Widget build(BuildContext context) {
    final contacts = context.watch<ContactController>().contacts;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          appRouter.pushNamed(ContactEditView.routeNameCreate);
        },
        icon: const Icon(Icons.add),
        label: const Text('Create contact'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 32,
        ),
        restorationId: 'sampleItemListView',
        itemCount: contacts.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (BuildContext context, int index) {
          final contact = contacts[index];

          return ListTile(
            title: Text('${contact.firstName} ${contact.lastName}'),
            leading: CircleAvatar(
              child: Text(contact.firstName.characters.first),
            ),
            onTap: () {
              appRouter.pushNamed(ContactDetailsView.routeName,
                  params: {'id': contact.id.toString()});
            },
          );
        },
      ),
    );
  }
}
