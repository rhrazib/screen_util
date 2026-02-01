import 'package:flutter/material.dart';
import 'screen_util.dart';

/// Responsive spacing utilities
class ResponsiveSpacing {
  /// Extra small spacing (4dp)
  static double get xs => ScreenUtil.instance.setWidth(4);

  /// Small spacing (8dp)
  static double get sm => ScreenUtil.instance.setWidth(8);

  /// Medium spacing (16dp)
  static double get md => ScreenUtil.instance.setWidth(16);

  /// Large spacing (24dp)
  static double get lg => ScreenUtil.instance.setWidth(24);

  /// Extra large spacing (32dp)
  static double get xl => ScreenUtil.instance.setWidth(32);

  /// Extra extra large spacing (48dp)
  static double get xxl => ScreenUtil.instance.setWidth(48);

  /// Custom spacing
  static double custom(double value) => ScreenUtil.instance.setWidth(value);

  /// Horizontal spacing widget
  static Widget horizontal(double width) => SizedBox(width: ScreenUtil.instance.setWidth(width));

  /// Vertical spacing widget
  static Widget vertical(double height) => SizedBox(height: ScreenUtil.instance.setHeight(height));
}

/// Responsive padding utilities
class ResponsivePadding {
  /// All sides padding
  static EdgeInsets all(double value) => EdgeInsets.all(ScreenUtil.instance.setWidth(value));

  /// Symmetric padding
  static EdgeInsets symmetric({double horizontal = 0, double vertical = 0}) {
    return EdgeInsets.symmetric(
      horizontal: ScreenUtil.instance.setWidth(horizontal),
      vertical: ScreenUtil.instance.setHeight(vertical),
    );
  }

  /// Custom padding
  static EdgeInsets only({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) {
    return EdgeInsets.only(
      left: ScreenUtil.instance.setWidth(left),
      top: ScreenUtil.instance.setHeight(top),
      right: ScreenUtil.instance.setWidth(right),
      bottom: ScreenUtil.instance.setHeight(bottom),
    );
  }

  /// Horizontal padding
  static EdgeInsets horizontal(double value) => EdgeInsets.symmetric(
        horizontal: ScreenUtil.instance.setWidth(value),
      );

  /// Vertical padding
  static EdgeInsets vertical(double value) => EdgeInsets.symmetric(
        vertical: ScreenUtil.instance.setHeight(value),
      );

  /// Pre-defined padding sizes
  static EdgeInsets get xs => all(4);
  static EdgeInsets get sm => all(8);
  static EdgeInsets get md => all(16);
  static EdgeInsets get lg => all(24);
  static EdgeInsets get xl => all(32);
  static EdgeInsets get xxl => all(48);
}

/// Responsive margin utilities
class ResponsiveMargin {
  /// All sides margin
  static EdgeInsets all(double value) => EdgeInsets.all(ScreenUtil.instance.setWidth(value));

  /// Symmetric margin
  static EdgeInsets symmetric({double horizontal = 0, double vertical = 0}) {
    return EdgeInsets.symmetric(
      horizontal: ScreenUtil.instance.setWidth(horizontal),
      vertical: ScreenUtil.instance.setHeight(vertical),
    );
  }

  /// Custom margin
  static EdgeInsets only({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) {
    return EdgeInsets.only(
      left: ScreenUtil.instance.setWidth(left),
      top: ScreenUtil.instance.setHeight(top),
      right: ScreenUtil.instance.setWidth(right),
      bottom: ScreenUtil.instance.setHeight(bottom),
    );
  }

  /// Horizontal margin
  static EdgeInsets horizontal(double value) => EdgeInsets.symmetric(
        horizontal: ScreenUtil.instance.setWidth(value),
      );

  /// Vertical margin
  static EdgeInsets vertical(double value) => EdgeInsets.symmetric(
        vertical: ScreenUtil.instance.setHeight(value),
      );

  /// Pre-defined margin sizes
  static EdgeInsets get xs => all(4);
  static EdgeInsets get sm => all(8);
  static EdgeInsets get md => all(16);
  static EdgeInsets get lg => all(24);
  static EdgeInsets get xl => all(32);
  static EdgeInsets get xxl => all(48);
}

/// Responsive border radius utilities
class ResponsiveBorderRadius {
  /// All corners border radius
  static BorderRadius all(double radius) => BorderRadius.circular(
        ScreenUtil.instance.radius(radius),
      );

  /// Circular border radius
  static BorderRadius circular(double radius) => BorderRadius.circular(
        ScreenUtil.instance.radius(radius),
      );

