extension IntExtension on int {
  String prefixZeroForSingleDigit() {
    if (this >= 0 && this < 10) {
      return "0$this";
    } else {
      return toString();
    }
  }
}
