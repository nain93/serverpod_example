import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyView extends StatefulHookConsumerWidget {
  const MyView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyViewState();
}

class _MyViewState extends ConsumerState<MyView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('My'),
        ),
      ),
    );
  }
}
