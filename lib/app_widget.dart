import 'package:flutter/material.dart';

class AppFilledButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final FocusNode? focusNode;

  const AppFilledButton({super.key, this.onPressed, this.focusNode, required this.title});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll<Color>(Theme.of(context).colorScheme.primary),
        shape: WidgetStatePropertyAll<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
        minimumSize: const WidgetStatePropertyAll<Size>(Size(double.infinity, 48)),
      ),
      child: Text(title),
    );
  }
}

class AppFilledButtonSmall extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final FocusNode? focusNode;

  const AppFilledButtonSmall({super.key, this.onPressed, this.focusNode, required this.title});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll<Color>(Theme.of(context).colorScheme.primary),
        shape: WidgetStatePropertyAll<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
        // minimumSize: const WidgetStatePropertyAll<Size>(),
      ),
      child: Text(title),
    );
  }
}

class MyChoiceChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Function(bool) onSelected;

  const MyChoiceChip({
    required this.label,
    required this.isSelected,
    required this.onSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return ChoiceChip(
      label: Text(label, style: const TextStyle(fontSize: 10)),
      selected: isSelected,
      onSelected: onSelected,
      backgroundColor: Colors.transparent,
      selectedColor: colorScheme.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      labelStyle: TextStyle(color: isSelected ? Colors.white : colorScheme.primary),
      side: BorderSide(
        color: isSelected ? Colors.transparent : colorScheme.outlineVariant,
        width: 1.5,
      ),
    );
  }
}
