import 'dart:math';

import 'package:chapter_2/localization/localization.dart';
import 'package:chapter_2/models/data_source.dart';
import 'package:chapter_2/routes/home_page/country_flag.dart';
import 'package:chapter_2/routes/home_page/number_indicator.dart';
import 'package:chapter_2/routes/utils/breakpoints.dart';
import 'package:flutter/material.dart';

/// Shows the current players standings with their position.
class StandingsTab extends StatelessWidget {
  /// Creates a [StandingsTab] widget.
  const StandingsTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: LayoutBuilder(
        builder: (context, dimensions) {
          final width =
              min<double>(maxStretchStandingsCards, dimensions.maxWidth);

          return SizedBox(
            width: width,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: standingsList.length,
                itemBuilder: (context, index) {
                  final item = standingsList[index];

                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text('${context.l10n.points}: ${item.points}'),
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
                    thickness: 1,
                    height: 10,
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
