// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Statics {
  static bool mobile = false;

  static double DEVICE_WIDTH(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double DEVICE_HEIGHT(BuildContext context) =>
      MediaQuery.of(context).size.height;
}
