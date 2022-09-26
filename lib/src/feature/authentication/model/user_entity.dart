import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

typedef UserID = String;

@immutable
abstract class UserEntity {
  const UserEntity();

  const factory UserEntity.unauthenticated() = UnauthenticatedUser;

  const factory UserEntity.authenticated({
    required UserID uid,
    required String name,
    required String email,
    String? phone,
    String? photo,
  }) = AuthenticatedUser;

  factory UserEntity.fromFirebase(User? user) => user != null
      ? UserEntity.authenticated(
          uid: user.uid,
          name: user.displayName ?? 'Unknown',
          email: user.email ?? 'Unknown',
          phone: user.phoneNumber,
          photo: user.photoURL,
        )
      : const UserEntity.unauthenticated();

  UserID? get uidOrNull;

  UserDetails? get userDetailsOrNull;

  bool get isAuthenticated;

  bool get isNotAuthenticated => !isAuthenticated;

  T map<T>({
    required T Function(UnauthenticatedUser user) unauthenticated,
    required T Function(AuthenticatedUser user) authenticated,
  });

  T maybeMap<T>({
    required T Function() orElse,
    required T Function(UnauthenticatedUser user)? unauthenticated,
    required T Function(AuthenticatedUser user)? authenticated,
  }) =>
      map<T>(
        unauthenticated: (user) => unauthenticated?.call(user) ?? orElse(),
        authenticated: (user) => authenticated?.call(user) ?? orElse(),
      );

  T? mapOrNull<T>({
    required T Function(UnauthenticatedUser user)? unauthenticated,
    required T Function(AuthenticatedUser user)? authenticated,
  }) =>
      map<T?>(
        unauthenticated: (user) => unauthenticated?.call(user),
        authenticated: (user) => authenticated?.call(user),
      );

  @override
  String toString() => 'UserEntity{}';
}

class AuthenticatedUser extends UserEntity with UserDetails {
  const AuthenticatedUser({
    required this.uid,
    required this.name,
    required this.email,
    this.phone,
    this.photo,
  });

  @override
  bool get isAuthenticated => true;

  @override
  UserID? get uidOrNull => uid;

  @override
  final UserID uid;

  @override
  final String name;

  @override
  final String email;

  @override
  final String? phone;

  @override
  final String? photo;

  @override
  T map<T>({
    required T Function(UnauthenticatedUser user) unauthenticated,
    required T Function(AuthenticatedUser user) authenticated,
  }) =>
      authenticated(this);

  @override
  int get hashCode => uid.hashCode;

  @override
  bool operator ==(Object other) => identical(this, other) || (other is AuthenticatedUser && uid == other.uid);

  @override
  String toString() => 'AuthenticatedUser{'
      'uid: $uid, '
      'name: $name, '
      'email: $email, '
      'phone: $phone, '
      'photo: $photo'
      '}';
}

class UnauthenticatedUser extends UserEntity {
  @literal
  const UnauthenticatedUser();

  @override
  UserID? get uidOrNull => null;

  @override
  UserDetails? get userDetailsOrNull => null;

  @override
  bool get isAuthenticated => false;

  @override
  T map<T>({
    required T Function(UnauthenticatedUser user) unauthenticated,
    required T Function(AuthenticatedUser user) authenticated,
  }) =>
      unauthenticated(this);

  @override
  int get hashCode => -1;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UnauthenticatedUser;

  @override
  String toString() => 'UnauthenticatedUser{}';
}

@immutable
mixin UserDetails on UserEntity {
  @override
  UserDetails? get userDetailsOrNull => this;

  /// The user's unique ID.
  abstract final UserID uid;

  /// The users display name.
  abstract final String name;

  /// The users email address.
  abstract final String email;

  /// Returns the users phone number.
  ///
  /// This property will be `null` if the user has not signed in or been has
  /// their phone number linked.
  abstract final String? phone;

  /// Returns a photo URL for the user.))
  ///
  /// This property will be populated if the user has signed in or been linked
  /// with a 3rd party OAuth provider (such as Google).
  abstract final String? photo;

  /*
  UserDetails copyWith({
    String? newName,
    String? newEmail,
    String? newPhone,
    String? newPhoto,
  }); */
}
