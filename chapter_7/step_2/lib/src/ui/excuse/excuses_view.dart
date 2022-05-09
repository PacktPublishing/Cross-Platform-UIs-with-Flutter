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

class _ExcusesViewContentState extends State<_ExcusesViewContent>
    with TickerProviderStateMixin {
  int currentPage = 0;

  late Animation<double> _loadingAnimation;
  late AnimationController _loadingAnimationController;
  late Animation<double> _excusesAnimation;
  late AnimationController _excusesAnimationController;

  @override
  void initState() {
    _loadingAnimationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    _loadingAnimation =
        Tween<double>(begin: 1, end: 0).animate(_loadingAnimationController);
    _excusesAnimationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    _excusesAnimation =
        Tween<double>(begin: 0, end: 1).animate(_excusesAnimationController);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant _ExcusesViewContent oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.excuses != null) {
      _loadingAnimationController
          .forward()
          .then((value) => _excusesAnimationController.forward());
    } else {
      _excusesAnimationController
          .reverse()
          .then((value) => _loadingAnimationController.reverse());
    }
  }

  @override
  void dispose() {
    _loadingAnimationController.dispose();
    _excusesAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final enableNextButton = widget.excuses != null;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              AnimatedBuilder(
                animation: _loadingAnimation,
                builder: (context, child) {
                  return Opacity(
                    opacity: _loadingAnimation.value,
                    child: child,
                  );
                },
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              if (widget.excuses != null)
                AnimatedBuilder(
                  animation: _excusesAnimation,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _excusesAnimation.value,
                      child: child,
                    );
                  },
                  child: ExcusePageView(
                    excuses: widget.excuses!,
                    currentExcuse: currentPage,
                  ),
                )
            ],
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
