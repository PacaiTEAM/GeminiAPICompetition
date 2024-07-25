import 'package:flutter/material.dart';

/// Get the screen dimensions with safe area
///
/// @returns (width, height)
(double, double) getScreenDimensions(BuildContext context, bool? getPixel) {
  MediaQueryData mediaQuery = MediaQuery.of(context);
  bool convertToPixel = getPixel ?? false;
  double px = MediaQuery.of(context).devicePixelRatio;

  Size size = mediaQuery.size;
  double width = size.width;
  double height = size.height;

  return (
    convertToPixel ? width * px : width,
    convertToPixel ? height * px : height,
  );
}

/// Get the screen dimensions without safe area
///
/// @returns (width, height)
(double, double) getScreenDimensionsForSafeArea(
    BuildContext context, bool? getPixel) {
  MediaQueryData mediaQuery = MediaQuery.of(context);
  bool convertToPixel = getPixel ?? false;
  double px = MediaQuery.of(context).devicePixelRatio;

  Size size = mediaQuery.size;
  EdgeInsets padding = MediaQuery.of(context).viewPadding;
  double width = size.width - padding.left - padding.right;
  double height = size.height - padding.top - padding.bottom;

  return (
    convertToPixel ? width * px : width,
    convertToPixel ? height * px : height,
  );
}
