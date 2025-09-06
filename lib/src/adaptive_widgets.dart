import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// A button that adapts its style based on the platform.
/// 
/// - iOS → CupertinoButton
/// - Android → ElevatedButton
/// - Web/Desktop → OutlinedButton
class AdaptiveButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? color;

  const AdaptiveButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.padding,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return CupertinoButton(
        onPressed: onPressed,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: color ?? CupertinoColors.activeBlue,
        child: child,
      );
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          backgroundColor: color ?? Theme.of(context).primaryColor,
        ),
        child: child,
      );
    } else {
      // Web/Desktop fallback
      return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        child: child,
      );
    }
  }
}
