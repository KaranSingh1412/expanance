/// the little tag chip which is shown on the transaction_card
///
import 'package:flutter/material.dart';

class TagChip extends StatelessWidget {
  const TagChip({Key? key, required this.label}) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        color: Theme.of(context).colorScheme.surface,
        elevation: 8,
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 3.0,
            horizontal: 10,
          ),
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
