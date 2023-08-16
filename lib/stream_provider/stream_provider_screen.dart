// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider = StreamProvider<int>((ref) {
  return Stream.periodic(
    const Duration(seconds: 2),
    ((computationCount) => computationCount),
  );
});

class StreamProviderScreen extends ConsumerWidget {
  const StreamProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamData = ref.watch(streamProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream Provider"),
        centerTitle: true,
      ),
      body: streamData.when(
        data: (data) {
          return Center(
            child: Text(
              data.toString(),
              style: TextStyle(fontSize: 30),
            ),
          );
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: (() {
          return Center(
            child: CircularProgressIndicator(),
          );
        }),
      ),
    );
  }
}
