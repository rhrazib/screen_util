# auto_screen

# Auto Screen - Complete Responsive Flutter Package

A comprehensive Flutter package for building responsive UIs that work seamlessly across all devices (phones, tablets, and desktops). This package provides utilities for responsive sizing, text scaling, layouts, and breakpoints.

## 🌟 Features

- ✅ **Responsive Sizing** - Automatically scale widgets based on screen size
- ✅ **Responsive Text** - Scale text while maintaining readability
- ✅ **Device Detection** - Detect phones, tablets, and desktops
- ✅ **Breakpoints** - Build different layouts for different screen sizes
- ✅ **Extensions** - Convenient extensions for numbers and BuildContext
- ✅ **Responsive Widgets** - Pre-built responsive components
- ✅ **Layout Utilities** - Spacing, padding, margin, and border radius
- ✅ **Orientation Support** - Handle landscape and portrait modes
- ✅ **Safe Area Support** - Handle notches and system bars
- ✅ **Zero Dependencies** - Only depends on Flutter SDK

## 📦 Installation
Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  auto_screen: ^0.0.2
```

Then run:

```bash
flutter pub get
```

```dart
import 'package:auto_screen/auto_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialize with your design dimensions (e.g., from Figma/Adobe XD)
    ScreenUtil.init(
      context,
      designWidth: 375,   // Your design width
      designHeight: 812,  // Your design height
    );
    
    return MaterialApp(
      home: HomePage(),
    );
  }
}
```
### 2. Use Responsive Sizing
// Using extensions (recommended)

Container(
  width: 100.w,
  height: 80.h,
  padding: EdgeInsets.all(16.w),
  child: Text(
    'Hello World',
    style: TextStyle(fontSize: 18.sp),
  ),
);
```

## 📖 Complete Usage Guide

### Responsive Sizing Extensions

The easiest way to make your UI responsive:

```dart
// Width responsive
100.w;    // Scales based on screen width

// Height responsive
200.h;    // Scales based on screen height

// Font size responsive
16.sp;    // Scales font size (no system scaling)
16.spScale;  // Scales font size (with system scaling)

// Radius responsive
12.r;     // Scales border radius

// Size responsive (uses minimum scale)
50.s;     // Good for square elements like icons

// Percentage of screen width
80.wp;    // 80% of screen width

// Percentage of screen height
50.hp;    // 50% of screen height
```

### Responsive Text Styles

Pre-defined text styles that adapt to screen size:

Text('Display', style: ResponsiveText.display());
Text('Heading 1', style: ResponsiveText.h1());
Text('Heading 2', style: ResponsiveText.h2());
Text('Heading 3', style: ResponsiveText.h3());
Text('Heading 4', style: ResponsiveText.h4());
Text('Heading 5', style: ResponsiveText.h5());
Text('Heading 6', style: ResponsiveText.h6());
Text('Body Large', style: ResponsiveText.bodyLarge());
Text('Body Medium', style: ResponsiveText.bodyMedium());
Text('Body Small', style: ResponsiveText.bodySmall());
Text('Caption', style: ResponsiveText.caption());
Text('Button', style: ResponsiveText.button());
Text('Label', style: ResponsiveText.label());

// Custom responsive text style
Text(
'Custom',
style: ResponsiveText.style(
fontSize: 18,
fontWeight: FontWeight.bold,
color: Colors.blue,
),
);
```


### Responsive Spacing

```dart
// Pre-defined spacing
ResponsiveSpacing.xs;    // 4dp
ResponsiveSpacing.sm;    // 8dp
ResponsiveSpacing.md;    // 16dp
ResponsiveSpacing.lg;    // 24dp
ResponsiveSpacing.xl;    // 32dp
ResponsiveSpacing.xxl;   // 48dp

// Custom spacing
ResponsiveSpacing.custom(20);

// Spacing widgets
ResponsiveSpacing.horizontal(16);  // Horizontal spacing widget
ResponsiveSpacing.vertical(16);    // Vertical spacing widget
```


### Responsive Padding


Container(padding: ResponsivePadding.xs);    // All sides 4dp
Container(padding: ResponsivePadding.sm);    // All sides 8dp
Container(padding: ResponsivePadding.md);    // All sides 16dp
Container(padding: ResponsivePadding.lg);    // All sides 24dp

// Custom padding
Container(
padding: ResponsivePadding.all(20),
);

Container(
padding: ResponsivePadding.symmetric(
horizontal: 16,
vertical: 8,
),
);

Container(
padding: ResponsivePadding.only(
left: 16,
top: 8,
right: 16,
bottom: 8,
),
);
```


### Responsive Margin

