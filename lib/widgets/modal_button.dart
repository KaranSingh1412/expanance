import 'package:flutter/material.dart';

class ModalButton extends StatelessWidget {
  const ModalButton(
      {Key? key, required this.label, required this.buttonPressed})
      : super(key: key);

  final String label;
  final void Function() buttonPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      color: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        margin: const EdgeInsets.all(4),
        child: TextButton(
          onPressed: buttonPressed,
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}
