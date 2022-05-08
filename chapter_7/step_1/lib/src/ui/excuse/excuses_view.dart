import 'dart:math';

import 'package:excuses_app/src/data/data.dart';
import 'package:excuses_app/src/data/excuse_facade.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/excuse_page_view.dart';

class ExcusesView extends StatefulWidget {
  const ExcusesView({Key? key}) : super(key: key);

  static const routeName = '/excuses';

  @override
  State<ExcusesView> createState() => _ExcusesViewState();
}

class _ExcusesViewState extends State<ExcusesView> {
  @override
  Widget build(BuildContext context) {
    return FutureProvider<List<Excuse>?>.value(
      value: context.read<ExcuseFacade>().fetchExcuses(),
      initialData: null,
      child: Consumer<List<Excuse>?>(builder: (context, excuses, _) {
        return _ExcusesViewContent(excuses: excuses);
      }),
    );
  }
}

class _ExcusesViewContent extends StatefulWidget {
  const _ExcusesViewContent({
    Key? key,
    this.excuses,
  }) : super(key: key);

  final List<Excuse>? excuses;

  @override
  State<_ExcusesViewContent> createState() => _ExcusesViewContentState();
}

class _ExcusesViewContentState extends State<_ExcusesViewContent> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final enableNextButton = widget.excuses != null;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: widget.excuses == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ExcusePageView(
                  excuses: widget.excuses!,
                  currentExcuse: currentPage,
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward),
        onPressed: enableNextButton
            ? () {
                setState(() {
                  currentPage = Random().nextInt(widget.excuses!.length);
                });
              }
            : null,
      ),
    );
  }
}
