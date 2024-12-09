import 'package:flutter/material.dart';
import 'animations.dart';
import 'constants.dart';
import 'custom_dialog_confirm_widget.dart';

///
/// This is the Confirmation dialog with 4 different varients as follows:
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

class UKitCustomDialogConfirm {
  static Future<T?> show<T>(
    BuildContext context, {
    String? title,
    required String message,
    required String confirmButtonText,
    required String cancelButtonText,
    required VoidCallback onTapConfirm,
    required VoidCallback onTapCancel,
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
        builder: (context) => CustomDialogConfirmWidget(
          title: title,
          message: message,
          confirmButtonText: confirmButtonText,
          cancelButtonText: cancelButtonText,
          onTapConfirm: onTapConfirm,
          onTapCancel: onTapCancel,
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
  /// This will show the PanaraConfirmDialog with slide animation from left.
  ///

  static Future<T?> showAnimatedFromLeft<T extends Object?>(
    BuildContext context, {
    String? title,
    required String message,
    required String confirmButtonText,
    required String cancelButtonText,
    required VoidCallback onTapConfirm,
    required VoidCallback onTapCancel,
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
        pageBuilder: (animation, secondaryAnimation, child) => CustomDialogConfirmWidget(
          title: title,
          message: message,
          confirmButtonText: confirmButtonText,
          cancelButtonText: cancelButtonText,
          onTapConfirm: onTapConfirm,
          onTapCancel: onTapCancel,
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
  /// This will show the PanaraConfirmDialog with slide animation from right.
  ///
  /// for more information visit https://pub.dev/documentation/panara_dialogs/latest/
  ///
  static Future<T?> showAnimatedFromRight<T extends Object?>(
    BuildContext context, {
    String? title,
    required String message,
    required String confirmButtonText,
    required String cancelButtonText,
    required VoidCallback onTapConfirm,
    required VoidCallback onTapCancel,
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
        pageBuilder: (animation, secondaryAnimation, child) => CustomDialogConfirmWidget(
          title: title,
          message: message,
          confirmButtonText: confirmButtonText,
          cancelButtonText: cancelButtonText,
          onTapConfirm: onTapConfirm,
          onTapCancel: onTapCancel,
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
  /// This will show the PanaraConfirmDialog with slide animation from top.
  ///
  static Future<T?> showAnimatedFromTop<T extends Object?>(
    BuildContext context, {
    String? title,
    required String message,
    required String confirmButtonText,
    required String cancelButtonText,
    required VoidCallback onTapConfirm,
    required VoidCallback onTapCancel,
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
        pageBuilder: (animation, secondaryAnimation, child) => CustomDialogConfirmWidget(
          title: title,
          message: message,
          confirmButtonText: confirmButtonText,
          cancelButtonText: cancelButtonText,
          onTapConfirm: onTapConfirm,
          onTapCancel: onTapCancel,
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
  /// This will show the PanaraConfirmDialog with slide animation from bottom.
  ///
  static Future<T?> showAnimatedFromBottom<T extends Object?>(
    BuildContext context, {
    String? title,
    required String message,
    required String confirmButtonText,
    required String cancelButtonText,
    required VoidCallback onTapConfirm,
    required VoidCallback onTapCancel,
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
        pageBuilder: (animation, secondaryAnimation, child) => CustomDialogConfirmWidget(
          title: title,
          message: message,
          confirmButtonText: confirmButtonText,
          cancelButtonText: cancelButtonText,
          onTapConfirm: onTapConfirm,
          onTapCancel: onTapCancel,
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
  /// This will show the PanaraConfirmDialog with grow animation from center.
  ///
  static Future<T?> showAnimatedGrow<T extends Object?>(
    BuildContext context, {
    String? title,
    required String message,
    required String confirmButtonText,
    required String cancelButtonText,
    required VoidCallback onTapConfirm,
    required VoidCallback onTapCancel,
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
        pageBuilder: (animation, secondaryAnimation, child) => CustomDialogConfirmWidget(
          title: title,
          message: message,
          confirmButtonText: confirmButtonText,
          cancelButtonText: cancelButtonText,
          onTapConfirm: onTapConfirm,
          onTapCancel: onTapCancel,
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
  /// This will show the PanaraConfirmDialog with shrink animation from center.
  ///
  static Future<T?> showAnimatedShrink<T extends Object?>(
    BuildContext context, {
    String? title,
    required String message,
    required String confirmButtonText,
    required String cancelButtonText,
    required VoidCallback onTapConfirm,
    required VoidCallback onTapCancel,
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
        pageBuilder: (animation, secondaryAnimation, child) => CustomDialogConfirmWidget(
          title: title,
          message: message,
          confirmButtonText: confirmButtonText,
          cancelButtonText: cancelButtonText,
          onTapConfirm: onTapConfirm,
          onTapCancel: onTapCancel,
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
  /// This will show the PanaraConfirmDialog with fade animation from center.
  /// This is the new animation added in the library.

  static Future<T?> showAnimatedFade<T extends Object?>(
    BuildContext context, {
    String? title,
    required String message,
    required String confirmButtonText,
    required String cancelButtonText,
    required VoidCallback onTapConfirm,
    required VoidCallback onTapCancel,
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
        pageBuilder: (animation, secondaryAnimation, child) => CustomDialogConfirmWidget(
          title: title,
          message: message,
          confirmButtonText: confirmButtonText,
          cancelButtonText: cancelButtonText,
          onTapConfirm: onTapConfirm,
          onTapCancel: onTapCancel,
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
