// ignore: file_names
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class HexInputFormatter extends TextInputFormatter {
  final RegExp hexRegex = RegExp(r'^[0-9a-fA-F]+$');

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // If the new input matches the regex or is empty, return the new value
    if (newValue.text.isEmpty || hexRegex.hasMatch(newValue.text)) {
      return newValue.copyWith(text: newValue.text.toUpperCase());
    } else {
      // If the new input doesn't match, return the old value
      return oldValue;
    }
  }
}
