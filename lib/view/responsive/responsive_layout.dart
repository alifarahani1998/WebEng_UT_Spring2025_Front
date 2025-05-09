import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  
  
  final Widget mobileBody;
  final Widget desktopBody;
  final Widget tabletBody;

  ResponsiveLayout({
    required this.mobileBody,
    required this.desktopBody,
    required this.tabletBody,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600)
        return mobileBody;
      else if (constraints.maxWidth > 600 && constraints.maxWidth < 1200)
        return tabletBody;
      else
        return desktopBody;
    });
  }
}