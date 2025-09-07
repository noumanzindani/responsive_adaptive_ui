import 'package:flutter/material.dart';

/// A utility class for responsive sizing and spacing.
///
/// Provides helpers to calculate widget dimensions (width, height, padding, margin)
/// relative to the device screen size.
///
/// Call [init] once inside your widget tree (e.g., at the start of `build`)
/// before using its methods.
class Responsive {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;

  static late double _safeAreaHorizontal;
  static late double _safeAreaVertical;
  static late double safeBlockHorizontal;
  static late double safeBlockVertical;

  static late double textScaleFactor;

  /// Initializes the [Responsive] class with the given [BuildContext].
  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    textScaleFactor = _mediaQueryData.textScaler.scale(1); // ✅ modern way
    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
  }

  /// Returns width as a percentage of screen width.
  static double w(double percent) => screenWidth * (percent / 100);

  /// Returns height as a percentage of screen height.
  static double h(double percent) => screenHeight * (percent / 100);

  /// Returns font size scaled according to system text settings.
  static double sp(double size) => size * textScaleFactor;

  /// Width percentage (alias for [w]).
  static double wp(double percent) => screenWidth * (percent / 100);

  /// Height percentage (alias for [h]).
  static double hp(double percent) => screenHeight * (percent / 100);

  /// Creates responsive padding.
  static EdgeInsets padding({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) {
    return EdgeInsets.fromLTRB(wp(left), hp(top), wp(right), hp(bottom));
  }

  /// Creates responsive margin.
  static EdgeInsets margin({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) {
    return EdgeInsets.fromLTRB(wp(left), hp(top), wp(right), hp(bottom));
  }

  /// Returns a vertical [SizedBox] with height based on percentage of screen.
  static SizedBox height(double percent) => SizedBox(height: h(percent));

  /// Returns a horizontal [SizedBox] with width based on percentage of screen.
  static SizedBox width(double percent) => SizedBox(width: w(percent));
}
