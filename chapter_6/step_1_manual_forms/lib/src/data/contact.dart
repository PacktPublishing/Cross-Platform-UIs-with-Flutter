/// A placeholder class that represents an entity or model.
class Contact {
  const Contact({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.emailAddress,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String emailAddress;
}
