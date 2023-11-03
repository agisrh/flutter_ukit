class UKitRadioBuilder<T> {
  final String description;
  final UKitRadioTextPosition? textPosition;

  UKitRadioBuilder(
    this.description, {
    this.textPosition,
  });
}

// POSITION
enum UKitRadioTextPosition { right, left }
