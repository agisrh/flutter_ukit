import 'package:flutter_ukit/flutter_ukit.dart';
import 'package:flutter/material.dart';

class CustomDialogConfirmWidget extends StatelessWidget {
  final String? title;
  final String message;
  final String confirmButtonText;
  final String cancelButtonText;
  final VoidCallback onTapConfirm;
  final VoidCallback onTapCancel;
  final CustomDialogType customDialogType;
  final Color? color;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? buttonTextColor;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget? icon;

  const CustomDialogConfirmWidget({
    Key? key,
    this.title,
    required this.message,
    required this.confirmButtonText,
    required this.cancelButtonText,
    required this.onTapConfirm,
    required this.onTapCancel,
    required this.customDialogType,
    this.color,
    this.backgroundColor,
    this.textColor = const Color(0xFF707070),
    this.buttonTextColor = Colors.white,
    this.padding = const EdgeInsets.all(24),
    this.margin = const EdgeInsets.all(24),
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Align(
      alignment: Alignment.center,
      child: Material(
        color: Colors.transparent,
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 340,
          ),
          margin: margin ?? const EdgeInsets.all(24),
          padding: padding ?? const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: backgroundColor ?? theme.dialogBackgroundColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon ?? const SizedBox(height: 24),
              if (title != null)
                Text(
                  title ?? "",
                  style: UKitTypography.BodyBold.copyWith(
                    color: textColor,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              if (title != null) const SizedBox(height: 3),
              Text(
                message,
                style: UKitTypography.SmallBody,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: CustomDialogButton(
                      onTap: onTapCancel,
                      text: cancelButtonText,
                      bgColor: getCustomDialogColor(
                        customDialogType: customDialogType,
                        defaultColor: color ?? const Color(0xFF179DFF),
                      ),
                      isOutlined: true,
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Expanded(
                    flex: 1,
                    child: CustomDialogButton(
                      buttonTextColor: buttonTextColor ?? Colors.white,
                      onTap: onTapConfirm,
                      text: confirmButtonText,
                      bgColor: getCustomDialogColor(
                        customDialogType: customDialogType,
                        defaultColor: color ?? const Color(0xFF179DFF),
                      ),
                      isOutlined: false,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
