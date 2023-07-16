import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.list),
        title: const Text('This is an error page'),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/'), 
          child: const Text('Return to Home Page')),
      ),
    );
  }
}