import 'package:flutter/material.dart';
import 'package:flutter_ukit/flutter_ukit_utils.dart';
import 'package:flutter_ukit/models/container_defaults.dart';

class UKitContainer extends StatelessWidget {
  const UKitContainer({
    super.key,
    required this.child,
    this.as,
    this.color,
    this.padding,
    this.borderRadius,
    this.shadow,
    this.borderColor,
    this.borderWidth,
    this.widthFactor,
  });

  final Widget child;
  final UKitContainerDefaults? as;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final BoxShadow? shadow;
  final Color? borderColor;
  final double? borderWidth;
  final double? widthFactor;

  static BoxShadow defaultShadow = const BoxShadow(
    color: Color.fromRGBO(100, 100, 100, 0.30),
    blurRadius: 20,
  );

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: UKitUtils.getDouble(as, as?.widthFactor, widthFactor, 1.0),
      child: Container(
        decoration: BoxDecoration(
          color: UKitUtils.getColor(as, as?.color, color, Colors.white),
          borderRadius: BorderRadius.all(
            Radius.circular(
              UKitUtils.getDouble(as, as?.borderRadius, borderRadius, 0.0),
            ),
          ),
          border: Border.all(
            color: UKitUtils.getColor(
                as, as?.borderColor, borderColor, Colors.transparent),
            width: UKitUtils.getDouble(as, as?.borderWidth, borderWidth, 0.0),
          ),
          boxShadow: [
            UKitUtils.getStyle(as, as?.shadow, shadow, defaultShadow),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            UKitUtils.getDouble(as, as?.borderRadius, borderRadius, 0.0),
          ),
          child: Padding(
            padding: UKitUtils.getStyle(
                as, as?.padding, padding, const EdgeInsets.all(0.0)),
            child: child,
          ),
        ),
      ),
    );
  }
}
