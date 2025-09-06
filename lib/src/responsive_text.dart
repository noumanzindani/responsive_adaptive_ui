import 'package:flutter/material.dart';

/// A text widget that automatically scales its font size
/// between [min] and [max] based on the screen width.
///
/// ✅ Respects system text scaling (accessibility).
class ResponsiveText extends StatelessWidget {
  final String data;
  final double min;
  final double max;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;

  const ResponsiveText(
    this.data, {
    super.key,
    required this.min,
    required this.max,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  });

  double _calculateFontSize(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;

    // Scale between min and max based on width (600px = mid range)
    double scale = (width / 600).clamp(0.8, 2.0);

    double size = (min + (max - min) * (scale - 0.8) / (2.0 - 0.8))
        .clamp(min, max);

    // Apply system text scale factor for accessibility
    return size * mediaQuery.textScaleFactor;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style?.copyWith(fontSize: _calculateFontSize(context)) ??
          TextStyle(fontSize: _calculateFontSize(context)),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
