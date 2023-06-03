import 'package:flutter/material.dart';
import 'package:photoplay/constants.dart';

List<Color> shaderMaskColors(bool isDarkTheme) {
  return isDarkTheme
      ? [
          kDarkScaffoldColor,
          kDarkScaffoldColor.withOpacity(0.25),
          kDarkScaffoldColor.withOpacity(0.04),
          Colors.transparent,
          kDarkScaffoldColor.withOpacity(0.22),
          kDarkScaffoldColor,
        ]
      : [
          kLightScaffoldColor,
          kLightScaffoldColor.withOpacity(0.25),
          kLightScaffoldColor.withOpacity(0.04),
          Colors.transparent,
          kLightScaffoldColor.withOpacity(0.22),
          kLightScaffoldColor,
        ];
}
