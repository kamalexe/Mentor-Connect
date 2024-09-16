import 'package:flutter/material.dart';

class AppFilledButton<T> extends StatelessWidget {
  final T title;
  final VoidCallback? onPressed;
  final FocusNode? focusNode;
  final Color? bgColor;
  final Color? titleColor;
  final double? borderRadius;

  const AppFilledButton({
    super.key,
    required this.title,
    this.onPressed,
    this.focusNode,
    this.bgColor,
    this.titleColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      focusNode: focusNode,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll<Color?>(bgColor),
        shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 5.0),
          ),
        ),
        minimumSize: const WidgetStatePropertyAll<Size>(Size(double.infinity, 48)),
      ),
      child: _buildChild(context),
    );
  }

  Widget _buildChild(BuildContext context) {
    if (title is String) {
      return Text(
        title as String,
        style: TextStyle(color: titleColor ?? Theme.of(context).colorScheme.onPrimary),
      );
    } else if (title is Widget) {
      return title as Widget;
    } else {
      throw ArgumentError('Title must be either a String or a Widget');
    }
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
      padding: const EdgeInsets.symmetric(horizontal: 10),
      label: Text(label, style: const TextStyle(fontSize: 10)),
      selected: isSelected,
      showCheckmark: false,
      onSelected: onSelected,
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      selectedShadowColor: Colors.transparent,
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
