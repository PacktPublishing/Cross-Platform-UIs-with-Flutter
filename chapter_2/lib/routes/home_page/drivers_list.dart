import 'package:chapter_2/models/results_entry.dart';
import 'package:chapter_2/routes/home_page/country_flag.dart';
import 'package:chapter_2/routes/home_page/number_indicator.dart';
import 'package:flutter/material.dart';

/// Shows a list of drivers with their flag, name, surname and position.
class DriversList extends StatelessWidget {
  /// The data.
  final List<ResultsEntry> results;

  /// Creates a [DriversList] entry
  const DriversList({
    Key? key,
    required this.results,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: results.length,
      itemBuilder: (context, index) {
        final item = results[index];

        return ListTile(
          title: Text(item.surname),
          subtitle: Text(item.name),
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CountryFlag(
                countryCode: item.countryCode,
                radius: 8,
                width: 20,
              ),
            ],
          ),
          trailing: NumberIndicator(
            number: index + 1,
          ),
        );
      },
      separatorBuilder: (_, __) {
        return const Divider(
          thickness: 2,
          height: 15,
        );
      },
    );
  }
}
