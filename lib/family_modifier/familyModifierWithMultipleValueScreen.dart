// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/family_modifier/user.dart';

final nameProvider = Provider.family<String, User>((ref, user) {
  return "Name: ${user.name} and Address: ${user.address}";
});

class FamilyModifierWithMultipleValueScreen extends ConsumerWidget {
  const FamilyModifierWithMultipleValueScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider(User("Yakub", "Comilla")));
    return Scaffold(
      appBar: AppBar(
        title: Text("Family Modifier 2"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          name,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