  /// Custom border radius
  static BorderRadius only({
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0,
  }) {
    return BorderRadius.only(
      topLeft: Radius.circular(ScreenUtil.instance.radius(topLeft)),
      topRight: Radius.circular(ScreenUtil.instance.radius(topRight)),
      bottomLeft: Radius.circular(ScreenUtil.instance.radius(bottomLeft)),
      bottomRight: Radius.circular(ScreenUtil.instance.radius(bottomRight)),
    );
  }

  /// Top border radius
  static BorderRadius top(double radius) => BorderRadius.vertical(
        top: Radius.circular(ScreenUtil.instance.radius(radius)),
      );

  /// Bottom border radius
  static BorderRadius bottom(double radius) => BorderRadius.vertical(
        bottom: Radius.circular(ScreenUtil.instance.radius(radius)),
      );

  /// Left border radius
  static BorderRadius left(double radius) => BorderRadius.horizontal(
        left: Radius.circular(ScreenUtil.instance.radius(radius)),
      );

  /// Right border radius
  static BorderRadius right(double radius) => BorderRadius.horizontal(
        right: Radius.circular(ScreenUtil.instance.radius(radius)),
      );

  /// Pre-defined border radius sizes
  static BorderRadius get xs => circular(4);
  static BorderRadius get sm => circular(8);
  static BorderRadius get md => circular(12);
  static BorderRadius get lg => circular(16);
  static BorderRadius get xl => circular(24);
  static BorderRadius get xxl => circular(32);
  static BorderRadius get full => circular(9999);
}

/// Responsive layout builder based on screen size
class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, DeviceType deviceType) builder;

  const ResponsiveBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        DeviceType deviceType;
        if (ScreenUtil.phone) {
          deviceType = DeviceType.phone;
        } else if (ScreenUtil.tablet) {
          deviceType = DeviceType.tablet;
        } else {
          deviceType = DeviceType.desktop;
        }
        return builder(context, deviceType);
      },
    );
  }
}

/// Device type enumeration
enum DeviceType {
  phone,
  tablet,
  desktop,
}

/// Responsive widget that shows different layouts for different devices
class ResponsiveLayout extends StatelessWidget {
  final Widget phone;
  final Widget? tablet;
  final Widget? desktop;

  const ResponsiveLayout({
    Key? key,
    required this.phone,
    this.tablet,
    this.desktop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (ScreenUtil.desktop && desktop != null) {
          return desktop!;
        } else if (ScreenUtil.tablet && tablet != null) {
          return tablet!;
        } else {
          return phone;
        }
      },
    );
  }
}

/// Responsive grid view
class ResponsiveGridView extends StatelessWidget {
  final List<Widget> children;
  final double spacing;
  final int phoneColumns;
  final int tabletColumns;
  final int desktopColumns;
  final double? childAspectRatio;
  final ScrollPhysics? physics;

  const ResponsiveGridView({
    Key? key,
    required this.children,
    this.spacing = 16,
    this.phoneColumns = 2,
    this.tabletColumns = 3,
    this.desktopColumns = 4,
    this.childAspectRatio,
    this.physics,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int columns;
    if (ScreenUtil.desktop) {
      columns = desktopColumns;
    } else if (ScreenUtil.tablet) {
      columns = tabletColumns;
    } else {
      columns = phoneColumns;
    }

    return GridView.count(
      crossAxisCount: columns,
      crossAxisSpacing: ScreenUtil.instance.setWidth(spacing),
      mainAxisSpacing: ScreenUtil.instance.setHeight(spacing),
      childAspectRatio: childAspectRatio ?? 1.0,
      physics: physics,
      children: children,
    );
  }
}

/// Responsive container with auto-sizing
class ResponsiveContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? color;
  final Decoration? decoration;
  final AlignmentGeometry? alignment;

  const ResponsiveContainer({
    Key? key,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.color,
    this.decoration,
    this.alignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width != null ? ScreenUtil.instance.setWidth(width!) : null,
      height: height != null ? ScreenUtil.instance.setHeight(height!) : null,
      padding: padding,
      margin: margin,
      color: color,
      decoration: decoration,
      alignment: alignment,
      child: child,
    );
  }
}

/// Responsive SizedBox
class ResponsiveSizedBox extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget? child;

  const ResponsiveSizedBox({
    Key? key,
    this.width,
    this.height,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width != null ? ScreenUtil.instance.setWidth(width!) : null,
      height: height != null ? ScreenUtil.instance.setHeight(height!) : null,
      child: child,
    );
  }
}

/// Orientation builder
class OrientationResponsive extends StatelessWidget {
  final Widget portrait;
  final Widget landscape;

  const OrientationResponsive({
    Key? key,
    required this.portrait,
    required this.landscape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return orientation == Orientation.portrait ? portrait : landscape;
      },
    );
  }
}
