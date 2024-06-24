//**----------------------------------------------------------------------------correct or incorrect
enum IntervalEnum { min, hr, day, month, year }

extension IntervalEnumToString on IntervalEnum {
  String toShortString() => toString().split('.').last;
}

////**************************to captilize
extension StringExtension on String {
  String capitalize() =>
      "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
}
