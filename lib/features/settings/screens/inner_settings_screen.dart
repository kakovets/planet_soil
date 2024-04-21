import 'package:flutter/material.dart';

class InnerSettingsScreen extends StatelessWidget {
  const InnerSettingsScreen({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(text)),
      body: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
      ),
    );
  }
}