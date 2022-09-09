import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:l/l.dart';

import 'src/common/widget/app.dart';

void main() => runZonedGuarded<void>(
      () => l.capture<void>(
        () => runApp(const App()),
        const LogOptions(
          handlePrint: true,
          outputInRelease: true,
          printColors: true,
        ),
      ),
      l.e,
    );
