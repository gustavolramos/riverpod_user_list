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

    final User? user = pageUserListProvider.when(
      data: (userList) => userList.firstWhere((user) => user.id == userId),
      loading: () => null,
      error: (error, stackTrace) => null,
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100.0),
        child: ListView(
          children: [
            const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.person, size: 100.0)]),
            Column(
              children: [
                Text(user!.name),
                Text(user.nationality),
              ],
            ),
            const SizedBox(height: 50),
            IconButton(
                onPressed: () => context.go('/userlist'),
                icon: const Icon(Icons.arrow_back)),
          ],
        ),
      ),
    );
  }
}