import 'package:flutter_test/flutter_test.dart';
import 'package:mood_me_now/utils/validators.dart';

void main() {
  group('Validators', () {
    test('isStressValid returns true for valid range', () {
      expect(Validators.isStressValid(5), true);
      expect(Validators.isStressValid(0), false);
      expect(Validators.isStressValid(11), false);
    });

    test('isNonEmptyString returns false for empty string', () {
      expect(Validators.isNonEmptyString(''), false);
      expect(Validators.isNonEmptyString('abc'), true);
    });
  });
}
