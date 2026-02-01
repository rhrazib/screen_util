import 'package:flutter/widgets.dart';
import 'dart:math' as math;

/// Main ScreenUtil class for handling responsive design
/// Initialize once in your app with ScreenUtil.init(context)
class ScreenUtil {
  static ScreenUtil? _instance;
  static const int defaultWidth = 375;
  static const int defaultHeight = 812;
  static const bool allowFontScaling = false;

  /// Design draft width
  late double _designWidth;

  /// Design draft height
  late double _designHeight;

  /// Device's pixel density
  late double _pixelRatio;

  /// Actual screen width
  late double _screenWidth;

  /// Actual screen height
  late double _screenHeight;

  /// Status bar height
  late double _statusBarHeight;

  /// Bottom safe area height
  late double _bottomBarHeight;

  /// App bar height
  late double _appBarHeight;

  /// Text scale factor
  late double _textScaleFactor;

  /// Device orientation
  late Orientation _orientation;

  ScreenUtil._();

  /// Initialize ScreenUtil
  /// Must be called before using any responsive methods
  /// 
  /// Example:
  /// ```dart
  /// @override
  /// Widget build(BuildContext context) {
  ///   ScreenUtil.init(context, designWidth: 375, designHeight: 812);
  ///   return YourWidget();
  /// }
  /// ```
  static void init(
      BuildContext context, {
        double designWidth = 375,
        double designHeight = 812,
      }) {
    final mediaQuery = MediaQuery.of(context);
    _instance ??= ScreenUtil._();
    _instance!._designWidth = designWidth;
    _instance!._designHeight = designHeight;
    _instance!._pixelRatio = mediaQuery.devicePixelRatio;
    _instance!._screenWidth = mediaQuery.size.width;
    _instance!._screenHeight = mediaQuery.size.height;
    _instance!._statusBarHeight = mediaQuery.padding.top;
    _instance!._bottomBarHeight = mediaQuery.padding.bottom;
    _instance!._appBarHeight = 56.0; // Default AppBar height
    _instance!._textScaleFactor = mediaQuery.textScaleFactor;
    _instance!._orientation = mediaQuery.orientation;
  }

  static ScreenUtil get instance {
    if (_instance == null) {
      throw Exception(
        'ScreenUtil not initialized. Call ScreenUtil.init(context) first.',
      );
    }
    return _instance!;
  }

  // Getters for screen properties

  /// Screen width in logical pixels
  double get screenWidth => _screenWidth;

  /// Screen height in logical pixels
  double get screenHeight => _screenHeight;

  /// Screen width in physical pixels
  double get screenWidthPx => _screenWidth * _pixelRatio;

  /// Screen height in physical pixels
  double get screenHeightPx => _screenHeight * _pixelRatio;

  /// Ratio of actual width to design width
  double get scaleWidth => _screenWidth / _designWidth;

  /// Ratio of actual height to design height
  double get scaleHeight => _screenHeight / _designHeight;

  /// Ratio of text scale
  double get scaleText => math.min(scaleWidth, scaleHeight);

  /// Status bar height
  double get statusBarHeight => _statusBarHeight;

  /// Bottom safe area height
  double get bottomBarHeight => _bottomBarHeight;

  /// App bar height
  double get appBarHeight => _appBarHeight;

  /// Pixel ratio
  double get pixelRatio => _pixelRatio;

  /// Text scale factor
  double get textScaleFactor => _textScaleFactor;

  /// Current orientation
  Orientation get orientation => _orientation;

  /// Is landscape mode
  bool get isLandscape => _orientation == Orientation.landscape;

  /// Is portrait mode
  bool get isPortrait => _orientation == Orientation.portrait;

  // Responsive sizing methods

  /// Set width based on design draft
  ///
  /// [width] - Width value from design draft
  /// Returns proportional width for current device
  double setWidth(num width) => width * scaleWidth;

  /// Set height based on design draft
  ///
  /// [height] - Height value from design draft
  /// Returns proportional height for current device
  double setHeight(num height) => height * scaleHeight;

  /// Set font size based on design draft
  ///
  /// [fontSize] - Font size from design draft
  /// [allowFontScaling] - Whether to respect system font scaling
  /// Returns proportional font size for current device
  double setSp(num fontSize, {bool allowFontScaling = ScreenUtil.allowFontScaling}) {
    final scaledFontSize = fontSize * scaleText;
    return allowFontScaling ? scaledFontSize * _textScaleFactor : scaledFontSize;
  }

