import 'dart:math';

import 'package:chapter_2/localization/localization.dart';
import 'package:chapter_2/routes/home_page/random_date_generator.dart';
import 'package:chapter_2/routes/next_races_page/circular_progress.dart';
import 'package:chapter_2/routes/utils/breakpoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// This page shows a preview of the next races.
class NextRacesPage extends StatelessWidget with RandomDateGenerator {
  /// Creates a [NextRacesPage] widget.
  const NextRacesPage({Key? key}) : super(key: key);

  void _tileCallback(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(context.l10n.next_races),
          content: const Text('Woohooo!'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.next_races),
          elevation: 5,
        ),
        body: ListView(
          children: [
            // The radial progression bar at the top
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 30,
              ),
              child: LayoutBuilder(
                builder: (context, dimensions) {
                  final square = min<double>(
                    maxCircularProgress,
                    dimensions.maxWidth,
                  );

                  return Center(
                    child: CustomPaint(
                      painter: const CircularProgressPainter(
                        progression: 0.65,
                      ),
                      child: SizedBox(
                        width: square,
                        height: square,
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/svg/trophy.svg',
                            width: square / 1.8,
                            height: square / 1.8,
                            placeholderBuilder: (_) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Some text
            Center(
              child: Text(
                '10 ${context.l10n.done} / 6 ${context.l10n.left}',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Divider(
                height: 80,
                thickness: 2,
              ),
            ),

            // Other dates
            Center(
              child: LayoutBuilder(
                builder: (context, dimensions) {
                  final width = min<double>(
                    maxNextRacesContents,
                    dimensions.maxWidth,
                  );

                  return SizedBox(
                    width: width,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Title
                        Text(
                          context.l10n.upcoming_races,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),

                        const SizedBox(
                          height: 25,
                        ),

                        ListTile(
                          title: const Text('Place number 1'),
                          subtitle: Text(randomDate),
                          leading: const Icon(Icons.public),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.blue,
                            ),
                            onPressed: () => _tileCallback(context),
                          ),
                        ),

                        ListTile(
                          title: const Text('Place number 2'),
                          subtitle: Text(randomDate),
                          leading: const Icon(Icons.public),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.blue,
                            ),
                            onPressed: () => _tileCallback(context),
                          ),
                        ),

                        ListTile(
                          title: const Text('Place number 3'),
                          subtitle: Text(randomDate),
                          leading: const Icon(Icons.public),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.blue,
                            ),
                            onPressed: () => _tileCallback(context),
                          ),
                        ),

                        ListTile(
                          title: const Text('Place number 4'),
                          subtitle: Text(randomDate),
                          leading: const Icon(Icons.public),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.blue,
                            ),
                            onPressed: () => _tileCallback(context),
                          ),
                        ),

                        ListTile(
                          title: const Text('Place number 5'),
                          subtitle: Text(randomDate),
                          leading: const Icon(Icons.public),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.blue,
                            ),
                            onPressed: () => _tileCallback(context),
                          ),
                        ),

                        ListTile(
                          title: const Text('Place number 6'),
                          subtitle: Text(randomDate),
                          leading: const Icon(Icons.public),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.blue,
                            ),
                            onPressed: () => _tileCallback(context),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
