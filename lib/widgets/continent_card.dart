import 'package:flutter/material.dart';

class ContinentCard extends StatelessWidget {

  const ContinentCard({
    super.key,
    required this.name,
    required this.pathToImage,
  });

  final String name;
  final String pathToImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.outline),
          image: DecorationImage(
            image: AssetImage(pathToImage),
            fit: BoxFit.fill, // yes, not the .cover!
          ),
          color: Colors.cyan.shade100,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Center(
          child: Stack(
            children: <Widget>[
              // Stroke
              Text(
                name,
                style: TextStyle(
                  fontSize: 28,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 6
                    ..color = Colors.black,
                ),
              ),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}