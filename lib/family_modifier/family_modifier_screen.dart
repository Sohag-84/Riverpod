// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///if you want to pass value to any provider
///then you need to used the family modifier
///-->Limitations: you can pass only a single parameter

final nameProvider = Provider.family<String, String>((ref, name) {
  return "Hello $name";
});

class FamilyModifierScreen extends ConsumerStatefulWidget {
  const FamilyModifierScreen({super.key});

  @override
  ConsumerState<FamilyModifierScreen> createState() =>
      _FamilyModifierScreenState();
}

class _FamilyModifierScreenState extends ConsumerState<FamilyModifierScreen> {
  @override
  Widget build(BuildContext context) {
    final name = ref.watch(nameProvider("Bangladesh"));
    return Scaffold(
      appBar: AppBar(
        title: Text("Family Modifier"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          name,
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
