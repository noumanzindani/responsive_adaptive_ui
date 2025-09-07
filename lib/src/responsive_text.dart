import 'package:flutter/material.dart';

/// A text widget that automatically adapts font size
/// between a minimum and maximum range depending on screen width.
///
/// Also respects system accessibility text scaling.
class ResponsiveText extends StatelessWidget {
  /// The string to display.
  final String data;

  /// Minimum font size.
  final double min;

  /// Maximum font size.
  final double max;

  /// Optional style applied to the text.
  final TextStyle? style;

  /// Text alignment.
  final TextAlign? textAlign;

  /// Overflow behavior.
  final TextOverflow? overflow;

  /// Maximum number of lines.
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

    // Scale between min and max based on screen width (600px = mid range).
    double scale = (width / 600).clamp(0.8, 2.0);
    double size = (min + (max - min) * (scale - 0.8) / (2.0 - 0.8))
        .clamp(min, max);

    // Apply system text scaling for accessibility.
    return size * mediaQuery.textScaler.scale(1);
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
