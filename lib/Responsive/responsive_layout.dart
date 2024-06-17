import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile_Scaffold;
  final Widget tablet_Scaffold;
  final Widget desktop_Scaffold;

  const ResponsiveLayout(
      {super.key,
      required this.mobile_Scaffold,
      required this.tablet_Scaffold,
      required this.desktop_Scaffold});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, Constraints) {
      if (Constraints.maxWidth < 500) {
        return mobile_Scaffold;
      } else if (Constraints.maxWidth < 1100) {
        return tablet_Scaffold;
      } else {
        return desktop_Scaffold;
      }
    });
  }
}
