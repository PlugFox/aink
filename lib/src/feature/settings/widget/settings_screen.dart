import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/initialization/dependencies.dart';
import '../bloc/settings_bloc.dart';
import '../model/settings_entity.dart';
import 'settings_user_card.dart';

/// {@template settings_screen}
/// SettingsScreen widget
/// {@endtemplate}
class SettingsScreen extends StatelessWidget {
  /// {@macro settings_screen}
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: BlocBuilder<SettingsBLoC, SettingsState>(
          bloc: Dependencies.instance.settingsBLoC,
          builder: (context, state) => ListView(
            padding: EdgeInsets.symmetric(
              horizontal: math.max(16, (MediaQuery.of(context).size.width - 600) / 2),
              vertical: 16,
            ),
            children: <Widget>[
              const SettingsUserCard(),
              ListTile(
                title: const Text('Dark theme'),
                trailing: Switch(
                  value: Theme.of(context).brightness == Brightness.dark,
                  onChanged: (value) => Dependencies.instance.settingsBLoC.add(
                    SettingsEvent.mutate(
                      state.data.copyWith(
                        newTheme: value ? SettingsTheme.dark : SettingsTheme.light,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
