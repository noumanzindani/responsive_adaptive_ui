import 'package:flutter/material.dart';

/// Represents different device types for responsive UI.
enum DeviceType { mobile, tablet, desktop }

/// A builder that helps adapt the UI to different screen sizes.
/// 
/// Two ways to use:
/// 
/// 1. **Pass individual builders** for `mobile`, `tablet`, and `desktop`.
/// 
/// ```dart
/// ResponsiveBuilder(
///   mobile: (context) => MobileView(),
///   tablet: (context) => TabletView(),
///   desktop: (context) => DesktopView(),
/// )
/// ```
/// 
/// 2. **Use a single `builder` with [DeviceType]**:
/// 
/// ```dart
/// ResponsiveBuilder(
///   builder: (context, deviceType) {
///     switch (deviceType) {
///       case DeviceType.mobile: return MobileView();
///       case DeviceType.tablet: return TabletView();
///       case DeviceType.desktop: return DesktopView();
///     }
///   },
/// )
/// ```
class ResponsiveBuilder extends StatelessWidget {
  final WidgetBuilder? mobile;
  final WidgetBuilder? tablet;
  final WidgetBuilder? desktop;

  /// Alternative single builder that provides the [DeviceType].
  final Widget Function(BuildContext, DeviceType)? builder;

  const ResponsiveBuilder({
    super.key,
    this.mobile,
    this.tablet,
    this.desktop,
    this.builder,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final deviceType = width < 600
        ? DeviceType.mobile
        : width < 1024
            ? DeviceType.tablet
            : DeviceType.desktop;

    if (builder != null) {
      return builder!(context, deviceType);
    }

    switch (deviceType) {
      case DeviceType.mobile:
        return mobile?.call(context) ??
            const Center(child: Text("No Mobile Layout Provided"));
      case DeviceType.tablet:
        return tablet?.call(context) ??
            mobile?.call(context) ??
            const Center(child: Text("No Tablet Layout Provided"));
      case DeviceType.desktop:
        return desktop?.call(context) ??
            tablet?.call(context) ??
            mobile?.call(context) ??
            const Center(child: Text("No Desktop Layout Provided"));
    }
  }
}
