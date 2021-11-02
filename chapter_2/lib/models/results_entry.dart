/// An entry of the results list.
class ResultsEntry {
  /// The racer name.
  final String name;

  /// The racer surname.
  final String surname;

  /// The country code.
  final String countryCode;

  /// The current position.
  final int position;

  /// The circuit name.
  final String circuitName;

  /// Creates a [ResultsEntry] object.
  const ResultsEntry({
    required this.name,
    required this.surname,
    required this.countryCode,
    required this.position,
    required this.circuitName,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    if (other is ResultsEntry) {
      return runtimeType == other.runtimeType &&
          name == other.name &&
          surname == other.surname &&
          countryCode == other.countryCode &&
          circuitName == other.circuitName &&
          position == other.position;
    } else {
      return false;
    }
  }

  @override
  int get hashCode {
    var result = 17;

    result = result * 37 + name.hashCode;
    result = result * 37 + surname.hashCode;
    result = result * 37 + countryCode.hashCode;

    return result * 37 + position.hashCode;
  }
}