```dart
// Same API as ResponsivePadding
Container(margin: ResponsiveMargin.md);
Container(margin: ResponsiveMargin.all(20));
Container(margin: ResponsiveMargin.symmetric(horizontal: 16));
Container(margin: ResponsiveMargin.only(top: 16, bottom: 8));
```

### Responsive Border Radius


// Pre-defined border radius
Container(
decoration: BoxDecoration(
borderRadius: ResponsiveBorderRadius.xs,    // 4dp
),
);
Container(
decoration: BoxDecoration(
borderRadius: ResponsiveBorderRadius.sm,    // 8dp
),
);
Container(
decoration: BoxDecoration(
borderRadius: ResponsiveBorderRadius.md,    // 12dp
),
);

// Custom border radius
Container(
decoration: BoxDecoration(
borderRadius: ResponsiveBorderRadius.circular(20),
),
);

// Only specific corners
Container(
decoration: BoxDecoration(
borderRadius: ResponsiveBorderRadius.only(
topLeft: 16,
topRight: 16,
),
),
);

// Top/Bottom/Left/Right
ResponsiveBorderRadius.top(16);
ResponsiveBorderRadius.bottom(16);
ResponsiveBorderRadius.left(16);
ResponsiveBorderRadius.right(16);
```

### Device Detection

```dart
// Check device type
if (ScreenUtil.phone) {
// Phone layout
}

if (ScreenUtil.tablet) {
// Tablet layout
}

if (ScreenUtil.desktop) {
// Desktop layout
}

// More specific checks
if (ScreenUtil.instance.isSmallPhone) {
// Small phone (< 360dp)
}

if (ScreenUtil.instance.isLargePhone) {
// Large phone (>= 400dp)
}

// Get screen info
double width = ScreenUtil.sw;           // Screen width
double height = ScreenUtil.sh;          // Screen height
double statusBar = ScreenUtil.statusBar;
double bottomBar = ScreenUtil.bottomBar;
double pixelRatio = ScreenUtil.pr;

// Orientation
bool isLandscape = ScreenUtil.instance.isLandscape;
bool isPortrait = ScreenUtil.instance.isPortrait;
```

### Responsive Layouts

#### Different layouts for different devices:


ResponsiveLayout(
phone: PhoneLayout(),
tablet: TabletLayout(),
desktop: DesktopLayout(),
);
```

#### Responsive Builder:

```dart
ResponsiveBuilder(
builder: (context, deviceType) {
switch (deviceType) {
case DeviceType.phone:
return PhoneWidget();
case DeviceType.tablet:
return TabletWidget();
case DeviceType.desktop:
return DesktopWidget();
}
},
)
```

### Breakpoint-Based Widgets


// Show only on specific devices
MobileOnly(child: Text('Mobile only'));
TabletOnly(child: Text('Tablet only'));
DesktopOnly(child: Text('Desktop only'));

// Hide on specific devices
HideOnMobile(child: Text('Hidden on mobile'));
HideOnTablet(child: Text('Hidden on tablet'));
HideOnDesktop(child: Text('Hidden on desktop'));
```

### Orientation-Based Layouts

```dart
OrientationResponsive(
portrait: PortraitLayout(),
landscape: LandscapeLayout(),
);
```

### Responsive Grid


ResponsiveGridView(
phoneColumns: 2,      // 2 columns on phone
tabletColumns: 3,     // 3 columns on tablet
desktopColumns: 4,    // 4 columns on desktop
spacing: 16,
children: [
// Your grid items
],
);
```

### Context Extensions

```dart
// In any widget with BuildContext
Widget build(BuildContext context) {
  // Get screen dimensions
  double width = context.screenWidth;
  double height = context.screenHeight;

  // Check orientation
  bool isLandscape = context.isLandscape;

  // Check device type
  bool isMobile = context.isMobile;
  bool isTablet = context.isTablet;
  bool isDesktop = context.isDesktop;

  // Get safe area padding
  EdgeInsets padding = context.safePadding;

  // Check keyboard visibility
  bool isKeyboardVisible = context.isKeyboardVisible;
  double keyboardHeight = context.keyboardHeight;

  // Responsive value selection
  int columns = context.responsive(
    phone: 2,
    tablet: 3,
    desktop: 4,
  );

  return Container();
}
```

### Breakpoints


// Check current breakpoint
if (Breakpoints.isMobile) {
// Mobile (< 600dp)
}

if (Breakpoints.isTablet) {
// Tablet (600dp - 900dp)
}

if (Breakpoints.isDesktop) {
// Desktop (>= 900dp)
}

// Get current breakpoint name
String breakpoint = Breakpoints.currentBreakpoint;
// Returns: 'smallMobile', 'mobile', 'largeMobile', 'tablet', 'desktop', or 'largeDesktop'
```

### Responsive Values

```dart
// Define responsive values
final responsiveValue = ResponsiveValue<int>(
  phone: 2,
  tablet: 3,
  desktop: 4,
);

