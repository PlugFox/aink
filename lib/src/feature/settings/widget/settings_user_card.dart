import 'package:flutter/material.dart';

import '../../authentication/widget/authentication_scope.dart';

/// {@template settings_user_card}
/// SettingsUserCard widget
/// {@endtemplate}
class SettingsUserCard extends StatelessWidget {
  /// {@macro settings_user_card}
  const SettingsUserCard({super.key});

  @override
  Widget build(BuildContext context) {
    final user = AuthenticationScope.maybeUserOf(context)?.userDetailsOrNull;
    if (user == null) return const Text('No user');
    final photo = user.photo;
    return SizedBox(
      height: 96,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 16,
            left: 0,
            bottom: 16,
            right: 0,
            child: Card(
              elevation: 4,
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(24),
                onTap: () => showDialog<void>(
                  context: context,
                  builder: (context) => AlertDialog(
                    //icon: const Icon(Icons.logout),
                    title: const Text('Log out'),
                    content: const Text('Do you really want to log out?'),
                    actions: [
                      OutlinedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
                      ),
                      ElevatedButton(
                        child: Text(MaterialLocalizations.of(context).continueButtonLabel),
                        onPressed: () => AuthenticationScope.logOut(context),
                      ),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              user.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Text(
                              user.email,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (photo != null)
            Positioned.fill(
              child: Align(
                alignment: Alignment.centerRight,
                child: Tooltip(
                  message: user.uid,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(photo),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
