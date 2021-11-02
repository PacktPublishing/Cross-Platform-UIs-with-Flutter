import 'package:chapter_2/models/results_entry.dart';
import 'package:chapter_2/models/standings_entry.dart';

/// Fake data source for the standings list
const standingsList = [
  StandingsEntry(
    name: 'Test 2',
    countryCode: 'it',
    points: 56,
  ),
  StandingsEntry(
    name: 'Test 5',
    countryCode: 'us',
    points: 55,
  ),
  StandingsEntry(
    name: 'Test 1',
    countryCode: 'de',
    points: 48,
  ),
  StandingsEntry(
    name: 'Test 3',
    countryCode: 'ch',
    points: 32,
  ),
  StandingsEntry(
    name: 'Test 6',
    countryCode: 'es',
    points: 26,
  ),
  StandingsEntry(
    name: 'Test 4',
    countryCode: 'fi',
    points: 18,
  ),
];

/// Fake data source for the results list
const resultsList = [
  [
    ResultsEntry(
      name: 'Player 3',
      surname: 'Test 3',
      countryCode: 'it',
      position: 1,
      circuitName: 'Some name 1',
    ),
    ResultsEntry(
      name: 'Player 1',
      surname: 'Test 1',
      countryCode: 'de',
      position: 2,
      circuitName: 'Some name 1',
    ),
    ResultsEntry(
      name: 'Player 4',
      surname: 'Test 4',
      countryCode: 'us',
      position: 3,
      circuitName: 'Some name 1',
    ),
    ResultsEntry(
      name: 'Player 2',
      surname: 'Test 2',
      countryCode: 'fr',
      position: 4,
      circuitName: 'Some name 1',
    ),
  ],
  [
    ResultsEntry(
      name: 'Player 1',
      surname: 'Test 1',
      countryCode: 'fi',
      position: 1,
      circuitName: 'Some name 2',
    ),
    ResultsEntry(
      name: 'Player 5',
      surname: 'Test 5',
      countryCode: 'ch',
      position: 2,
      circuitName: 'Some name 2',
    ),
    ResultsEntry(
      name: 'Player 2',
      surname: 'Test 2',
      countryCode: 'it',
      position: 3,
      circuitName: 'Some name 2',
    ),
    ResultsEntry(
      name: 'Player 3',
      surname: 'Test 3',
      countryCode: 'mx',
      position: 4,
      circuitName: 'Some name 2',
    ),
    ResultsEntry(
      name: 'Player 6',
      surname: 'Test 6',
      countryCode: 'br',
      position: 5,
      circuitName: 'Some name 2',
    ),
  ],
  [
    ResultsEntry(
      name: 'Player 6',
      surname: 'Test 1',
      countryCode: 'no',
      position: 1,
      circuitName: 'Some name 3',
    ),
    ResultsEntry(
      name: 'Player 4',
      surname: 'Test 1',
      countryCode: 'pt',
      position: 2,
      circuitName: 'Some name 3',
    ),
    ResultsEntry(
      name: 'Player 1',
      surname: 'Test 1',
      countryCode: 'it',
      position: 3,
      circuitName: 'Some name 3',
    ),
    ResultsEntry(
      name: 'Player 5',
      surname: 'Test 1',
      countryCode: 'ru',
      position: 4,
      circuitName: 'Some name 3',
    ),
    ResultsEntry(
      name: 'Player 2',
      surname: 'Test 1',
      countryCode: 'us',
      position: 5,
      circuitName: 'Some name 3',
    ),
  ],
  [
    ResultsEntry(
      name: 'Player 2',
      surname: 'Test 2',
      countryCode: 'ca',
      position: 1,
      circuitName: 'Some name 4',
    ),
    ResultsEntry(
      name: 'Player 4',
      surname: 'Test 4',
      countryCode: 'jp',
      position: 2,
      circuitName: 'Some name 4',
    ),
    ResultsEntry(
      name: 'Player 3',
      surname: 'Test 3',
      countryCode: 'nl',
      position: 3,
      circuitName: 'Some name 4',
    ),
  ],
];
