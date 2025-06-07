import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  final String? textHint;
  final int? maxLength;
  final TextEditingController controller;
  final Color? outsideColor;
  TextfieldWidget({
    required this.controller,
    this.maxLength = 10,
    this.outsideColor = Colors.grey,
    this.textHint = 'Please enter value',
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: maxLength,
      decoration: new InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.greenAccent, width: 5.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 5.0),
        ),
        hintText: textHint,
      ),
    );
  }
}
