import 'package:flutter/material.dart';
import 'package:auto_screen/screen_util.dart';
import 'package:auto_screen/responsive_text.dart';
import 'package:auto_screen/responsive_layout.dart';
import 'package:auto_screen/responsive_breakpoints.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auto Screen Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil - MUST BE CALLED FIRST
    // Use your design dimensions (Figma/XD artboard size)
    ScreenUtil.init(
      context,
      designWidth: 375, // Your design width
      designHeight: 812, // Your design height
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Auto Screen Demo',
          style: ResponsiveText.h4(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Example 1: Responsive Container
            _buildResponsiveContainer(),

            // Example 2: Responsive Text Styles
            _buildResponsiveTextExamples(),

            // Example 3: Responsive Spacing
            _buildResponsiveSpacing(),

            // Example 4: Different Layouts for Different Devices
            _buildResponsiveLayout(),

            // Example 5: Responsive Grid
            _buildResponsiveGrid(),

            // Example 6: Device Detection
            _buildDeviceDetection(),

            // Example 7: Breakpoint-based Widgets
            _buildBreakpointWidgets(),

            // Example 8: Using Extensions
            _buildExtensionExamples(),
          ],
        ),
      ),
    );
  }

  Widget _buildResponsiveContainer() {
    return Container(
      width: 300.w, // Responsive width using extension
      height: 200.h, // Responsive height using extension
      margin: ResponsiveMargin.md,
      padding: ResponsivePadding.lg,
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: ResponsiveBorderRadius.md,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Responsive Container',
            style: ResponsiveText.h3(),
          ),
          ResponsiveSizedBox(height: 8),
          Text(
            'Width: 300w, Height: 200h',
            style: ResponsiveText.bodyMedium(),
          ),
          Text(
            'This container adapts to all screen sizes!',
            style: ResponsiveText.bodySmall(
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResponsiveTextExamples() {
    return Container(
      padding: ResponsivePadding.md,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Display Text', style: ResponsiveText.display()),
          ResponsiveSizedBox(height: 8),
          Text('Heading 1', style: ResponsiveText.h1()),
          Text('Heading 2', style: ResponsiveText.h2()),
          Text('Heading 3', style: ResponsiveText.h3()),
          Text('Body Large', style: ResponsiveText.bodyLarge()),
          Text('Body Medium', style: ResponsiveText.bodyMedium()),
          Text('Body Small', style: ResponsiveText.bodySmall()),
          Text('Caption', style: ResponsiveText.caption()),

          ResponsiveSizedBox(height: 16),

          // Using AdaptiveText for auto-scaling
          AdaptiveText(
            'This text auto-scales based on screen size',
            style: ResponsiveText.h4(),
            maxLines: 2,
          ),
        ],
      ),
    );
  }

  Widget _buildResponsiveSpacing() {
    return Container(
      padding: ResponsivePadding.md,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Responsive Spacing', style: ResponsiveText.h3()),
          ResponsiveSizedBox(height: 8),

          // Pre-defined spacing
          Container(
            padding: ResponsivePadding.xs,
            color: Colors.red.shade100,
            child: Text('Extra Small Padding', style: ResponsiveText.bodySmall()),
          ),
          ResponsiveSpacing.vertical(8),

          Container(
            padding: ResponsivePadding.sm,
            color: Colors.orange.shade100,
            child: Text('Small Padding', style: ResponsiveText.bodySmall()),
          ),
          ResponsiveSpacing.vertical(8),

          Container(
            padding: ResponsivePadding.md,
            color: Colors.yellow.shade100,
            child: Text('Medium Padding', style: ResponsiveText.bodySmall()),
          ),
          ResponsiveSpacing.vertical(8),

          Container(
            padding: ResponsivePadding.lg,
            color: Colors.green.shade100,
            child: Text('Large Padding', style: ResponsiveText.bodySmall()),
          ),
        ],
      ),
    );
  }

  Widget _buildResponsiveLayout() {
    return Container(
      padding: ResponsivePadding.md,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Responsive Layout', style: ResponsiveText.h3()),
          ResponsiveSizedBox(height: 8),

          // Different layouts for different devices
          ResponsiveLayout(
            phone: _buildPhoneLayout(),
            tablet: _buildTabletLayout(),
            desktop: _buildDesktopLayout(),
          ),
        ],
      ),
    );
  }

  Widget _buildPhoneLayout() {
    return Container(
      padding: ResponsivePadding.md,
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: ResponsiveBorderRadius.sm,
      ),
      child: Column(
        children: [
          Icon(Icons.phone_android, size: 40.s),
          ResponsiveSizedBox(height: 8),
          Text('Phone Layout', style: ResponsiveText.h5()),
          Text('Single column design', style: ResponsiveText.bodySmall()),
        ],
      ),
    );
  }

  Widget _buildTabletLayout() {
    return Container(
      padding: ResponsivePadding.md,
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: ResponsiveBorderRadius.sm,
      ),
      child: Row(
        children: [
          Icon(Icons.tablet_android, size: 40.s),
          ResponsiveSpacing.horizontal(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tablet Layout', style: ResponsiveText.h5()),
                Text('Two column design', style: ResponsiveText.bodySmall()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Container(
      padding: ResponsivePadding.md,
      decoration: BoxDecoration(
        color: Colors.purple.shade50,
        borderRadius: ResponsiveBorderRadius.sm,
      ),
      child: Row(
        children: [
          Icon(Icons.desktop_windows, size: 40.s),
          ResponsiveSpacing.horizontal(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Desktop Layout', style: ResponsiveText.h5()),
                Text('Multi-column design', style: ResponsiveText.bodySmall()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResponsiveGrid() {
    return Container(
      padding: ResponsivePadding.md,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Responsive Grid', style: ResponsiveText.h3()),
          ResponsiveSizedBox(height: 8),

          SizedBox(
            height: 300.h,
            child: ResponsiveGridView(
              phoneColumns: 2,
              tabletColumns: 3,
              desktopColumns: 4,
              spacing: 8,
              children: List.generate(
                8,
                    (index) => Container(
                  decoration: BoxDecoration(
                    color: Colors.primaries[index % Colors.primaries.length],
                    borderRadius: ResponsiveBorderRadius.sm,
                  ),
                  child: Center(
                    child: Text(
                      'Item ${index + 1}',
                      style: ResponsiveText.bodyMedium(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeviceDetection() {
    return Container(
      padding: ResponsivePadding.md,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Device Detection', style: ResponsiveText.h3()),
          ResponsiveSizedBox(height: 8),

          _infoRow('Screen Width', '${ScreenUtil.sw.toStringAsFixed(1)}dp'),
          _infoRow('Screen Height', '${ScreenUtil.sh.toStringAsFixed(1)}dp'),
          _infoRow('Pixel Ratio', ScreenUtil.pr.toStringAsFixed(2)),
          _infoRow('Status Bar', '${ScreenUtil.statusBar.toStringAsFixed(1)}dp'),
          _infoRow('Bottom Bar', '${ScreenUtil.bottomBar.toStringAsFixed(1)}dp'),
          _infoRow('Device Type', _getDeviceType()),
          _infoRow('Orientation', ScreenUtil.instance.isLandscape ? 'Landscape' : 'Portrait'),
        ],
      ),
    );
  }

  String _getDeviceType() {
    if (ScreenUtil.phone) return 'Phone';
    if (ScreenUtil.tablet) return 'Tablet';
    if (ScreenUtil.desktop) return 'Desktop';
    return 'Unknown';
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.h),
      child: Row(
        children: [
          SizedBox(
            width: 120.w,
            child: Text(
              '$label:',
              style: ResponsiveText.bodyMedium(fontWeight: FontWeight.w600),
            ),
          ),
          Text(value, style: ResponsiveText.bodyMedium()),
        ],
      ),
    );
  }

  Widget _buildBreakpointWidgets() {
    return Container(
      padding: ResponsivePadding.md,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Breakpoint Widgets', style: ResponsiveText.h3()),
          ResponsiveSizedBox(height: 8),

          // Show only on mobile
          MobileOnly(
            child: Container(
              padding: ResponsivePadding.sm,
              color: Colors.blue.shade100,
              child: Text('Visible only on Mobile', style: ResponsiveText.bodySmall()),
            ),
          ),

          ResponsiveSizedBox(height: 8),

          // Show only on tablet
          TabletOnly(
            child: Container(
              padding: ResponsivePadding.sm,
              color: Colors.green.shade100,
              child: Text('Visible only on Tablet', style: ResponsiveText.bodySmall()),
            ),
          ),

          ResponsiveSizedBox(height: 8),

          // Show only on desktop
          DesktopOnly(
            child: Container(
              padding: ResponsivePadding.sm,
              color: Colors.purple.shade100,
              child: Text('Visible only on Desktop', style: ResponsiveText.bodySmall()),
            ),
          ),

          ResponsiveSizedBox(height: 8),

          // Hide on mobile
          HideOnMobile(
            child: Container(
              padding: ResponsivePadding.sm,
              color: Colors.orange.shade100,
              child: Text('Hidden on Mobile', style: ResponsiveText.bodySmall()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExtensionExamples() {
    return Container(
      padding: ResponsivePadding.md,
      margin: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Extension Examples', style: ResponsiveText.h3()),
          ResponsiveSizedBox(height: 8),

          // Using number extensions
          Container(
            width: 150.w, // .w extension for width
            height: 80.h, // .h extension for height
            padding: EdgeInsets.all(12.w), // Responsive padding
            decoration: BoxDecoration(
              color: Colors.indigo.shade100,
              borderRadius: BorderRadius.circular(12.r), // .r extension for radius
            ),
            child: Center(
              child: Text(
                'Extensions Rock!',
                style: TextStyle(fontSize: 16.sp), // .sp extension for font size
              ),
            ),
          ),

          ResponsiveSizedBox(height: 16),

          // Percentage-based sizing
          Container(
            width: 80.wp, // 80% of screen width
            height: 100.h,
            color: Colors.teal.shade100,
            child: Center(
              child: Text(
                '80% Width',
                style: ResponsiveText.bodyMedium(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
