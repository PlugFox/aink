import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/initialization/dependencies.dart';
import '../../authentication/widget/authentication_scope.dart';
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
              const SizedBox(height: 16),
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
              //const Divider(),
              const SizedBox(height: 48),
              ListTile(
                title: OutlinedButton.icon(
                  icon: const Icon(Icons.logout, color: Colors.red),
                  label: const Text('Logout', style: TextStyle(color: Colors.red)),
                  onPressed: () => _logOut(context),
                ),
              ),
            ],
          ),
        ),
      );

  void _logOut(BuildContext context) {
    HapticFeedback.lightImpact().ignore();
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        //icon: const Icon(Icons.logout),
        title: const Text('Sign out'),
        content: const Text('Do you really want to log out?'),
        actions: <Widget>[
          OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
              HapticFeedback.lightImpact().ignore();
            },
            child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
          ),
          ElevatedButton(
            onPressed: () {
              AuthenticationScope.logOut(context);
              HapticFeedback.mediumImpact().ignore();
            },
            child: Text(MaterialLocalizations.of(context).continueButtonLabel),
          ),
        ],
      ),
    );
  }
}
