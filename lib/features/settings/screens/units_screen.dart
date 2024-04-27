import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UnitsScreen extends StatefulWidget {
  const UnitsScreen({super.key, required this.text});

  final String text;

  @override
  State<UnitsScreen> createState() => _UnitsScreenState();
}

class _UnitsScreenState extends State<UnitsScreen> {

  late String unit;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final parameter = GoRouterState.of(context).pathParameters['unit'];
    unit = parameter ?? 'null';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.text)),
      body: Center(
        child: Text(
          '${widget.text} --- $unit',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
      ),
    );
  }
}