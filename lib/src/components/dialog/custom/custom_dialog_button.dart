import 'package:flutter/material.dart';
import 'package:flutter_ukit/flutter_ukit.dart';

///
/// This is the Button widget used in both dialogs.
///
///
class CustomDialogButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final Color bgColor;
  final Color buttonTextColor;
  final bool isOutlined;

  const CustomDialogButton({
    Key? key,
    required this.text,
    this.onTap,
    required this.bgColor,
    required this.isOutlined,
    this.buttonTextColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Material(
      color: isOutlined ? theme.buttonTheme.colorScheme?.surface : bgColor,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 45,
          decoration: BoxDecoration(
            border: isOutlined ? Border.all(color: bgColor) : null,
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: UKitTypography.SmallBody.copyWith(
              fontWeight: FontWeight.w600,
              color: isOutlined ? bgColor : buttonTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
