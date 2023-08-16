import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterNotifierDemo extends StateNotifier<int> {
  CounterNotifierDemo() : super(0);

  increment(){
    state++;
  }
}
