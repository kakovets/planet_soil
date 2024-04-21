import 'package:flutter/material.dart';

class InkTile extends StatelessWidget {
  const InkTile({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.func,
  });

  final String title;
  final String subTitle;
  final IconData icon;
  final Function func;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
        child: Row(
          children: [
            const SizedBox(width: 16,),
            Icon(icon),
            const SizedBox(width: 16,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
                const SizedBox(height: 4,),
                Row(
                  children: [
                    Text(
                      subTitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      onTap: () {
        func.call();
      },
    );
  }
}