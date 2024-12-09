import 'package:flutter/material.dart';
import 'custom_dialog_info_widget.dart';
import 'animations.dart';
import 'constants.dart';

///
/// This is the Info dialog with 4 different varients as follows:
/// 1. Sucess (Green color)
/// 2. Normal (Blue color)
/// 3. Warning (Orange color)
/// 4. Error (Red color)
/// 5. Custom (you can add your own color)
///
/// Also this dialog comes with 7 different animations:
/// 1. showAnimatedFromLeft
/// 2. showAnimatedFromRight
/// 3. showAnimatedFromTop
/// 4. showAnimatedFromBottom
/// 5. showAnimatedGrow
/// 6. showAnimatedShrink
/// 7. showAnimatedFade
///

class UKitCustomDialogInfo {
  static Future<T?> show<T>(
    BuildContext context, {
    String? title,
    required String message,
    required String buttonText,
    required VoidCallback onTapDismiss,
    required CustomDialogType customDialogType,
    Color? color,
    Color? textColor,
    Color? buttonTextColor,
    EdgeInsets? margin,
    EdgeInsets? padding,
    bool barrierDismissible = true,
    Widget? icon,
  }) =>
      showDialog<T>(
        barrierDismissible: barrierDismissible,
        context: context,
        builder: (context) => CustomDialogInfoWidget(
          title: title,
          message: message,
          buttonText: buttonText,
          onTapDismiss: onTapDismiss,
          customDialogType: customDialogType,
          color: color,
          textColor: textColor,
          buttonTextColor: buttonTextColor,
          margin: margin,
          padding: padding,
          icon: icon,
        ),
      );

