/// the button in the add_transaction_sheet for adding tags to a transaction
///
import 'package:flutter/material.dart';

class TagCircle extends StatefulWidget {
  const TagCircle({Key? key, required this.label, required this.tagList})
      : super(key: key);

  final String label;
  final List<String> tagList;

  @override
  State<TagCircle> createState() => _TagCircleState();
}

class _TagCircleState extends State<TagCircle> {
  Color backgroundColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextButton(
        onPressed: () {
          if (widget.tagList.contains(widget.label)) {
            setState(() {
              widget.tagList.remove(widget.label);
              backgroundColor = Colors.transparent;
            });
          } else {
            setState(() {
              widget.tagList.add(widget.label);
              backgroundColor = Theme.of(context).colorScheme.surface;
            });
          }
        },
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
          backgroundColor: MaterialStateProperty.all<Color>(
            widget.tagList.contains(widget.label)
                ? Theme.of(context).colorScheme.surface
                : backgroundColor,
          ),
        ),
        child: Text(
          widget.label,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
