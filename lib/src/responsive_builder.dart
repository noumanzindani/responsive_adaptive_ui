import 'package:flutter/widgets.dart';

/// A widget that builds different layouts depending on the screen width.
/// 
/// - Mobile: <600px
/// - Tablet: 600px–1024px
/// - Desktop: >1024px
class ResponsiveBuilder extends StatelessWidget {
  final WidgetBuilder mobile;
  final WidgetBuilder? tablet;
  final WidgetBuilder? desktop;

  /// Default breakpoints
  static const double _tabletBreakpoint = 600;
  static const double _desktopBreakpoint = 1024;

  const ResponsiveBuilder({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    if (width >= _desktopBreakpoint && desktop != null) {
      return desktop!(context);
    } else if (width >= _tabletBreakpoint && tablet != null) {
      return tablet!(context);
    } else {
      return mobile(context);
    }
  }
}
