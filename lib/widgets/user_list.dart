import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_user_list/providers.dart';
import '../models/user_model.dart';
import 'list_tile.dart';

class UserList extends ConsumerWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<User>> userListProvider = ref.watch(userProvider); 

    return userListProvider.when(
      data: (userList) {
        return ListView.builder(
          itemCount: userList.length,
          itemBuilder: (context, index) {
            final User user = userList[index];
            return CustomListTile(
              title: user.name,
              subtitle: user.nationality,
            );
          },
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, stackTrace) => Text('Error $error'),
    );
  }
}