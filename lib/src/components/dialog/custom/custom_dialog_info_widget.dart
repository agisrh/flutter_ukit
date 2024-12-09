import 'constants.dart';
import 'custom_dialog_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ukit/src/contents/typography.dart';

class CustomDialogInfoWidget extends StatelessWidget {
  final String? title;
  final String message;
  final String buttonText;
  final VoidCallback onTapDismiss;
  final CustomDialogType customDialogType;
  final Color? color;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? buttonTextColor;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget? icon;

  const CustomDialogInfoWidget({
    Key? key,
    this.title,
    required this.message,
    required this.buttonText,
    required this.onTapDismiss,
    required this.customDialogType,
    this.textColor = const Color(0xFF707070),
    this.color = const Color(0xFF179DFF),
    this.backgroundColor,
    this.buttonTextColor,
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
              CustomDialogButton(
                buttonTextColor: buttonTextColor ?? Colors.white,
                text: buttonText,
                onTap: onTapDismiss,
                bgColor: getCustomDialogColor(
                  customDialogType: customDialogType,
                  defaultColor: color ?? CustomDialogColors.normal,
                ),
                isOutlined: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
