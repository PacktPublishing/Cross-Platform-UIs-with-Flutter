import 'package:flutter/material.dart';

class ContactDetailsView extends StatelessWidget {
  const ContactDetailsView({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  static const routeName = '/contact-details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Details'),
      ),
      body: const Center(
        child: Text('More Information Here'),
      ),
    );
  }
}
