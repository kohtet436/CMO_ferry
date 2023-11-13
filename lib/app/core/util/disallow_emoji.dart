import 'package:flutter/services.dart';

class EmojiInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove any emoji characters from the new value
    final filteredValue = String.fromCharCodes(newValue.text.runes
        .where((rune) => !isEmojiCharacter(rune))
        .toList());

    return newValue.copyWith(
      text: filteredValue,
      composing: TextRange.empty,
    );
  }

  bool isEmojiCharacter(int rune) {
    // Check if the rune represents an emoji character
    return (rune >= 0x1F600 && rune <= 0x1F64F) ||
        (rune >= 0x1F300 && rune <= 0x1F5FF) ||
        (rune >= 0x1F680 && rune <= 0x1F6FF) ||
        (rune >= 0x2600 && rune <= 0x26FF) ||
        (rune >= 0x2700 && rune <= 0x27BF) ||
        (rune >= 0xFE00 && rune <= 0xFE0F) ||
        (rune >= 0x1F900 && rune <= 0x1F9FF) ||
        (rune >= 0x1F1E6 && rune <= 0x1F1FF);
  }
}