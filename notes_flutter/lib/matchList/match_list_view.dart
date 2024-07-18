import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MatchListView extends StatefulHookConsumerWidget {
  const MatchListView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MatchListViewState();
}

class _MatchListViewState extends ConsumerState<MatchListView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Match List'),
        ),
      ),
    );
  }
}
