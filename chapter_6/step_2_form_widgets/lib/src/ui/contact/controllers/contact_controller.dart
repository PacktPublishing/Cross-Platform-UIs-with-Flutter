import 'package:contacts_app/src/data/contact.dart';
import 'package:flutter/cupertino.dart';

class ContactController extends ChangeNotifier {
  final List<Contact> _contacts = [];
  List<Contact> get contacts => List.unmodifiable(_contacts);

  void addContact(Contact newContact) {
    _contacts.add(newContact);
    notifyListeners();
  }

  void deleteContact(int id) {
    _contacts.removeWhere((contact) => contact.id == id);
    notifyListeners();
  }

  void updateContact(Contact updatedContact) {
    _contacts[_contacts.indexWhere(
        (element) => element.id == updatedContact.id)] = updatedContact;
    notifyListeners();
  }
}
