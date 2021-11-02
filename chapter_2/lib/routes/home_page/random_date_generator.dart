import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

/// A date generator utility.
mixin RandomDateGenerator on Widget {
  /// Creates a random dates in 2022 and formats them as 'dd MMMM y'.
  ///
  /// For more info on the format, check the [Intl] package.
  String get randomDate {
    final random = Random();
    final date = DateTime(2022, random.nextInt(12) + 1, random.nextInt(28) + 1);

    return DateFormat('dd MMMM y').format(date);
  }
}
