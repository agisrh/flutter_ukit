import 'dart:ui';
import '../flutter_ukit_utils.dart';
import 'ukit_builder.dart';

class UKitTextFieldBuilder extends UKitBuilder {
  ///
  /// Set the input's border radius
  final double? borderRadius;

  ///
  /// Set the input's border type [UIBorderType]
  final UKitBorderType? borderType;

  ///
  /// Set the input's border color
  final Color? borderColor;

  ///
  /// Set the input's FOCUS border color
  final Color? focusBorderColor;

  ///
  /// Set the input's ERROR border color
  final Color? errorBorderColor;

  ///
  /// Set the input's border width
  final double? borderWidth;

  ///
  /// Set the input's hint color
  final Color? hintColor;

  ///
  /// Set the input's inner padding
  final double? padding;

  ///
  /// Set the input's background color
  final Color? bgColor;

  ///
  /// Set the input's label color
  final Color? labelColor;

  UKitTextFieldBuilder({
    this.borderRadius,
    this.borderType,
    this.borderColor,
    this.focusBorderColor,
    this.errorBorderColor,
    this.borderWidth,
    this.hintColor,
    this.padding,
    this.bgColor,
    this.labelColor,
  });
}
