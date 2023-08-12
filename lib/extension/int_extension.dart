///Extension over int
extension IntExtension on int {
  /// prefixes a zero above an integer in the range of 0-9
  /// and returns as a String
  String prefixZeroForSingleDigit() {
    if (this >= 0 && this < 10) {
      return "0$this";
    } else {
      // Since the value is 2 digit so the value is returned as it is
      return toString();
    }
  }
}
