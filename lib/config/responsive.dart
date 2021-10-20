import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  //allows for fluid instance where a specfic instance of responsive can have variable scale factors.
  final double mobileParam;
  final double tabletParam;
  final double desktopParam;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    this.desktopParam = -1,
    this.mobileParam = -1,
    this.tabletParam = -1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isCustom = (desktopParam != -1);

    double tabletRes = !isCustom ? 768 : tabletParam;
    double desktopRes = !isCustom ? 1750 : tabletParam;

    return LayoutBuilder(
      // If our width is more than desktopRes then we consider it a desktop
      builder: (context, constraints) {
        if (constraints.maxWidth >= desktopRes) {
          return desktop;
        }
        // If width it less then desktopRes and more then tabletRes we consider it as tablet
        else if (constraints.maxWidth >= tabletRes) {
          return tablet;
        }
        // Or less then that we called it mobile
        else {
          return mobile;
        }
      },
    );
  }
}
