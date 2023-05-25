import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_user_list/models/user_model.dart';
import '../providers.dart';

class DetailsPage extends ConsumerWidget {
  const DetailsPage({required this.userId, super.key});

  final String? userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<User>> pageUserListProvider = ref.watch(userListProvider);
    User? getUserById(String? userId) {
      return pageUserListProvider.when(
        data: (userList) {
          return userList.firstWhere((user) => user.id == userId);
        },
        loading: () => null,
        error: (error, stackTrace) => null,
      );
    }

    final User? user = getUserById(userId);

    if (user == null) {
      return const Text('User not found');
    }

    return ListView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.person, size: 50.0)]),
            const SizedBox(height: 20),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text(user.name)]),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 10),
                Text(user.age.toString()),
                Text(user.nationality),
              ],
            ),
            IconButton(
                onPressed: () => context.go('/userlist'),
                icon: const Icon(Icons.arrow_back)),
          ],
        ),
      ],
    );
  }
}