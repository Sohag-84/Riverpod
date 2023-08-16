import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_tutorial/family_modifier/familyModifierWithMultipleValueScreen.dart';
import 'package:riverpod_tutorial/state_provider/state_provider.dart';

import 'auto_dispose_modifier/auto_dispose_screen.dart';
import 'home_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //routerConfig: _router,
      home: const FamilyModifierWithMultipleValueScreen(),
    );
  }
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/counter',
      builder: (context, state) => const AutoDisposeScreen(),
    ),
    GoRoute(
      path: '/screen',
      builder: (context, state) => const StateProviderScreen(),
    ),
  ],
);
