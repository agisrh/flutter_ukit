import 'package:flutter/material.dart';
import 'package:flutter_ukit/flutter_ukit.dart';

class UKitLoader {
  static Widget circular({
    UKitLoaderBuilder? as,
    double scale = 0.7,
    bool withBackgorund = false,
  }) {
    return Center(
      child: withBackgorund
          ? Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80),
              ),
              child: Transform.scale(
                scale: scale,
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(as?.color ?? Colors.blue),
                  backgroundColor: as?.bgColor,
                  strokeWidth: as?.strokeWidth ?? 4.0,
                ),
              ),
            )
          : Transform.scale(
              scale: scale,
              child: CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation<Color>(as?.color ?? Colors.blue),
                backgroundColor: as?.bgColor,
                strokeWidth: as?.strokeWidth ?? 4.0,
              ),
            ),
    );
  }
}

// Multi Color
class UKitLoaderMultiColor extends StatefulWidget {
  final UKitLoaderBuilder? as;
  final double scale;
  final bool withBackgorund;
  const UKitLoaderMultiColor({
    super.key,
    this.as,
    this.scale = 0.7,
    this.withBackgorund = false,
  });

  @override
  State<UKitLoaderMultiColor> createState() => _UKitLoaderMultiColorState();
}

class _UKitLoaderMultiColorState extends State<UKitLoaderMultiColor>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: widget.withBackgorund
          ? Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80),
              ),
              child: Transform.scale(
                scale: widget.scale,
                child: CircularProgressIndicator(
                  valueColor: animationController.drive(
                      ColorTween(begin: Colors.blueAccent, end: Colors.red)),
                  backgroundColor: widget.as?.bgColor,
                  strokeWidth: widget.as?.strokeWidth ?? 4.0,
                ),
              ),
            )
          : Transform.scale(
              scale: widget.scale,
              child: CircularProgressIndicator(
                valueColor: animationController.drive(
                    ColorTween(begin: Colors.blueAccent, end: Colors.red)),
                backgroundColor: widget.as?.bgColor,
                strokeWidth: widget.as?.strokeWidth ?? 4.0,
              ),
            ),
    );
  }
}
