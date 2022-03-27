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
      body: ListView.builder(
        restorationId: 'sampleItemListView',
        itemCount: contacts.length,
        itemBuilder: (BuildContext context, int index) {
          final item = contacts[index];

          return ListTile(
              title: Text('Contact ${item.id}'),
              leading: const CircleAvatar(
                foregroundImage: AssetImage('assets/images/flutter_logo.png'),
              ),
              onTap: () {
                appRouter.pushNamed(ContactDetailsView.routeName,
                    params: {'id': item.id.toString()});
              });
        },
      ),
    );
  }
}
