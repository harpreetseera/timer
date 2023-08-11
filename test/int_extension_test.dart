import 'package:test/test.dart';
import 'package:ipotato_timer/extension/int_extension.dart';

void main() {
  group('IntExtension', () {
    test("zero should be prefixed", () {
      const duration = 0;
      final valueAfterPrefix = duration.prefixZeroForSingleDigit();
      expect(valueAfterPrefix, "00");
    });

    test("zero should be prefixed edge case - 9", () {
      const duration = 9;
      final valueAfterPrefix = duration.prefixZeroForSingleDigit();
      expect(valueAfterPrefix, "09");
    });
    test("zero should not be prefixed", () {
      const duration = 10;
      final valueAfterPrefix = duration.prefixZeroForSingleDigit();
      expect(valueAfterPrefix, "10");
    });
    test("zero should not be added for value less than 0", () {
      const duration = -1;
      final valueAfterPrefix = duration.prefixZeroForSingleDigit();
      expect(valueAfterPrefix, "-1");
    });
  });
}