# screen_util

A Flutter package for responsive UI and screen size adaptation.  
Easily scale your widgets, fonts, and layout based on screen size.

## Features

- Initialize with design width and height
- Scale width, height, and font sizes
- Works with any Flutter project

## Usage

```dart
import 'package:screen_util/screen_util.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) {
          ScreenUtil.init(context, designWidth: 375, designHeight: 812);

          return Scaffold(
            body: Center(
              child: Container(
                width: ScreenUtil.w(100),
                height: ScreenUtil.h(50),
                color: Colors.blue,
              ),
            ),
          );
        },
      ),
    );
  }
}
