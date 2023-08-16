// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/state_notifier_provider/counter_notifier.dart';

///autoDispose -->auto reset the value when go another screen
///keepAlive --> used to preserve the value although we use autoDispose
///we can also implement timeout-based caching strategy ot dispose
///the provider's state after a given duration
final counterProvider =
    StateNotifierProvider.autoDispose<CounterNotifierDemo, int>((ref) {
  //ref.keepAlive();
  ///value reset after given duration
  final link = ref.keepAlive();
  final timer = Timer(Duration(seconds: 10), () {
    link.close();
  });
  ref.onDispose(() => timer.cancel());
  return CounterNotifierDemo();
});

class AutoDisposeScreen extends ConsumerWidget {
  const AutoDisposeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Auto dispose text"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).increment();
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Text(counter.toString(), style: TextStyle(fontSize: 30)),
      ),
    );
  }
}
