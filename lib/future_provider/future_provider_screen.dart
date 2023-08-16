// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/future_provider/api_services.dart';
import 'package:riverpod_tutorial/future_provider/user_model.dart';

final apiProvider = Provider<ApiServices>(
  (ref) => ApiServices(),
);
final userDataProvider = FutureProvider<List<Data>>((ref) {
  return ref.read(apiProvider).getUser();
});

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("User Data"),
        centerTitle: true,
      ),
      body: userData.when(
          data: (data) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title:
                      Text("${data[index].firstName} ${data[index].firstName}"),
                  subtitle: Text("${data[index].email}"),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        NetworkImage(data[index].avatar.toString()),
                  ),
                );
              },
            );
          },
          error: (error, stackTrace) => Text(error.toString()),
          loading: (() {
            return Center(
              child: CircularProgressIndicator(),
            );
          })),
    );
  }
}
