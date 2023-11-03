import 'package:flutter/material.dart';
import 'package:flutter_ukit/models/shimmer_builder.dart';
export 'shimmer_loading.dart';

class UKitShimmer extends StatefulWidget {
  static UKitShimmerState? of(BuildContext context) {
    return context.findAncestorStateOfType<UKitShimmerState>();
  }

  const UKitShimmer({super.key, this.as, this.child});

  final UKitShimmerBuilder? as;
  final Widget? child;

  @override
  UKitShimmerState createState() => UKitShimmerState();
}

class UKitShimmerState extends State<UKitShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;

  @override
  void initState() {
    super.initState();

    _shimmerController = AnimationController.unbounded(vsync: this)
      ..repeat(min: -0.5, max: 1.5, period: const Duration(milliseconds: 1000));
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }
// code-excerpt-closing-bracket

  LinearGradient get gradient => LinearGradient(
        colors: widget.as?.linearGradient.colors ??
            const [
              Color(0xFFEBEBF4),
              Color(0xFFF4F4F4),
              Color(0xFFEBEBF4),
            ],
        stops: widget.as?.linearGradient.stops ?? [0.1, 0.3, 0.4],
        begin: widget.as?.linearGradient.begin ?? const Alignment(-1.0, -0.3),
        end: widget.as?.linearGradient.end ?? const Alignment(1.0, 0.3),
        transform: _SlidingGradientTransform(
          slidePercent: _shimmerController.value,
        ),
      );

  bool get isSized => (context.findRenderObject() as RenderBox).hasSize;
  Size get size => (context.findRenderObject() as RenderBox).size;

  Offset getDescendantOffset({
    required RenderBox descendant,
    Offset offset = Offset.zero,
  }) {
    final shimmerBox = context.findRenderObject() as RenderBox;
    return descendant.localToGlobal(offset, ancestor: shimmerBox);
  }

  Listenable get shimmerChanges => _shimmerController;

  @override
  Widget build(BuildContext context) {
    return widget.child ?? const SizedBox();
  }
}

class _SlidingGradientTransform extends GradientTransform {
  const _SlidingGradientTransform({required this.slidePercent});

  final double slidePercent;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * slidePercent, 0.0, 0.0);
  }
}
