import 'package:chapter_1/counter_app/widgets/counter_inherited_widget.dart';
import 'package:flutter/material.dart';

/// This widget keeps track of the counter values whenever it is increased.
class HistoryWidget extends StatefulWidget {
  /// Creates an [HistoryWidget] widget.
  const HistoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<HistoryWidget> createState() => _HistoryWidgetState();
}

/// The state of the [HistoryWidget] widget.
class _HistoryWidgetState extends State<HistoryWidget> {
  /// The [ListView] scroll controller.
  final controller = ScrollController();

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final counterState = CounterState.of(context).model;

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
              child: AnimatedBuilder(
                animation: counterState,
                builder: (context, _) {
                  if (counterState.history.isNotEmpty) {
                    // Moving the scroll controller to the end
                    controller.animateTo(
                      controller.position.maxScrollExtent + 50 + 10,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  }

                  return ListView.separated(
                    key: const Key('HistoryWidget-ListView'),
                    controller: controller,
                    scrollDirection: Axis.horizontal,
                    itemCount: counterState.history.length,
                    itemBuilder: (_, index) {
                      return Card(
                        elevation: 4,
                        shadowColor: Colors.blueAccent,
                        child: SizedBox(
                          width: 40,
                          height: 40,
                          child: Center(
                            child: Text('${counterState.history[index]}'),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (_, __) => const SizedBox(width: 10),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
