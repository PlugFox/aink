import 'package:flutter/widgets.dart';

/// {@template authentication_scope}
/// AuthenticationScope widget
/// {@endtemplate}
class AuthenticationScope extends StatefulWidget {
  /// {@macro authentication_scope}
  const AuthenticationScope({
    required this.child,
    super.key,
  });

  /// The widget below this widget in the tree.
  final Widget child;

  /* /// The state from the closest instance of this class
  /// that encloses the given context, if any.
  /// e.g. `AuthenticationScope.maybeOf(context)`
  static AuthenticationScopeController? maybeOf(BuildContext context) {
    final inhW = context.getElementForInheritedWidgetOfExactType<_InheritedAuthenticationScope>()?.widget;
    return inhW is _InheritedAuthenticationScope ? inhW.controller : null;
  }

  static Never _notFoundInheritedWidgetOfExactType() => throw ArgumentError(
        'Out of scope, not found inherited widget '
            'a _InheritedAuthenticationScope of the exact type',
        'out_of_scope',
      );

  /// The state from the closest instance of this class
  /// that encloses the given context.
  /// e.g. `AuthenticationScope.of(context)`
  static AuthenticationScopeController of(BuildContext context) =>
      maybeOf(context) ?? _notFoundInheritedWidgetOfExactType(); */

  @override
  State<AuthenticationScope> createState() => _AuthenticationScopeState();
}

/// State for widget AuthenticationScope
class _AuthenticationScopeState extends State<AuthenticationScope> {
  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();
    // Initial state initialization
  }

  @override
  void didUpdateWidget(AuthenticationScope oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Widget configuration changed
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // The configuration of InheritedWidgets has changed
    // Also called after initState but before build
  }

  @override
  void dispose() {
    // Permanent removal of a tree stent
    super.dispose();
  }

  /* #endregion */

  @override
  Widget build(BuildContext context) => _InheritedAuthenticationScope(
        child: widget.child,
      );
}

/// Inherited widget for quick access in the element tree
class _InheritedAuthenticationScope extends InheritedWidget {
  const _InheritedAuthenticationScope({
    required super.child,
    // ignore: unused_element
    super.key,
  });

  @override
  bool updateShouldNotify(_InheritedAuthenticationScope oldWidget) => false;
}
