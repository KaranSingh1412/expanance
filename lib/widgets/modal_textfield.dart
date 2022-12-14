import 'package:flutter/material.dart';

class ModalTextField extends StatefulWidget {
  const ModalTextField({
    Key? key,
    required this.label,
    required this.controller,
    required this.submitter,
    required this.icon,
    this.inputType = TextInputType.text,
  }) : super(key: key);
  final String label;
  final TextEditingController controller;
  final Function submitter;
  final IconData icon;
  final TextInputType inputType;

  @override
  State<ModalTextField> createState() => _ModalTextFieldState();
}

class _ModalTextFieldState extends State<ModalTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 8.0,
        left: 8.0,
        bottom: 8.0,
        top: 10,
      ),
      child: Card(
        elevation: 10.0,
        color: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          margin: const EdgeInsets.all(8),
          child: TextFormField(
            keyboardType: widget.inputType,
            cursorColor: Colors.grey,
            style: Theme.of(context).textTheme.bodyMedium,
            controller: widget.controller,
            onFieldSubmitted: (_) => widget.submitter,
            decoration: InputDecoration(
              fillColor: Theme.of(context).colorScheme.background,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              counterText: '',
              hintText: widget.label,
              hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.grey.shade800,
                  ),
              icon: Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  top: 10.0,
                  bottom: 10.0,
                ),
                child: Icon(
                  widget.icon,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
