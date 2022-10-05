import 'package:flutter/material.dart';

const TextStyle style = TextStyle(
  fontSize: 16,
  color: Colors.white,
);

class PrimaryButton extends StatelessWidget {
  final String title;
  final Color? color;
  final VoidCallback onPressed;

  PrimaryButton({
    Key? key,
    required this.title,
    this.color = Colors.cyan,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        margin: const EdgeInsets.all(5),
        constraints: const BoxConstraints(
          minWidth: double.infinity,
          minHeight: 45,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color,
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Text(title, style: style),
        ),
      ),
    );
  }
}
