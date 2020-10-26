import 'package:flutter/material.dart';

class MediaQueryTools {
  BuildContext context;
  DefaultValue defaultValues;
  MediaQueryData _mediaQuery; // Default Values that is used in calculate base

  MediaQueryTools.of(this.context, {this.defaultValues}) {
    _setDefaultValue();
    _mediaQuery = MediaQuery.of(context);
  }

  // Used to pass
  double heightPercent(double percent) {
    percent /= 100;
    return _mediaQuery.size.height * percent;
  }

  double widthPercent(double percent) {
    percent /= 100;
    return _mediaQuery.size.width * percent;
  }

  double get textScale => _mediaQuery.textScaleFactor;

  double get aspectRatio => _mediaQuery.devicePixelRatio;

  double get getWidth => _mediaQuery.size.width;

  double get getHeight => _mediaQuery.size.height;

  double avaliableHeight(double appBarHeight) {
    return getHeight - appBarHeight;
  }

  double height(double height) {
    double percent = (((height * 100) / defaultValues.height) / 100);
    return percent * _mediaQuery.size.height;
  }

  double width(double width) {
    double percent = (((width * 100) / defaultValues.width) / 100);
    return percent * _mediaQuery.size.width;
  }

  void _setDefaultValue() {
    defaultValues = defaultValues == null
        ? DefaultValue(height: 640, width: 360)
        : defaultValues;
  }
}

class DefaultValue {
  DefaultValue({
    @required this.height,
    @required this.width,
  });

  final double height;
  final double width;
}