  /// Set size using the smaller of width/height ratio
  /// Useful for square elements like icons
  ///
  /// [size] - Size value from design draft
  /// Returns proportional size for current device
  double setSize(num size) => size * math.min(scaleWidth, scaleHeight);

  /// Set radius with proper scaling
  ///
  /// [radius] - Radius value from design draft
  /// Returns proportional radius for current device
  double radius(num radius) => radius * scaleText;

  // Device type detection

  /// Is phone (width < 600dp)
  bool get isPhone => _screenWidth < 600;

  /// Is tablet (600dp <= width < 900dp)
  bool get isTablet => _screenWidth >= 600 && _screenWidth < 900;

  /// Is desktop (width >= 900dp)
  bool get isDesktop => _screenWidth >= 900;

  /// Is small phone (width < 360dp)
  bool get isSmallPhone => _screenWidth < 360;

  /// Is large phone (width >= 400dp)
  bool get isLargePhone => _screenWidth >= 400;

  // Percentage-based sizing

  /// Get percentage of screen width
  ///
  /// [percent] - Percentage value (0-100)
  /// Returns pixel value
  double widthPercent(num percent) => (_screenWidth * percent) / 100;

  /// Get percentage of screen height
  ///
  /// [percent] - Percentage value (0-100)
  /// Returns pixel value
  double heightPercent(num percent) => (_screenHeight * percent) / 100;

  /// Get usable screen height (excluding status bar and bottom bar)
  double get usableHeight => _screenHeight - _statusBarHeight - _bottomBarHeight;

  /// Get usable screen height excluding app bar
  double get contentHeight => usableHeight - _appBarHeight;

  // Static convenience methods for easy access

  static double w(num width) => instance.setWidth(width);
  static double h(num height) => instance.setHeight(height);
  static double sp(num fontSize, {bool allowFontScaling = ScreenUtil.allowFontScaling}) =>
      instance.setSp(fontSize, allowFontScaling: allowFontScaling);
  static double r(num radius) => instance.radius(radius);
  static double size(num size) => instance.setSize(size);

  // Shorthand static getters
  static double get sw => instance.screenWidth;
  static double get sh => instance.screenHeight;
  static double get pr => instance.pixelRatio;
  static double get statusBar => instance.statusBarHeight;
  static double get bottomBar => instance.bottomBarHeight;
  static bool get tablet => instance.isTablet;
  static bool get phone => instance.isPhone;
  static bool get desktop => instance.isDesktop;
}

/// Extension on num for convenient responsive sizing
extension ResponsiveNum on num {
  /// Width responsive
  double get w => ScreenUtil.instance.setWidth(this);

  /// Height responsive
  double get h => ScreenUtil.instance.setHeight(this);

  /// Font size responsive
  double get sp => ScreenUtil.instance.setSp(this);

  /// Font size responsive with scaling
  double get spScale => ScreenUtil.instance.setSp(this, allowFontScaling: true);

  /// Radius responsive
  double get r => ScreenUtil.instance.radius(this);

  /// Size responsive (uses minimum scale)
  double get s => ScreenUtil.instance.setSize(this);

  /// Percentage of screen width
  double get wp => ScreenUtil.instance.widthPercent(this);

  /// Percentage of screen height
  double get hp => ScreenUtil.instance.heightPercent(this);
}

/// Extension on BuildContext for responsive utilities
extension ResponsiveContext on BuildContext {
  /// Get ScreenUtil instance
  ScreenUtil get screenUtil => ScreenUtil.instance;

  /// Screen width
  double get screenWidth => MediaQuery.of(this).size.width;

  /// Screen height
  double get screenHeight => MediaQuery.of(this).size.height;

  /// Is landscape
  bool get isLandscape => MediaQuery.of(this).orientation == Orientation.landscape;

  /// Is portrait
  bool get isPortrait => MediaQuery.of(this).orientation == Orientation.portrait;

  /// Status bar height
  double get statusBarHeight => MediaQuery.of(this).padding.top;

  /// Bottom bar height
  double get bottomBarHeight => MediaQuery.of(this).padding.bottom;

  /// Is keyboard visible
  bool get isKeyboardVisible => MediaQuery.of(this).viewInsets.bottom > 0;

  /// Keyboard height
  double get keyboardHeight => MediaQuery.of(this).viewInsets.bottom;

  /// Device pixel ratio
  double get devicePixelRatio => MediaQuery.of(this).devicePixelRatio;

  /// Text scale factor
  double get textScaleFactor => MediaQuery.of(this).textScaleFactor;

  /// Safe area padding
  EdgeInsets get safePadding => MediaQuery.of(this).padding;

  /// View insets
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;
}