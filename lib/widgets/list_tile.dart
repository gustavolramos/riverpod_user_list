import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        child: ListTile(
          leading: const Icon(Icons.person),
          title: Text(title),
          subtitle: Text(subtitle),
          hoverColor: Colors.black12,
          onTap: () {},
        ),
      ),
    );
  }
}