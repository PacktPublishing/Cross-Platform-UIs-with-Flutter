/// An entry of the standings list.
class StandingsEntry {
  /// The racer name.
  final String name;

  /// The country code.
  final String countryCode;

  /// The diver's points.
  final int points;

  /// Creates a [StandingsEntry] object.
  const StandingsEntry({
    required this.name,
    required this.countryCode,
    required this.points,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    if (other is StandingsEntry) {
      return runtimeType == other.runtimeType &&
          name == other.name &&
          countryCode == other.countryCode &&
          points == other.points;
    } else {
      return false;
    }
  }

  @override
  int get hashCode {
    var result = 17;

    result = result * 37 + name.hashCode;
    result = result * 37 + countryCode.hashCode;

    return result * 37 + points.hashCode;
  }
}
