class UKitAction<T> {
  UKitAction({
    required this.child,
    required this.onPressed,
  });

  T child;
  Function onPressed;
}
