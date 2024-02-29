import 'package:flutter/material.dart';
import 'package:flutter_ukit/flutter_ukit.dart';

/// Solid Button Styles
final solidButtonStyles = UKitButtonBuilder(
  elevation: 15.0,
  borderRadius: 50.0,
  labelColor: Colors.white,
  bgColor: Colors.pink,
);

/// Outlined Button Styles
final outlinedButtonStyles = UKitButtonBuilder(
  borderRadius: 50.0,
  labelColor: Colors.pink,
  bgColor: Colors.white,
  borderColor: Colors.pink,
  borderWidth: 2.0,
);

/// Soft Button Styles
final softButtonStyles = UKitButtonBuilder(
  elevation: 15.0,
  borderRadius: 50.0,
  labelColor: Colors.white,
  bgColor: Colors.pink,
);

/// Disable Button Styles
final disableButtonStyles = UKitButtonBuilder(
  elevation: 15.0,
  borderRadius: 50.0,
  labelColor: Colors.white70,
  bgColor: Colors.grey.shade400,
);

/// Solid Button Icon Left
final solidButtonIconLeft = UKitButtonBuilder(
  borderRadius: 50.0,
  labelColor: Colors.white,
  bgColor: Colors.pink,
  iconPlace: IconPlace.left,
);

/// Solid Button Icon Right
final solidButtonIconRight = UKitButtonBuilder(
  borderRadius: 50.0,
  labelColor: Colors.white,
  bgColor: Colors.pink,
  iconPlace: IconPlace.right,
);

/// Solid Button Icon Center Right
final solidButtonIconCenterRight = UKitButtonBuilder(
  borderRadius: 50.0,
  labelColor: Colors.white,
  bgColor: Colors.pink,
  iconPlace: IconPlace.centerRight,
);

/// Solid Button Icon Center Left
final solidButtonIconCenterLeft = UKitButtonBuilder(
  borderRadius: 50.0,
  labelColor: Colors.white,
  bgColor: Colors.pink,
  iconPlace: IconPlace.centerLeft,
);

/// Solid Button Icon
final solidButtonIcon = UKitButtonBuilder(
  borderRadius: 8.0,
  bgColor: Colors.pink,
  widthFactor: 0.15,
);

/// Outlined Button Icon
final outlinedButtonIcon = UKitButtonBuilder(
  borderRadius: 8.0,
  labelColor: Colors.pink,
  bgColor: Colors.white,
  borderColor: Colors.pink,
  borderWidth: 2.0,
  widthFactor: 0.15,
);

/// Success Container
final successContainer = UKitContainerBuilder(
  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
  borderRadius: 10,
  widthFactor: 1.0,
  borderColor: Colors.green,
  borderWidth: 1,
  color: Colors.green.shade100,
);

/// Info Container
final infoContainer = UKitContainerBuilder(
  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
  borderRadius: 10,
  widthFactor: 1.0,
  borderColor: Colors.blue,
  borderWidth: 1,
  color: Colors.blue.shade100,
);

/// Warning Container
final warningContainer = UKitContainerBuilder(
  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
  borderRadius: 10,
  widthFactor: 1.0,
  borderColor: Colors.orange,
  borderWidth: 1,
  color: Colors.orange.shade100,
);

/// Error Container
final errorContainer = UKitContainerBuilder(
  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
  alignment: CrossAxisAlignment.start,
  borderRadius: 10,
  widthFactor: 1.0, // make full width
  borderColor: Colors.red,
  borderWidth: 1,
  color: Colors.red.shade100,
);

final shimmerAnimation = UKitShimmerBuilder(
  linearGradient: const LinearGradient(
    colors: [
      Color(0xFFEBEBF4),
      Color(0xFFF4F4F4),
      Color(0xFFEBEBF4),
    ],
    stops: [
      0.1,
      0.3,
      0.4,
    ],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
    tileMode: TileMode.clamp,
  ),
);

///
/// Set Primary Input Styles
///
final primaryInput = UKitTextFieldBuilder(
  borderColor: Colors.black45,
  borderRadius: 8,
  borderType: UKitBorderType.outlineBorder,
  borderWidth: 1.0,
  hintColor: Colors.black54,
  bgColor: Colors.white,
);

///
/// Set Underline Input Styles
///
final underlineInput = UKitTextFieldBuilder(
  borderColor: Colors.black45,
  borderRadius: 8,
  borderType: UKitBorderType.underlineBorder,
  borderWidth: 1.0,
  hintColor: Colors.black54,
  bgColor: Colors.white,
);

///
/// Set Disable Input Styles
///
final disableInput = UKitTextFieldBuilder(
  borderColor: Colors.black45,
  borderRadius: 8,
  borderType: UKitBorderType.outlineBorder,
  focusBorderColor: Colors.black45,
  borderWidth: 1.0,
  hintColor: Colors.black54,
  bgColor: Colors.grey.shade300,
);

///
/// Set Primary Input Styles
///
final dropdownInput = UKitDropdownBuilder(
  borderRadius: 8,
  borderType: UKitBorderType.outlineBorder,
  borderWidth: 1.0,
  bgColor: Colors.white,
  elevation: 2.0,
);

/// Set Small Title Styles
final smallTitle = UKitHeadingBuilder(
  color: Colors.black54,
  heading: 6,
);
