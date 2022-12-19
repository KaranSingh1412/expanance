import 'package:flutter/material.dart';

class TransactionTypeButton extends StatefulWidget {
  const TransactionTypeButton(
      {Key? key,
      required this.buttonPressed,
      required this.backgroundColor,
      required this.label})
      : super(key: key);

  final void Function() buttonPressed;
  final Color backgroundColor;
  final String label;

  @override
  State<TransactionTypeButton> createState() => _TransactionTypeButtonState();
}

class _TransactionTypeButtonState extends State<TransactionTypeButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextButton(
        onPressed: widget.buttonPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
              side: BorderSide(
                color: Theme.of(context).colorScheme.surface,
                width: 3,
              ),
            ),
          ),
          backgroundColor:
              MaterialStateProperty.all<Color>(widget.backgroundColor),
        ),
        child: Text(
          widget.label,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
