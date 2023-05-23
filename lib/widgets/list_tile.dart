import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomListTile extends ConsumerWidget {
  const CustomListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.userID,
  });

  final String title;
  final String subtitle;
  final String userID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        child: ListTile(
          leading: const Icon(Icons.person),
          title: Text(title),
          trailing: Text(userID),
          subtitle: Text(subtitle),
          hoverColor: Colors.black12,
          onTap: () => context.go('/userlist/$userID'),
        ),
      ),
    );
  }
}