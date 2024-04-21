import 'package:flutter/material.dart';

class TextFormScreen extends StatefulWidget {
  const TextFormScreen({super.key, required this.text});

  final String text;

  @override
  State<TextFormScreen> createState() => _TextFormScreenState();
}

class _TextFormScreenState extends State<TextFormScreen> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.text),
            const SizedBox(height: 16,),
            TextFormField(
              cursorColor: Colors.cyan,
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.grey.withOpacity(0.7)),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                hintText: 'Your MSG',
                fillColor: Colors.grey.withOpacity(.2),
                filled: true,
              ),
              style: const TextStyle(
                color: Colors.deepOrangeAccent,
              ),
              controller: controller,
            ),
            const SizedBox(height: 16,),
            FilledButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  Navigator.of(context).pop([controller.text]);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Fill the form',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
              child: const Text('Pop'),
            ),
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}