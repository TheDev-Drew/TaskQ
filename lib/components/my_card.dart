import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard(
      {super.key,
      required this.text,
      required this.isSelected,
      this.selectedColor,
      this.unselectedColor});

  final String text;
  final bool isSelected;
  final Color? selectedColor;
  final Color? unselectedColor;

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = isSelected
        ? (selectedColor ?? Theme.of(context).colorScheme.primary)
        : (unselectedColor ?? Theme.of(context).colorScheme.surface);
    final Color textColor = isSelected
        ? (selectedColor ?? Theme.of(context).colorScheme.onSurface)
        : (unselectedColor ?? Theme.of(context).colorScheme.tertiary);

    return Padding(
      padding: const EdgeInsets.only(right: 19),
      child: Card(
        elevation: 5,
        child: Container(
          height: 108,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: backgroundColor,
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