  ///
  /// This will show the PanaraInfoDialog with slide animation from left.
  ///
  static Future<T?> showAnimatedFromLeft<T extends Object?>(
    BuildContext context, {
    String? title,
    required String message,
    required String buttonText,
    required VoidCallback onTapDismiss,
    required CustomDialogType customDialogType,
    Color? color,
    Color? textColor,
    Color? buttonTextColor,
    EdgeInsets? margin,
    EdgeInsets? padding,
    bool barrierDismissible = true,
    Widget? icon,
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
        pageBuilder: (animation, secondaryAnimation, child) => CustomDialogInfoWidget(
          title: title,
          message: message,
          buttonText: buttonText,
          onTapDismiss: onTapDismiss,
          customDialogType: customDialogType,
          color: color,
          textColor: textColor,
          buttonTextColor: buttonTextColor,
          margin: margin,
          padding: padding,
          icon: icon,
        ),
      );

  ///
  /// This will show the PanaraInfoDialog with slide animation from right.
  ///
  static Future<T?> showAnimatedFromRight<T extends Object?>(
    BuildContext context, {
    String? title,
    required String message,
    required String buttonText,
    required VoidCallback onTapDismiss,
    required CustomDialogType customDialogType,
    Color? color,
    Color? textColor,
    Color? buttonTextColor,
    EdgeInsets? margin,
    EdgeInsets? padding,
    bool barrierDismissible = true,
    Widget? icon,
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
        pageBuilder: (animation, secondaryAnimation, child) => CustomDialogInfoWidget(
          title: title,
          message: message,
          buttonText: buttonText,
          onTapDismiss: onTapDismiss,
          customDialogType: customDialogType,
          color: color,
          textColor: textColor,
          buttonTextColor: buttonTextColor,
          margin: margin,
          padding: padding,
          icon: icon,
        ),
      );

  ///
  /// This will show the PanaraInfoDialog with slide animation from top.
  ///
  static Future<T?> showAnimatedFromTop<T extends Object?>(
    BuildContext context, {
    String? title,
    required String message,
    required String buttonText,
    required VoidCallback onTapDismiss,
    required CustomDialogType customDialogType,
    Color? color,
    Color? textColor,
    Color? buttonTextColor,
    EdgeInsets? margin,
    EdgeInsets? padding,
    bool barrierDismissible = true,
    Widget? icon,
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
        pageBuilder: (animation, secondaryAnimation, child) => CustomDialogInfoWidget(
          title: title,
          message: message,
          buttonText: buttonText,
          onTapDismiss: onTapDismiss,
          customDialogType: customDialogType,
          color: color,
          textColor: textColor,
          buttonTextColor: buttonTextColor,
          margin: margin,
          padding: padding,
          icon: icon,
        ),
      );

  ///
  /// This will show the PanaraInfoDialog with slide animation from bottom.
  ///
  static Future<T?> showAnimatedFromBottom<T extends Object?>(
    BuildContext context, {
    String? title,
    required String message,
    required String buttonText,
    required VoidCallback onTapDismiss,
    required CustomDialogType customDialogType,
    Color? color,
    Color? textColor,
    Color? buttonTextColor,
    EdgeInsets? margin,
    EdgeInsets? padding,
    bool barrierDismissible = true,
    Widget? icon,
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
        pageBuilder: (animation, secondaryAnimation, child) => CustomDialogInfoWidget(
          title: title,
          message: message,
          buttonText: buttonText,
          onTapDismiss: onTapDismiss,
          customDialogType: customDialogType,
          color: color,
          textColor: textColor,
          buttonTextColor: buttonTextColor,
          margin: margin,
          padding: padding,
          icon: icon,
        ),
      );

  ///
  /// This will show the PanaraInfoDialog with grow animation from center.
  ///
  static Future<T?> showAnimatedGrow<T extends Object?>(
    BuildContext context, {
    String? title,
    required String message,
    required String buttonText,
    required VoidCallback onTapDismiss,
    required CustomDialogType customDialogType,
    Color? color,
    Color? textColor,
    Color? buttonTextColor,
    EdgeInsets? margin,
    EdgeInsets? padding,
    bool barrierDismissible = true,
    Widget? icon,
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
        pageBuilder: (animation, secondaryAnimation, child) => CustomDialogInfoWidget(
          title: title,
          message: message,
          buttonText: buttonText,
          onTapDismiss: onTapDismiss,
          customDialogType: customDialogType,
          color: color,
          textColor: textColor,
          buttonTextColor: buttonTextColor,
          margin: margin,
          padding: padding,
          icon: icon,
        ),
      );

  ///
  /// This will show the PanaraInfoDialog with shrink animation from center.
  ///
  static Future<T?> showAnimatedShrink<T extends Object?>(
    BuildContext context, {
    String? title,
    required String message,
    required String buttonText,
    required VoidCallback onTapDismiss,
    required CustomDialogType customDialogType,
    Color? color,
    Color? textColor,
    Color? buttonTextColor,
    EdgeInsets? margin,
    EdgeInsets? padding,
    bool barrierDismissible = true,
    Widget? icon,
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
        pageBuilder: (animation, secondaryAnimation, child) => CustomDialogInfoWidget(
          title: title,
          message: message,
          buttonText: buttonText,
          onTapDismiss: onTapDismiss,
          customDialogType: customDialogType,
          color: color,
          textColor: textColor,
          buttonTextColor: buttonTextColor,
          margin: margin,
          padding: padding,
          icon: icon,
        ),
      );

  ///
  /// This will show the PanaraInfoDialog with fade animation from center.
  /// This is the new animation added in the library.
  static Future<T?> showAnimatedFade<T extends Object?>(
    BuildContext context, {
    String? title,
    required String message,
    required String buttonText,
    required VoidCallback onTapDismiss,
    required CustomDialogType customDialogType,
    Color? color,
    Color? textColor,
    Color? buttonTextColor,
    EdgeInsets? margin,
    EdgeInsets? padding,
    bool barrierDismissible = true,
    Widget? icon,
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
        pageBuilder: (animation, secondaryAnimation, child) => CustomDialogInfoWidget(
          title: title,
          message: message,
          buttonText: buttonText,
          onTapDismiss: onTapDismiss,
          customDialogType: customDialogType,
          color: color,
          textColor: textColor,
          buttonTextColor: buttonTextColor,
          margin: margin,
          padding: padding,
          icon: icon,
        ),
      );
}
