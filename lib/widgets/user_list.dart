import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_user_list/providers.dart';
import '../models/user_model.dart';
import 'list_tile.dart';

class UserList extends ConsumerWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<User>> pageUserListProvider = ref.watch(userListProvider);

    return pageUserListProvider.when(
      data: (userList) {
        return Scaffold(
          appBar: AppBar(
            leading: const Icon(Icons.list),
            title: const Text('Riverpod User List'),
            centerTitle: true,
            backgroundColor: Colors.black38,
          ),
          body: ListView.builder(
            itemCount: userList.length,
            itemBuilder: (context, index) {
              final User user = userList[index];
              return CustomListTile(
                title: user.name,
                subtitle: user.nationality,
                userID: user.id,
              );
            },
          ),
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, stackTrace) => Text('Error $error'),
    );
  }
}