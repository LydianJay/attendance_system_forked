// ignore: file_names
import 'package:flutter/services.dart';

class DayInputFormatter extends TextInputFormatter {
  final RegExp hexRegex = RegExp(r'^[a-zA-Z]');

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (hexRegex.hasMatch(newValue.text)) {
      return oldValue;
    } else {
      if (newValue.text.isEmpty) {
        return newValue;
      }
      if (int.tryParse(newValue.text) == null) {
        return oldValue;
      }
      if (int.parse(newValue.text) > 31) {
        return oldValue;
      }

      return newValue;
    }
  }
}
