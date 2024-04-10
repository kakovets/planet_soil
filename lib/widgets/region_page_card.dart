import 'package:flutter/material.dart';

class RegionCard extends StatelessWidget {

  const RegionCard({
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
        padding: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.outline,
          ),
          image: pathToImage.isNotEmpty
              ?
          DecorationImage(
            image: AssetImage(pathToImage),
            fit: BoxFit.fill, // yes, not the .cover!
          )
              :
          null,
          color: Colors.cyan.shade100,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Center(
          child: Stack(
            children: <Widget>[
              // Stroke
              Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 6
                    ..color = Colors.black,
                ),
              ),
              Text(
                name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
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