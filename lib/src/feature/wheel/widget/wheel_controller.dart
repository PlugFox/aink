import 'package:flutter/material.dart';

class WheelController extends PageController {
  WheelController({super.initialPage = 1, super.viewportFraction = 1});

  @override
  double get page => (super.hasClients ? super.page : null) ?? initialPage.toDouble();
}
