import 'package:flutter/material.dart';

import 'wheel_controller.dart';

class WheelFooter extends StatelessWidget {
  const WheelFooter({
    required this.controller,
    super.key,
  });

  final WheelController controller;

  @override
  Widget build(BuildContext context) => Center(
        child: SizedBox(
          width: 1240,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox.square(
                dimension: 40,
                child: Ink(
                  padding: EdgeInsets.zero,
                  decoration: ShapeDecoration(
                    color: Theme.of(context).primaryColor,
                    shadows: kElevationToShadow[2],
                    shape: const CircleBorder(),
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () => controller.animateToPage(
                        0,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      ),
                      icon: const Icon(Icons.photo_album_outlined),
                      iconSize: 24,
                      splashRadius: 18,
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ),
              SizedBox.square(
                dimension: 64,
                child: Ink(
                  padding: EdgeInsets.zero,
                  decoration: ShapeDecoration(
                    color: Theme.of(context).primaryColor,
                    shadows: kElevationToShadow[4],
                    shape: const CircleBorder(),
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () => controller.animateToPage(
                        1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      ),
                      icon: const Icon(Icons.photo_outlined),
                      iconSize: 48,
                      splashRadius: 30,
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ),
              SizedBox.square(
                dimension: 40,
                child: Ink(
                  padding: EdgeInsets.zero,
                  decoration: ShapeDecoration(
                    color: Theme.of(context).primaryColor,
                    shadows: kElevationToShadow[2],
                    shape: const CircleBorder(),
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () => controller.animateToPage(
                        2,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      ),
                      /* onPressed: () => showDialog<void>(
                        context: context,
                        builder: (context) => const SimpleDialog(
                          alignment: Alignment.center,
                          title: Text('Settings'),
                          contentPadding: EdgeInsets.all(16),
                          insetPadding: EdgeInsets.all(16),
                          children: <Widget>[
                            Text('Option 1'),
                            Text('Option 2'),
                            Text('Option 3'),
                            Text('Option 4'),
                            Text('Option 5'),
                          ],
                        ),
                      ), */
                      icon: const Icon(Icons.settings_outlined),
                      iconSize: 24,
                      splashRadius: 18,
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
