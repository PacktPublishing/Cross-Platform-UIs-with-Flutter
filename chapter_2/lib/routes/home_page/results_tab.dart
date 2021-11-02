import 'dart:math';

import 'package:chapter_2/localization/localization.dart';
import 'package:chapter_2/models/data_source.dart';
import 'package:chapter_2/models/results_entry.dart';
import 'package:chapter_2/routes/home_page/drivers_list.dart';
import 'package:chapter_2/routes/home_page/number_indicator.dart';
import 'package:chapter_2/routes/home_page/random_date_generator.dart';
import 'package:chapter_2/routes/utils/breakpoints.dart';
import 'package:chapter_2/routes/utils/collapsible/collapsible.dart';
import 'package:chapter_2/routes/utils/collapsible/collapsible_state.dart';
import 'package:flutter/material.dart';

/// This page shows the races results in various countries around the world.
class ResultsTab extends StatelessWidget {
  /// Creates a [ResultsTab] widget.
  const ResultsTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, dimensions) {
        // Small devices
        if (dimensions.maxWidth <= mobileResultsBreakpoint) {
          return ListView.builder(
            itemCount: resultsList.length,
            itemBuilder: (context, index) => _CompactResultCard(
              results: resultsList[index],
            ),
          );
        }

        // Larger devices
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          child: ListView.builder(
            itemCount: resultsList.length,
            itemBuilder: (context, index) => _ExpandedResultCard(
              results: resultsList[index],
            ),
          ),
        );
      },
    );
  }
}

/// Shows race results in a compact way, without much details.
class _CompactResultCard extends StatelessWidget with RandomDateGenerator {
  /// The data.
  final List<ResultsEntry> results;

  /// Creates a [_CompactResultCard] widget.
  const _CompactResultCard({
    required this.results,
  });

  @override
  Widget build(BuildContext context) {
    return CollapsibleState(
      state: ValueNotifier<bool>(false),
      child: LayoutBuilder(
        builder: (context, dimensions) {
          final width =
              min<double>(mobileResultsBreakpoint, dimensions.maxWidth);

          return SizedBox(
            width: width,
            child: Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 15,
              ),
              child: Collapsible(
                edgeInsets: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                header: ListTile(
                  title: Text(results.first.circuitName),
                  subtitle: Text(randomDate),
                  trailing: NumberIndicator(
                    number: results.length,
                  ),
                ),
                content: DriversList(
                  results: results,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// Shows race results in a detailed way.
class _ExpandedResultCard extends StatelessWidget with RandomDateGenerator {
  /// The data.
  final List<ResultsEntry> results;

  /// Creates a [_ExpandedResultCard] widget.
  const _ExpandedResultCard({
    required this.results,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, dimensions) {
        var width = max<double>(
          mobileResultsBreakpoint,
          dimensions.maxWidth,
        );

        if (width >= maxStretchResultCards) {
          width = maxStretchResultCards;
        }

        final leftFlex = width < (maxStretchResultCards - 50) ? 2 : 3;

        return Center(
          child: SizedBox(
            width: width - 50,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 20,
              ),
              child: Card(
                elevation: 5,
                child: Row(
                  children: [
                    // Race details
                    Expanded(
                      flex: leftFlex,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(results.first.circuitName),
                          Text(
                            context.l10n.circuit_name,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            '${results.first.name} ${results.first.surname}',
                          ),
                          Text(
                            context.l10n.winner,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Drivers
                    Expanded(
                      flex: 3,
                      child: DriversList(
                        results: results,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
