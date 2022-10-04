import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WheelController extends PageController implements ValueListenable<double> {
  WheelController({required this.total, super.initialPage = 1, super.viewportFraction = 1});

  @override
  double get value => page;

  final int total;

  @override
  double get page => (super.hasClients ? super.page : null) ?? initialPage.toDouble();
}
