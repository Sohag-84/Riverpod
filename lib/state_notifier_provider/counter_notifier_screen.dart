// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/state_notifier_provider/counter_notifier.dart';

final counterNotifierProvider = StateNotifierProvider<CounterNotifierDemo, int>(
  (ref) => CounterNotifierDemo(),
);

class CounterNotifierScreen extends ConsumerWidget {
  const CounterNotifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterNotifierProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterNotifierProvider.notifier).increment();
        },
        child: Center(
          child: Icon(Icons.add),
        ),
      ),
      body: Center(
        child: Text(
          counter.toString(),
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
