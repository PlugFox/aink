import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_batteries/flutter_batteries.dart';

import 'wheel_bottom_bar.dart';
import 'wheel_controller.dart';
import 'wheel_pages.dart';

/// {@template wheel_screen}
/// WheelScreen widget
/// {@endtemplate}
class WheelScreen extends StatefulWidget {
  /// {@macro wheel_screen}
  const WheelScreen({super.key});

  /* static double getBottomPadding(BuildContext context, [MediaQueryData? mediaQueryData]) =>
      ((mediaQueryData ?? MediaQuery.of(context)).size.height / 10).clamp(64, 128); */

  @override
  State<WheelScreen> createState() => _WheelScreenState();
}

class _WheelScreenState extends State<WheelScreen> {
  static const int _initialPage = 1;
  final WheelController _controller = WheelController(initialPage: _initialPage);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => OrientationBuilder(
        builder: (context, orientation) => Scaffold(
          resizeToAvoidBottomInset: false,
          floatingActionButtonLocation: orientation == Orientation.landscape
              ? FloatingActionButtonLocation.miniCenterFloat
              : FloatingActionButtonLocation.centerFloat,
          floatingActionButton: ValueListenableBuilder<int>(
            valueListenable: _controller.select<int>(
              (controller) => controller.page.round(),
              (prev, next) => prev != next,
            ),
            builder: (context, value, child) => SizedBox(
              width: 280,
              child: Card(
                elevation: 8,
                margin: EdgeInsets.zero,
                shape: const StadiumBorder(),
                child: WheelBottomBar(
                  selectedItemColor: Theme.of(context).colorScheme.secondary,
                  items: <WheelBottomBarItem>[
                    WheelBottomBarItem(icon: const Icon(Icons.favorite), title: const Text('Gallery')),
                    WheelBottomBarItem(icon: const Icon(Icons.image), title: const Text('Promt')),
                    WheelBottomBarItem(icon: const Icon(Icons.settings), title: const Text('Settings')),
                    //WheelBottomBarItem(icon: Icons.favorite, label: 'Likes'),
                    //WheelBottomBarItem(icon: Icons.search, label: 'Search'),
                    //WheelBottomBarItem(icon: Icons.person, label: 'Profile'),
                  ],
                  currentIndex: value,
                  onTap: (index) {
                    _controller.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeOutQuint,
                    );
                    HapticFeedback.selectionClick().ignore();
                  },
                ),
              ),
            ),
          ),
          body: SafeArea(
            child: WheelPages(controller: _controller),
          ),
        ),
      );
}