int columns = responsiveValue.value;

// Responsive dimensions
final responsiveDimension = ResponsiveDimension(
  phone: 100,
  tablet: 150,
  desktop: 200,
);

double width = responsiveDimension.value;
```

## 🎯 Best Practices

### 1. Initialize Once

Always initialize `ScreenUtil` once at the app level:

```dart
@override
Widget build(BuildContext context) {
  ScreenUtil.init(context, designWidth: 375, designHeight: 812);
  return MaterialApp();
}
```

### 2. Use Design Dimensions

Use the exact dimensions from your design files (Figma, Adobe XD, etc.):


// If your design is 375x812
ScreenUtil.init(context, designWidth: 375, designHeight: 812);

// Then use the exact values from design
Container(
width: 200.w,  // If design shows 200px width
height: 100.h, // If design shows 100px height
);
```

### 3. Choose the Right Extension

- `.w` - For widths (horizontal measurements)
- `.h` - For heights (vertical measurements)
- `.sp` - For font sizes
- `.r` - For border radius
- `.s` - For square elements (icons, avatars)

### 4. System Font Scaling

Decide whether to respect system font scaling:

```dart
// Don't respect system scaling (recommended for most cases)
Text('Hello', style: TextStyle(fontSize: 16.sp));

// Respect system scaling (for accessibility)
Text('Hello', style: TextStyle(fontSize: 16.spScale));
```

### 5. Breakpoints Over Device Detection

Prefer breakpoints over device type checks:


// ✅ Good - based on actual screen size
if (context.isMobile) { }

// ❌ Avoid - based on platform
if (Platform.isAndroid) { }
```

## 📱 Example App

Check out the complete example in `example_usage.dart` for a full demonstration of all features.

## 🔧 Customization

### Custom Breakpoints

You can define your own breakpoints:

```dart
class MyBreakpoints {
  static const double phone = 500;
  static const double tablet = 800;
  static const double desktop = 1100;
}
```

### Custom Text Styles

Create your own text style utilities:

```dart
class MyTextStyles {
  static TextStyle title() => ResponsiveText.style(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    fontFamily: 'MyCustomFont',
  );
}
```

## 🎨 Common Patterns

### Responsive Card


Container(
width: 300.w,
padding: ResponsivePadding.lg,
margin: ResponsiveMargin.md,
decoration: BoxDecoration(
color: Colors.white,
borderRadius: ResponsiveBorderRadius.md,
boxShadow: [
BoxShadow(
blurRadius: 8.r,
offset: Offset(0, 2.h),
color: Colors.black12,
),
],
),
child: Column(
children: [
Text('Title', style: ResponsiveText.h3()),
ResponsiveSizedBox(height: 8),
Text('Content', style: ResponsiveText.bodyMedium()),
],
),
);
```

### Responsive Button

```dart
Container(
width: double.infinity,
height: 48.h,
margin: ResponsiveMargin.horizontal(16),
child: ElevatedButton(
style: ElevatedButton.styleFrom(
shape: RoundedRectangleBorder(
borderRadius: ResponsiveBorderRadius.sm,
),
),
onPressed: () {},
child: Text(
'Click Me',
style: ResponsiveText.button(color: Colors.white),
),
),
)
```

### Responsive List Item


Container(
height: 80.h,
padding: ResponsivePadding.symmetric(horizontal: 16, vertical: 12),
child: Row(
children: [
Container(
width: 56.s,
height: 56.s,
decoration: BoxDecoration(
color: Colors.blue,
borderRadius: ResponsiveBorderRadius.sm,
),
),
ResponsiveSpacing.horizontal(12),
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
mainAxisAlignment: MainAxisAlignment.center,
children: [
Text('Title', style: ResponsiveText.h5()),
ResponsiveSizedBox(height: 4),
Text('Subtitle', style: ResponsiveText.bodySmall()),
],
),
),
],
),
);
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License.

## 💡 Tips

1. Always initialize ScreenUtil at the app level
2. Use your design file dimensions (from Figma/XD) for initialization
3. Use extensions (.w, .h, .sp) for cleaner code
4. Use pre-defined spacing/padding for consistency
5. Test on multiple devices and orientations
6. Consider accessibility (font scaling)

## 🐛 Troubleshooting

### "ScreenUtil not initialized" error

Make sure you call `ScreenUtil.init(context)` before using any responsive methods.

### Text too small/large

Check that you're using the correct design dimensions in initialization.

### Different results on different devices

This is normal! The package scales based on your design dimensions. If something looks wrong, verify your design file dimensions.

## 📞 Support

For issues and feature requests, please visit the [GitHub repository](https://github.com/yourusername/auto_screen).

---

Made with ❤️ for the Flutter community