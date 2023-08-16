// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider<int>((ref) => 0);

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  ///state provider is used to store simple mutable object
  ///means which object can change
  ///but it can't used to store complex object.
  ///simple object means--> string,enum,boolean,number etc

  increaseValue(WidgetRef ref) {
    ref.read(counterProvider.notifier).state++;
  }

  decreaseValue(WidgetRef ref) {
    ref.read(counterProvider.notifier).update((state) => state - 1);
  }

  resetValue(WidgetRef ref) {
    //1--> ref.invalidate(counterProvider);
    ref.refresh(counterProvider);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);

    ref.listen(counterProvider, (previous, next) {
      print("=== === Previous: $previous === ===");
      print("=== === Next: $next === ===");
      if (next.isEven) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Value is: $next"),
          ),
        );
      }
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              counter.toString(),
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => resetValue(ref),
              child: Text("Reset Value"),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () => increaseValue(ref),
            child: const Icon(Icons.add),
          ),
          SizedBox(width: 50),
          FloatingActionButton(
            onPressed: () => decreaseValue(ref),
            child: const Icon(Icons.minimize),
          ),
        ],
      ),
    );
  }
}
