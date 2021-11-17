import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

/// A date generator utility.
mixin RandomDateGenerator on Widget {
  /// Creates a random date in 2022 and formats it as 'dd MMMM y'.
  ///
  /// For more info on the format, check the [Intl] package.
  String get randomDate {
    final random = Random();

    final month = random.nextInt(12) + 1;
    final day = random.nextInt(27) + 1;

    return DateFormat('dd MMMM y').format(
      DateTime(2022, month, day + 1),
    );
  }
}
