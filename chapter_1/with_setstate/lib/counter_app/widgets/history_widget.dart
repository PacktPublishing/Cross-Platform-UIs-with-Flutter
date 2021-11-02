import 'package:flutter/material.dart';

/// This widget keeps track of the counter values whenever it is increased.
class HistoryWidget extends StatefulWidget {
  /// The counters history.
  final List<int> increasesHistory;

  /// Creates an [HistoryWidget] from the given [increasesHistory].
  const HistoryWidget({
    Key? key,
    required this.increasesHistory,
  }) : super(key: key);

  @override
  State<HistoryWidget> createState() => _HistoryWidgetState();
}

/// The state of the [HistoryWidget] widget.
class _HistoryWidgetState extends State<HistoryWidget> {
  /// The [ListView] scroll controller.
  final controller = ScrollController();

  /// Manually caching the list.
  late ListView list = buildList();

  /// Building the list.
  ListView buildList() {
    return ListView.separated(
      key: const Key('HistoryWidget-ListView'),
      controller: controller,
      scrollDirection: Axis.horizontal,
      itemCount: widget.increasesHistory.length,
      itemBuilder: (_, index) {
        return Card(
          elevation: 4,
          shadowColor: Colors.blueAccent,
          child: SizedBox(
            width: 40,
            height: 40,
            child: Center(
              child: Text('${widget.increasesHistory[index]}'),
            ),
          ),
        );
      },
      separatorBuilder: (_, __) => const SizedBox(width: 10),
    );
  }

  @override
  void didUpdateWidget(covariant HistoryWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.increasesHistory.length != oldWidget.increasesHistory.length) {
      // Updating the list
      list = buildList();

      // Moving it to the end
      controller.animateTo(
        controller.position.maxScrollExtent + 50 + 10,
        duration: const Duration(milliseconds: 400),
        curve: Curves.ease,
      );
    }
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // The title
        const Text('Increases counter'),

        // The actual list
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 15,
            ),
            child: SizedBox(
              height: 40,
              child: list,
            ),
          ),
        ),
      ],
    );
  }
}