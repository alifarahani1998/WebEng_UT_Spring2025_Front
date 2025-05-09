import 'package:flutter/material.dart';
import 'package:flutter_application_test/view/responsive/desktop_body.dart';
import 'package:flutter_application_test/view/responsive/mobile_body.dart';
import 'package:flutter_application_test/view/responsive/responsive_layout.dart';
import 'package:flutter_application_test/view/responsive/tablet_body.dart';

class ResponsiveScreen extends StatelessWidget {
  const ResponsiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        mobileBody: MobileBody(),
        desktopBody: DesktopBody(),
        tabletBody: TabletBody(),
      ),
    );
  }
}
