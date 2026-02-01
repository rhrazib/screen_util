import 'package:flutter/material.dart';
import 'screen_util.dart';

/// Responsive breakpoints for different screen sizes
class Breakpoints {
  /// Mobile breakpoint (< 600dp)
  static const double mobile = 600;

  /// Tablet breakpoint (600dp - 900dp)
  static const double tablet = 900;

  /// Desktop breakpoint (>= 900dp)
  static const double desktop = 1200;

  /// Large desktop breakpoint (>= 1200dp)
  static const double largeDesktop = 1536;

  /// Small mobile breakpoint (< 360dp)
  static const double smallMobile = 360;

  /// Large mobile breakpoint (>= 400dp)
  static const double largeMobile = 400;

  /// Check if current screen is mobile
  static bool get isMobile => ScreenUtil.instance.screenWidth < mobile;

  /// Check if current screen is tablet
  static bool get isTablet =>
      ScreenUtil.instance.screenWidth >= mobile &&
      ScreenUtil.instance.screenWidth < desktop;

  /// Check if current screen is desktop
  static bool get isDesktop => ScreenUtil.instance.screenWidth >= desktop;

  /// Check if current screen is large desktop
  static bool get isLargeDesktop =>
      ScreenUtil.instance.screenWidth >= largeDesktop;

  /// Check if current screen is small mobile
  static bool get isSmallMobile =>
      ScreenUtil.instance.screenWidth < smallMobile;

  /// Check if current screen is large mobile
  static bool get isLargeMobile =>
      ScreenUtil.instance.screenWidth >= largeMobile &&
      ScreenUtil.instance.screenWidth < mobile;

  /// Get current breakpoint name
  static String get currentBreakpoint {
    final width = ScreenUtil.instance.screenWidth;
    if (width >= largeDesktop) return 'largeDesktop';
    if (width >= desktop) return 'desktop';
    if (width >= mobile) return 'tablet';
    if (width >= largeMobile) return 'largeMobile';
    if (width >= smallMobile) return 'mobile';
    return 'smallMobile';
  }
}

/// Media query helper utilities
class MediaQueryHelper {
  final BuildContext context;

  MediaQueryHelper(this.context);

  /// Get screen size
  Size get screenSize => MediaQuery.of(context).size;

  /// Get screen width
  double get width => MediaQuery.of(context).size.width;

  /// Get screen height
  double get height => MediaQuery.of(context).size.height;

  /// Get orientation
  Orientation get orientation => MediaQuery.of(context).orientation;

  /// Is landscape
  bool get isLandscape => orientation == Orientation.landscape;

  /// Is portrait
  bool get isPortrait => orientation == Orientation.portrait;

  /// Get device pixel ratio
  double get devicePixelRatio => MediaQuery.of(context).devicePixelRatio;

  /// Get text scale factor
  double get textScaleFactor => MediaQuery.of(context).textScaleFactor;

  /// Get padding (safe area)
  EdgeInsets get padding => MediaQuery.of(context).padding;

  /// Get view insets
  EdgeInsets get viewInsets => MediaQuery.of(context).viewInsets;

  /// Get view padding
  EdgeInsets get viewPadding => MediaQuery.of(context).viewPadding;

  /// Get system gesture insets
  EdgeInsets get systemGestureInsets =>
      MediaQuery.of(context).systemGestureInsets;

  /// Is keyboard visible
  bool get isKeyboardVisible => viewInsets.bottom > 0;

  /// Keyboard height
  double get keyboardHeight => viewInsets.bottom;

  /// Status bar height
  double get statusBarHeight => padding.top;

  /// Bottom navigation bar height
  double get bottomBarHeight => padding.bottom;

  /// Get platform brightness
  Brightness get brightness => MediaQuery.of(context).platformBrightness;

  /// Is dark mode
  bool get isDarkMode => brightness == Brightness.dark;

  /// Is light mode
  bool get isLightMode => brightness == Brightness.light;

  /// Get aspect ratio
  double get aspectRatio => width / height;

  /// Is wide screen (aspect ratio > 1.5)
  bool get isWideScreen => aspectRatio > 1.5;

  /// Is narrow screen (aspect ratio < 0.7)
  bool get isNarrowScreen => aspectRatio < 0.7;

  /// Get diagonal size in inches (approximate)
  double get diagonalInches {
    final widthInches = width / (devicePixelRatio * 160);
    final heightInches = height / (devicePixelRatio * 160);
    return (widthInches * widthInches + heightInches * heightInches).abs();
  }
}

/// Responsive value that changes based on screen size
class ResponsiveValue<T> {
  final T phone;
  final T? tablet;
  final T? desktop;

  const ResponsiveValue({
    required this.phone,
    this.tablet,
    this.desktop,
  });

