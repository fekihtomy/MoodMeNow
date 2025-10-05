class Validators {
  static bool isStressValid(int value) => value >= 1 && value <= 10;
  static bool isEnergyValid(int value) => value >= 1 && value <= 10;
  static bool isNonEmptyString(String value) => value.trim().isNotEmpty;
}
