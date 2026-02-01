import 'package:flutter/material.dart';
import 'screen_util.dart';

/// Responsive text styles based on screen size
class ResponsiveText {
  /// Get responsive TextStyle
  /// 
  /// [fontSize] - Base font size from design
  /// [fontWeight] - Font weight
  /// [color] - Text color
  /// [letterSpacing] - Letter spacing
  /// [height] - Line height multiplier
  /// [allowFontScaling] - Whether to respect system font scaling
  static TextStyle style({
    required double fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? height,
    String? fontFamily,
    TextDecoration? decoration,
    FontStyle? fontStyle,
    bool allowFontScaling = false,
  }) {
    return TextStyle(
      fontSize: ScreenUtil.instance.setSp(fontSize, allowFontScaling: allowFontScaling),
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
      height: height,
      fontFamily: fontFamily,
      decoration: decoration,
      fontStyle: fontStyle,
    );
  }

  // Pre-defined responsive text styles

  /// Display text style (very large)
  static TextStyle display({
    FontWeight fontWeight = FontWeight.bold,
    Color? color,
    bool allowFontScaling = false,
  }) {
    return style(
      fontSize: ScreenUtil.instance.isPhone ? 32 : 48,
      fontWeight: fontWeight,
      color: color,
      allowFontScaling: allowFontScaling,
    );
  }

  /// Headline 1 text style
  static TextStyle h1({
    FontWeight fontWeight = FontWeight.bold,
    Color? color,
    bool allowFontScaling = false,
  }) {
    return style(
      fontSize: ScreenUtil.instance.isPhone ? 28 : 36,
      fontWeight: fontWeight,
      color: color,
      allowFontScaling: allowFontScaling,
    );
  }

  /// Headline 2 text style
  static TextStyle h2({
    FontWeight fontWeight = FontWeight.bold,
    Color? color,
    bool allowFontScaling = false,
  }) {
    return style(
      fontSize: ScreenUtil.instance.isPhone ? 24 : 30,
      fontWeight: fontWeight,
      color: color,
      allowFontScaling: allowFontScaling,
    );
  }

  /// Headline 3 text style
  static TextStyle h3({
    FontWeight fontWeight = FontWeight.w600,
    Color? color,
    bool allowFontScaling = false,
  }) {
    return style(
      fontSize: ScreenUtil.instance.isPhone ? 20 : 24,
      fontWeight: fontWeight,
      color: color,
      allowFontScaling: allowFontScaling,
    );
  }

  /// Headline 4 text style
  static TextStyle h4({
    FontWeight fontWeight = FontWeight.w600,
    Color? color,
    bool allowFontScaling = false,
  }) {
    return style(
      fontSize: ScreenUtil.instance.isPhone ? 18 : 20,
      fontWeight: fontWeight,
      color: color,
      allowFontScaling: allowFontScaling,
    );
  }

  /// Headline 5 text style
  static TextStyle h5({
    FontWeight fontWeight = FontWeight.w500,
    Color? color,
    bool allowFontScaling = false,
  }) {
    return style(
      fontSize: ScreenUtil.instance.isPhone ? 16 : 18,
      fontWeight: fontWeight,
      color: color,
      allowFontScaling: allowFontScaling,
    );
  }

  /// Headline 6 text style
  static TextStyle h6({
    FontWeight fontWeight = FontWeight.w500,
    Color? color,
    bool allowFontScaling = false,
  }) {
    return style(
      fontSize: ScreenUtil.instance.isPhone ? 14 : 16,
      fontWeight: fontWeight,
      color: color,
      allowFontScaling: allowFontScaling,
    );
  }

  /// Body large text style
  static TextStyle bodyLarge({
    FontWeight fontWeight = FontWeight.normal,
    Color? color,
    bool allowFontScaling = false,
  }) {
    return style(
      fontSize: 16,
      fontWeight: fontWeight,
      color: color,
      height: 1.5,
      allowFontScaling: allowFontScaling,
    );
  }

  /// Body medium text style (default body text)
  static TextStyle bodyMedium({
    FontWeight fontWeight = FontWeight.normal,
    Color? color,
    bool allowFontScaling = false,
  }) {
    return style(
      fontSize: 14,
      fontWeight: fontWeight,
      color: color,
      height: 1.5,
      allowFontScaling: allowFontScaling,
    );
  }

  /// Body small text style
  static TextStyle bodySmall({
    FontWeight fontWeight = FontWeight.normal,
    Color? color,
    bool allowFontScaling = false,
  }) {
    return style(
      fontSize: 12,
      fontWeight: fontWeight,
      color: color,
      height: 1.4,
      allowFontScaling: allowFontScaling,
    );
  }

  /// Caption text style
  static TextStyle caption({
    FontWeight fontWeight = FontWeight.normal,
    Color? color,
    bool allowFontScaling = false,
  }) {
    return style(
      fontSize: 12,
      fontWeight: fontWeight,
      color: color,
      allowFontScaling: allowFontScaling,
    );
  }

  /// Button text style
  static TextStyle button({
    FontWeight fontWeight = FontWeight.w600,
    Color? color,
    bool allowFontScaling = false,
  }) {
    return style(
      fontSize: 14,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: 0.5,
      allowFontScaling: allowFontScaling,
    );
  }

  /// Overline text style
  static TextStyle overline({
    FontWeight fontWeight = FontWeight.w500,
    Color? color,
    bool allowFontScaling = false,
  }) {
    return style(
      fontSize: 10,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: 1.5,
      allowFontScaling: allowFontScaling,
    );
  }

  /// Label text style
  static TextStyle label({
    FontWeight fontWeight = FontWeight.w500,
    Color? color,
    bool allowFontScaling = false,
  }) {
    return style(
      fontSize: 12,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: 0.5,
      allowFontScaling: allowFontScaling,
    );
  }
}

/// Widget for responsive text with auto-scaling
class AdaptiveText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool allowFontScaling;
  final double? minFontSize;
  final double? maxFontSize;

  const AdaptiveText(
    this.text, {
    Key? key,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.allowFontScaling = false,
    this.minFontSize,
    this.maxFontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle effectiveStyle = style ?? const TextStyle();
    
    if (effectiveStyle.fontSize != null) {
      double fontSize = ScreenUtil.instance.setSp(
        effectiveStyle.fontSize!,
        allowFontScaling: allowFontScaling,
      );

      // Apply min/max constraints
      if (minFontSize != null && fontSize < minFontSize!) {
        fontSize = minFontSize!;
      }
      if (maxFontSize != null && fontSize > maxFontSize!) {
        fontSize = maxFontSize!;
      }

      effectiveStyle = effectiveStyle.copyWith(fontSize: fontSize);
    }

    return Text(
      text,
      style: effectiveStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

/// Extension on TextStyle for responsive sizing
extension ResponsiveTextStyle on TextStyle {
  /// Make text style responsive
  TextStyle get responsive {
    return copyWith(
      fontSize: fontSize != null ? ScreenUtil.instance.setSp(fontSize!) : null,
    );
  }

  /// Make text style responsive with font scaling
  TextStyle get responsiveWithScaling {
    return copyWith(
      fontSize: fontSize != null
          ? ScreenUtil.instance.setSp(fontSize!, allowFontScaling: true)
          : null,
    );
  }
}
