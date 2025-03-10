import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

final Toastification toast = Toastification();

enum ToastType { success, info, warning, error }

enum ToastStyle { minimal, fillColored, flatColored, flat }

class UKitToast {
  // Toast Custom
  static Future custom({
    required BuildContext context,
    Widget? title,
    Widget? message,
    ToastType? type,
    ToastStyle? style,
    Widget? icon,
    Alignment? alignment = Alignment.bottomCenter,
    bool closeButton = false,
    Duration? duration,
    Color? primaryColor,
    Color? foregorundColor,
    Color? backgroundColor,
  }) async {
    toastification.show(
      context: context,
      title: title,
      description: message,
      alignment: alignment,
      showProgressBar: false,
      icon: icon,
      primaryColor: primaryColor,
      foregroundColor: foregorundColor,
      backgroundColor: backgroundColor,
      autoCloseDuration: duration ?? const Duration(seconds: 3),
      closeButtonShowType: closeButton ? CloseButtonShowType.always : CloseButtonShowType.none,
      type: type == ToastType.warning
          ? ToastificationType.warning
          : type == ToastType.info
              ? ToastificationType.info
              : type == ToastType.error
                  ? ToastificationType.error
                  : ToastificationType.success,
      style: style == ToastStyle.minimal
          ? ToastificationStyle.minimal
          : style == ToastStyle.fillColored
              ? ToastificationStyle.fillColored
              : style == ToastStyle.flatColored
                  ? ToastificationStyle.flatColored
                  : ToastificationStyle.flat,
    );
  }

  // Toast Simple
  static Future simple({
    required BuildContext context,
    Widget? title,
    Alignment? alignment,
    bool closeButton = false,
    Duration? duration,
    Color? primaryColor,
    Color? foregorundColor,
    Color? backgroundColor,
  }) async {
    toastification.show(
      context: context,
      title: title,
      alignment: alignment,
      showProgressBar: false,
      primaryColor: primaryColor,
      foregroundColor: foregorundColor,
      backgroundColor: backgroundColor,
      autoCloseDuration: duration ?? const Duration(seconds: 3),
      closeButtonShowType: closeButton ? CloseButtonShowType.always : CloseButtonShowType.none,
      style: ToastificationStyle.simple,
    );
  }
}
