import 'package:flutter/material.dart';
import 'user_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.list),
        title: const Text('Riverpod User List'),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      body: const UserList(),
    );
  }
}