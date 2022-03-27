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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Contact &&
        other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.phoneNumber == phoneNumber &&
        other.emailAddress == emailAddress;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        phoneNumber.hashCode ^
        emailAddress.hashCode;
  }

  @override
  String toString() {
    return 'Contact(id: $id, firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, emailAddress: $emailAddress)';
  }

  Contact copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? emailAddress,
  }) {
    return Contact(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      emailAddress: emailAddress ?? this.emailAddress,
    );
  }
}