  /// Get value based on current screen size
  T get value {
    if (ScreenUtil.instance.isDesktop && desktop != null) {
      return desktop!;
    } else if (ScreenUtil.instance.isTablet && tablet != null) {
      return tablet!;
    } else {
      return phone;
    }
  }

  /// Get value based on context
  T getValue(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= Breakpoints.desktop && desktop != null) {
      return desktop!;
    } else if (width >= Breakpoints.mobile && tablet != null) {
      return tablet!;
    } else {
      return phone;
    }
  }
}

/// Responsive dimension value
class ResponsiveDimension {
  final double phone;
  final double? tablet;
  final double? desktop;

  const ResponsiveDimension({
    required this.phone,
    this.tablet,
    this.desktop,
  });

  /// Get scaled value based on current screen size
  double get value {
    double baseValue;
    if (ScreenUtil.instance.isDesktop && desktop != null) {
      baseValue = desktop!;
    } else if (ScreenUtil.instance.isTablet && tablet != null) {
      baseValue = tablet!;
    } else {
      baseValue = phone;
    }
    return ScreenUtil.instance.setWidth(baseValue);
  }
}

/// Extension on BuildContext for breakpoint checks
extension BreakpointContext on BuildContext {
  /// Is mobile screen
  bool get isMobile => MediaQuery.of(this).size.width < Breakpoints.mobile;

  /// Is tablet screen
  bool get isTablet =>
      MediaQuery.of(this).size.width >= Breakpoints.mobile &&
      MediaQuery.of(this).size.width < Breakpoints.desktop;

  /// Is desktop screen
  bool get isDesktop =>
      MediaQuery.of(this).size.width >= Breakpoints.desktop;

  /// Is large desktop screen
  bool get isLargeDesktop =>
      MediaQuery.of(this).size.width >= Breakpoints.largeDesktop;

  /// Is small mobile screen
  bool get isSmallMobile =>
      MediaQuery.of(this).size.width < Breakpoints.smallMobile;

  /// Get media query helper
  MediaQueryHelper get mq => MediaQueryHelper(this);

  /// Responsive value selector
  T responsive<T>({
    required T phone,
    T? tablet,
    T? desktop,
  }) {
    if (isDesktop && desktop != null) {
      return desktop;
    } else if (isTablet && tablet != null) {
      return tablet;
    } else {
      return phone;
    }
  }

  /// Responsive dimension selector (with auto-scaling)
  double responsiveDimension({
    required double phone,
    double? tablet,
    double? desktop,
  }) {
    double baseValue;
    if (isDesktop && desktop != null) {
      baseValue = desktop;
    } else if (isTablet && tablet != null) {
      baseValue = tablet;
    } else {
      baseValue = phone;
    }
    return ScreenUtil.instance.setWidth(baseValue);
  }
}

/// Conditional widget based on breakpoint
class ConditionalWidget extends StatelessWidget {
  final bool Function() condition;
  final Widget child;
  final Widget? fallback;

  const ConditionalWidget({
    Key? key,
    required this.condition,
    required this.child,
    this.fallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return condition() ? child : (fallback ?? const SizedBox.shrink());
  }
}

/// Show widget only on mobile
class MobileOnly extends StatelessWidget {
  final Widget child;
  final Widget? fallback;

  const MobileOnly({
    Key? key,
    required this.child,
    this.fallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConditionalWidget(
      condition: () => context.isMobile,
      child: child,
      fallback: fallback,
    );
  }
}

/// Show widget only on tablet
class TabletOnly extends StatelessWidget {
  final Widget child;
  final Widget? fallback;

  const TabletOnly({
    Key? key,
    required this.child,
    this.fallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConditionalWidget(
      condition: () => context.isTablet,
      child: child,
      fallback: fallback,
    );
  }
}

/// Show widget only on desktop
class DesktopOnly extends StatelessWidget {
  final Widget child;
  final Widget? fallback;

  const DesktopOnly({
    Key? key,
    required this.child,
    this.fallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConditionalWidget(
      condition: () => context.isDesktop,
      child: child,
      fallback: fallback,
    );
  }
}

/// Hide widget on mobile
class HideOnMobile extends StatelessWidget {
  final Widget child;

  const HideOnMobile({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConditionalWidget(
      condition: () => !context.isMobile,
      child: child,
    );
  }
}

/// Hide widget on tablet
class HideOnTablet extends StatelessWidget {
  final Widget child;

  const HideOnTablet({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConditionalWidget(
      condition: () => !context.isTablet,
      child: child,
    );
  }
}

/// Hide widget on desktop
class HideOnDesktop extends StatelessWidget {
  final Widget child;

  const HideOnDesktop({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConditionalWidget(
      condition: () => !context.isDesktop,
      child: child,
    );
  }
}
