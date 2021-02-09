import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  final String word;

  MyDivider({@required this.word});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Container(height: 1, color: Colors.grey)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(word),
        ),
        Expanded(child: Container(height: 1, color: Colors.grey)),
      ],
    );
  }
}
