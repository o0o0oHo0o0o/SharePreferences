import 'package:flutter/material.dart';

class MyTitle extends StatelessWidget {
  final IconData icon;
  final String text;

  const MyTitle({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Icon(icon, size: 100),
      const SizedBox(height: 16),
      Text(
        text,
        style: TextStyle(fontSize: 42, fontWeight: FontWeight.w400),
        textAlign: TextAlign.center,
      ),
    ],
  );
}