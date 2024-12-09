import 'package:flutter/material.dart';
import 'animations.dart';
import 'custom_dialog_widget.dart';

///
/// This is the PanaraCustomDialog with 7 different animations:
/// 1. showAnimatedFromLeft
/// 2. showAnimatedFromRight
/// 3. showAnimatedFromTop
/// 4. showAnimatedFromBottom
/// 5. showAnimatedGrow
/// 6. showAnimatedShrink
/// 7. showAnimatedFade
///

class UKitCustomDialog {
  ///
  /// This is PanaraCustomDialog without animation.
  ///
  /// for more information visit https://pub.dev/documentation/panara_dialogs/latest/
  ///
  static Future<T?> show<T>(
    BuildContext context, {
    required List<Widget> children,
    EdgeInsets? margin,
    EdgeInsets? padding,
    Color? backgroundColor,
    bool barrierDismissible = true,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
  }) =>
      showDialog<T>(
        barrierDismissible: barrierDismissible,
        context: context,
        builder: (context) => CustomDialogWidget(
          margin: margin,
          padding: padding,
          backgroundColor: backgroundColor,
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          children: children,
        ),
      );

  ///
  /// This will show the PanaraCustomDialog with slide animation from left.
  ///
  static Future<T?> showAnimatedFromLeft<T extends Object?>(
    BuildContext context, {
    required List<Widget> children,
    EdgeInsets? margin,
    EdgeInsets? padding,
    Color? backgroundColor,
    bool barrierDismissible = true,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
  }) =>
      showGeneralDialog<T>(
        barrierDismissible: barrierDismissible,
        context: context,
        barrierLabel: '',
        transitionDuration: const Duration(milliseconds: 300),
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return DialogAnimations.fromLeft(
            animation,
            secondaryAnimation,
            child,
          );
        },
        pageBuilder: (animation, secondaryAnimation, child) => CustomDialogWidget(
          margin: margin,
          padding: padding,
          backgroundColor: backgroundColor,
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          children: children,
        ),
      );

  ///
  /// This will show the PanaraCustomDialog with slide animation from right.
  ///
  static Future<T?> showAnimatedFromRight<T extends Object?>(
    BuildContext context, {
    required List<Widget> children,
    EdgeInsets? margin,
    EdgeInsets? padding,
    Color? backgroundColor,
    bool barrierDismissible = true,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
  }) =>
      showGeneralDialog<T>(
        barrierDismissible: barrierDismissible,
        context: context,
        barrierLabel: '',
        transitionDuration: const Duration(milliseconds: 300),
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return DialogAnimations.fromRight(
            animation,
            secondaryAnimation,
            child,
          );
        },
        pageBuilder: (animation, secondaryAnimation, child) => CustomDialogWidget(
          margin: margin,
          padding: padding,
          backgroundColor: backgroundColor,
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          children: children,
        ),
      );

  ///
  /// This will show the PanaraCustomDialog with slide animation from top.
  ///
  static Future<T?> showAnimatedFromTop<T extends Object?>(
    BuildContext context, {
    required List<Widget> children,
    EdgeInsets? margin,
    EdgeInsets? padding,
    Color? backgroundColor,
    bool barrierDismissible = true,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
  }) =>
      showGeneralDialog<T>(
        barrierDismissible: barrierDismissible,
        context: context,
        barrierLabel: '',
        transitionDuration: const Duration(milliseconds: 300),
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return DialogAnimations.fromTop(
            animation,
            secondaryAnimation,
            child,
          );
        },
        pageBuilder: (animation, secondaryAnimation, child) => CustomDialogWidget(
          margin: margin,
          padding: padding,
          backgroundColor: backgroundColor,
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          children: children,
        ),
      );

  ///
  /// This will show the PanaraCustomDialog with slide animation from bottom.
  ///
  static Future<T?> showAnimatedFromBottom<T extends Object?>(
    BuildContext context, {
    required List<Widget> children,
    EdgeInsets? margin,
    EdgeInsets? padding,
    Color? backgroundColor,
    bool barrierDismissible = true,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
  }) =>
      showGeneralDialog<T>(
        barrierDismissible: barrierDismissible,
        context: context,
        barrierLabel: '',
        transitionDuration: const Duration(milliseconds: 300),
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return DialogAnimations.fromBottom(
            animation,
            secondaryAnimation,
            child,
          );
        },
        pageBuilder: (animation, secondaryAnimation, child) => CustomDialogWidget(
          margin: margin,
          padding: padding,
          backgroundColor: backgroundColor,
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          children: children,
        ),
      );

  ///
  /// This will show the PanaraCustomDialog with grow animation from center.
  ///
  static Future<T?> showAnimatedGrow<T extends Object?>(
    BuildContext context, {
    required List<Widget> children,
    EdgeInsets? margin,
    EdgeInsets? padding,
    Color? backgroundColor,
    bool barrierDismissible = true,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
  }) =>
      showGeneralDialog<T>(
        barrierDismissible: barrierDismissible,
        context: context,
        barrierLabel: '',
        transitionDuration: const Duration(milliseconds: 300),
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return DialogAnimations.grow(
            animation,
            secondaryAnimation,
            child,
          );
        },
        pageBuilder: (animation, secondaryAnimation, child) => CustomDialogWidget(
          margin: margin,
          padding: padding,
          backgroundColor: backgroundColor,
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          children: children,
        ),
      );

  ///
  /// This will show the PanaraCustomDialog with shrink animation from center.
  ///
  static Future<T?> showAnimatedShrink<T extends Object?>(
    BuildContext context, {
    required List<Widget> children,
    EdgeInsets? margin,
    EdgeInsets? padding,
    Color? backgroundColor,
    bool barrierDismissible = true,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
  }) =>
      showGeneralDialog<T>(
        barrierDismissible: barrierDismissible,
        context: context,
        barrierLabel: '',
        transitionDuration: const Duration(milliseconds: 300),
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return DialogAnimations.shrink(
            animation,
            secondaryAnimation,
            child,
          );
        },
        pageBuilder: (animation, secondaryAnimation, child) => CustomDialogWidget(
          margin: margin,
          padding: padding,
          backgroundColor: backgroundColor,
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          children: children,
        ),
      );

  ///
  /// This will show the PanaraCustomDialog with fade animation from center.
  /// This is the new animation added in the library.
  static Future<T?> showAnimatedFade<T extends Object?>(
    BuildContext context, {
    required List<Widget> children,
    EdgeInsets? margin,
    EdgeInsets? padding,
    Color? backgroundColor,
    bool barrierDismissible = true,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
  }) =>
      showGeneralDialog<T>(
        barrierDismissible: barrierDismissible,
        context: context,
        barrierLabel: '',
        transitionDuration: const Duration(milliseconds: 300),
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return DialogAnimations.fade(
            animation,
            secondaryAnimation,
            child,
          );
        },
        pageBuilder: (animation, secondaryAnimation, child) => CustomDialogWidget(
          margin: margin,
          padding: padding,
          backgroundColor: backgroundColor,
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          children: children,
        ),
      );
}
