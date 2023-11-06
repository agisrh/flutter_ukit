class UKitRadioBuilder<T> {
  final String description;
  final UKitRadioTextPosition? textPosition;
  final bool? spaceBetween;

  UKitRadioBuilder(
    this.description, {
    this.textPosition,
    this.spaceBetween,
  });
}

// POSITION
enum UKitRadioTextPosition { right, left }
