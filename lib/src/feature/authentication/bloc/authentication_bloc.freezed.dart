// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'authentication_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthenticationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() googleSignIn,
    required TResult Function() logOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? googleSignIn,
    TResult Function()? logOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? googleSignIn,
    TResult Function()? logOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GoogleSignIn value) googleSignIn,
    required TResult Function(_LogOut value) logOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GoogleSignIn value)? googleSignIn,
    TResult Function(_LogOut value)? logOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GoogleSignIn value)? googleSignIn,
    TResult Function(_LogOut value)? logOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationEventCopyWith<$Res> {
  factory $AuthenticationEventCopyWith(
          AuthenticationEvent value, $Res Function(AuthenticationEvent) then) =
      _$AuthenticationEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthenticationEventCopyWithImpl<$Res>
    implements $AuthenticationEventCopyWith<$Res> {
  _$AuthenticationEventCopyWithImpl(this._value, this._then);

  final AuthenticationEvent _value;
  // ignore: unused_field
  final $Res Function(AuthenticationEvent) _then;
}

/// @nodoc
abstract class _$$_GoogleSignInCopyWith<$Res> {
  factory _$$_GoogleSignInCopyWith(
          _$_GoogleSignIn value, $Res Function(_$_GoogleSignIn) then) =
      __$$_GoogleSignInCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GoogleSignInCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res>
    implements _$$_GoogleSignInCopyWith<$Res> {
  __$$_GoogleSignInCopyWithImpl(
      _$_GoogleSignIn _value, $Res Function(_$_GoogleSignIn) _then)
      : super(_value, (v) => _then(v as _$_GoogleSignIn));

  @override
  _$_GoogleSignIn get _value => super._value as _$_GoogleSignIn;
}

/// @nodoc

class _$_GoogleSignIn extends _GoogleSignIn {
  const _$_GoogleSignIn() : super._();

  @override
  String toString() {
    return 'AuthenticationEvent.googleSignIn()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GoogleSignIn);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() googleSignIn,
    required TResult Function() logOut,
  }) {
    return googleSignIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? googleSignIn,
    TResult Function()? logOut,
  }) {
    return googleSignIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? googleSignIn,
    TResult Function()? logOut,
    required TResult orElse(),
  }) {
    if (googleSignIn != null) {
      return googleSignIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GoogleSignIn value) googleSignIn,
    required TResult Function(_LogOut value) logOut,
  }) {
    return googleSignIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GoogleSignIn value)? googleSignIn,
    TResult Function(_LogOut value)? logOut,
  }) {
    return googleSignIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GoogleSignIn value)? googleSignIn,
    TResult Function(_LogOut value)? logOut,
    required TResult orElse(),
  }) {
    if (googleSignIn != null) {
      return googleSignIn(this);
    }
    return orElse();
  }
}

abstract class _GoogleSignIn extends AuthenticationEvent {
  const factory _GoogleSignIn() = _$_GoogleSignIn;
  const _GoogleSignIn._() : super._();
}

/// @nodoc
abstract class _$$_LogOutCopyWith<$Res> {
  factory _$$_LogOutCopyWith(_$_LogOut value, $Res Function(_$_LogOut) then) =
      __$$_LogOutCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LogOutCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res>
    implements _$$_LogOutCopyWith<$Res> {
  __$$_LogOutCopyWithImpl(_$_LogOut _value, $Res Function(_$_LogOut) _then)
      : super(_value, (v) => _then(v as _$_LogOut));

  @override
  _$_LogOut get _value => super._value as _$_LogOut;
}

/// @nodoc

class _$_LogOut extends _LogOut {
  const _$_LogOut() : super._();

  @override
  String toString() {
    return 'AuthenticationEvent.logOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LogOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() googleSignIn,
    required TResult Function() logOut,
  }) {
    return logOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? googleSignIn,
    TResult Function()? logOut,
  }) {
    return logOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? googleSignIn,
    TResult Function()? logOut,
    required TResult orElse(),
  }) {
    if (logOut != null) {
      return logOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GoogleSignIn value) googleSignIn,
    required TResult Function(_LogOut value) logOut,
  }) {
    return logOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GoogleSignIn value)? googleSignIn,
    TResult Function(_LogOut value)? logOut,
  }) {
    return logOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GoogleSignIn value)? googleSignIn,
    TResult Function(_LogOut value)? logOut,
    required TResult orElse(),
  }) {
    if (logOut != null) {
      return logOut(this);
    }
    return orElse();
  }
}

abstract class _LogOut extends AuthenticationEvent {
  const factory _LogOut() = _$_LogOut;
  const _LogOut._() : super._();
}

/// @nodoc
mixin _$AuthenticationState {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) notAuthenticated,
    required TResult Function(UserEntity user, String message) processing,
    required TResult Function(UserEntity user, String message) error,
    required TResult Function(AuthenticatedUser user, String message)
        authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? notAuthenticated,
    TResult Function(UserEntity user, String message)? processing,
    TResult Function(UserEntity user, String message)? error,
    TResult Function(AuthenticatedUser user, String message)? authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? notAuthenticated,
    TResult Function(UserEntity user, String message)? processing,
    TResult Function(UserEntity user, String message)? error,
    TResult Function(AuthenticatedUser user, String message)? authenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_notAuthenticated value) notAuthenticated,
    required TResult Function(_processing value) processing,
    required TResult Function(_error value) error,
    required TResult Function(_authenticated value) authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_notAuthenticated value)? notAuthenticated,
    TResult Function(_processing value)? processing,
    TResult Function(_error value)? error,
    TResult Function(_authenticated value)? authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_notAuthenticated value)? notAuthenticated,
    TResult Function(_processing value)? processing,
    TResult Function(_error value)? error,
    TResult Function(_authenticated value)? authenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthenticationStateCopyWith<AuthenticationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationStateCopyWith<$Res> {
  factory $AuthenticationStateCopyWith(
          AuthenticationState value, $Res Function(AuthenticationState) then) =
      _$AuthenticationStateCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$AuthenticationStateCopyWithImpl<$Res>
    implements $AuthenticationStateCopyWith<$Res> {
  _$AuthenticationStateCopyWithImpl(this._value, this._then);

  final AuthenticationState _value;
  // ignore: unused_field
  final $Res Function(AuthenticationState) _then;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_notAuthenticatedCopyWith<$Res>
    implements $AuthenticationStateCopyWith<$Res> {
  factory _$$_notAuthenticatedCopyWith(
          _$_notAuthenticated value, $Res Function(_$_notAuthenticated) then) =
      __$$_notAuthenticatedCopyWithImpl<$Res>;
  @override
  $Res call({String message});
}

/// @nodoc
class __$$_notAuthenticatedCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements _$$_notAuthenticatedCopyWith<$Res> {
  __$$_notAuthenticatedCopyWithImpl(
      _$_notAuthenticated _value, $Res Function(_$_notAuthenticated) _then)
      : super(_value, (v) => _then(v as _$_notAuthenticated));

  @override
  _$_notAuthenticated get _value => super._value as _$_notAuthenticated;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$_notAuthenticated(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_notAuthenticated extends _notAuthenticated {
  const _$_notAuthenticated({this.message = 'Not authenticated'}) : super._();

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'AuthenticationState.notAuthenticated(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_notAuthenticated &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_notAuthenticatedCopyWith<_$_notAuthenticated> get copyWith =>
      __$$_notAuthenticatedCopyWithImpl<_$_notAuthenticated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) notAuthenticated,
    required TResult Function(UserEntity user, String message) processing,
    required TResult Function(UserEntity user, String message) error,
    required TResult Function(AuthenticatedUser user, String message)
        authenticated,
  }) {
    return notAuthenticated(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? notAuthenticated,
    TResult Function(UserEntity user, String message)? processing,
    TResult Function(UserEntity user, String message)? error,
    TResult Function(AuthenticatedUser user, String message)? authenticated,
  }) {
    return notAuthenticated?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? notAuthenticated,
    TResult Function(UserEntity user, String message)? processing,
    TResult Function(UserEntity user, String message)? error,
    TResult Function(AuthenticatedUser user, String message)? authenticated,
    required TResult orElse(),
  }) {
    if (notAuthenticated != null) {
      return notAuthenticated(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_notAuthenticated value) notAuthenticated,
    required TResult Function(_processing value) processing,
    required TResult Function(_error value) error,
    required TResult Function(_authenticated value) authenticated,
  }) {
    return notAuthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_notAuthenticated value)? notAuthenticated,
    TResult Function(_processing value)? processing,
    TResult Function(_error value)? error,
    TResult Function(_authenticated value)? authenticated,
  }) {
    return notAuthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_notAuthenticated value)? notAuthenticated,
    TResult Function(_processing value)? processing,
    TResult Function(_error value)? error,
    TResult Function(_authenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (notAuthenticated != null) {
      return notAuthenticated(this);
    }
    return orElse();
  }
}

abstract class _notAuthenticated extends AuthenticationState {
  const factory _notAuthenticated({final String message}) = _$_notAuthenticated;
  const _notAuthenticated._() : super._();

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_notAuthenticatedCopyWith<_$_notAuthenticated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_processingCopyWith<$Res>
    implements $AuthenticationStateCopyWith<$Res> {
  factory _$$_processingCopyWith(
          _$_processing value, $Res Function(_$_processing) then) =
      __$$_processingCopyWithImpl<$Res>;
  @override
  $Res call({UserEntity user, String message});
}

/// @nodoc
class __$$_processingCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements _$$_processingCopyWith<$Res> {
  __$$_processingCopyWithImpl(
      _$_processing _value, $Res Function(_$_processing) _then)
      : super(_value, (v) => _then(v as _$_processing));

  @override
  _$_processing get _value => super._value as _$_processing;

  @override
  $Res call({
    Object? user = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_processing(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_processing extends _processing {
  const _$_processing({required this.user, this.message = 'Processing...'})
      : super._();

  @override
  final UserEntity user;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'AuthenticationState.processing(user: $user, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_processing &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_processingCopyWith<_$_processing> get copyWith =>
      __$$_processingCopyWithImpl<_$_processing>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) notAuthenticated,
    required TResult Function(UserEntity user, String message) processing,
    required TResult Function(UserEntity user, String message) error,
    required TResult Function(AuthenticatedUser user, String message)
        authenticated,
  }) {
    return processing(user, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? notAuthenticated,
    TResult Function(UserEntity user, String message)? processing,
    TResult Function(UserEntity user, String message)? error,
    TResult Function(AuthenticatedUser user, String message)? authenticated,
  }) {
    return processing?.call(user, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? notAuthenticated,
    TResult Function(UserEntity user, String message)? processing,
    TResult Function(UserEntity user, String message)? error,
    TResult Function(AuthenticatedUser user, String message)? authenticated,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(user, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_notAuthenticated value) notAuthenticated,
    required TResult Function(_processing value) processing,
    required TResult Function(_error value) error,
    required TResult Function(_authenticated value) authenticated,
  }) {
    return processing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_notAuthenticated value)? notAuthenticated,
    TResult Function(_processing value)? processing,
    TResult Function(_error value)? error,
    TResult Function(_authenticated value)? authenticated,
  }) {
    return processing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_notAuthenticated value)? notAuthenticated,
    TResult Function(_processing value)? processing,
    TResult Function(_error value)? error,
    TResult Function(_authenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(this);
    }
    return orElse();
  }
}

abstract class _processing extends AuthenticationState {
  const factory _processing(
      {required final UserEntity user, final String message}) = _$_processing;
  const _processing._() : super._();

  UserEntity get user;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_processingCopyWith<_$_processing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_errorCopyWith<$Res>
    implements $AuthenticationStateCopyWith<$Res> {
  factory _$$_errorCopyWith(_$_error value, $Res Function(_$_error) then) =
      __$$_errorCopyWithImpl<$Res>;
  @override
  $Res call({UserEntity user, String message});
}

/// @nodoc
class __$$_errorCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements _$$_errorCopyWith<$Res> {
  __$$_errorCopyWithImpl(_$_error _value, $Res Function(_$_error) _then)
      : super(_value, (v) => _then(v as _$_error));

  @override
  _$_error get _value => super._value as _$_error;

  @override
  $Res call({
    Object? user = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_error(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_error extends _error {
  const _$_error(
      {required this.user,
      this.message = 'An error occurred during authentication'})
      : super._();

  @override
  final UserEntity user;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'AuthenticationState.error(user: $user, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_error &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_errorCopyWith<_$_error> get copyWith =>
      __$$_errorCopyWithImpl<_$_error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) notAuthenticated,
    required TResult Function(UserEntity user, String message) processing,
    required TResult Function(UserEntity user, String message) error,
    required TResult Function(AuthenticatedUser user, String message)
        authenticated,
  }) {
    return error(user, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? notAuthenticated,
    TResult Function(UserEntity user, String message)? processing,
    TResult Function(UserEntity user, String message)? error,
    TResult Function(AuthenticatedUser user, String message)? authenticated,
  }) {
    return error?.call(user, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? notAuthenticated,
    TResult Function(UserEntity user, String message)? processing,
    TResult Function(UserEntity user, String message)? error,
    TResult Function(AuthenticatedUser user, String message)? authenticated,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(user, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_notAuthenticated value) notAuthenticated,
    required TResult Function(_processing value) processing,
    required TResult Function(_error value) error,
    required TResult Function(_authenticated value) authenticated,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_notAuthenticated value)? notAuthenticated,
    TResult Function(_processing value)? processing,
    TResult Function(_error value)? error,
    TResult Function(_authenticated value)? authenticated,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_notAuthenticated value)? notAuthenticated,
    TResult Function(_processing value)? processing,
    TResult Function(_error value)? error,
    TResult Function(_authenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _error extends AuthenticationState {
  const factory _error({required final UserEntity user, final String message}) =
      _$_error;
  const _error._() : super._();

  UserEntity get user;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_errorCopyWith<_$_error> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_authenticatedCopyWith<$Res>
    implements $AuthenticationStateCopyWith<$Res> {
  factory _$$_authenticatedCopyWith(
          _$_authenticated value, $Res Function(_$_authenticated) then) =
      __$$_authenticatedCopyWithImpl<$Res>;
  @override
  $Res call({AuthenticatedUser user, String message});
}

/// @nodoc
class __$$_authenticatedCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements _$$_authenticatedCopyWith<$Res> {
  __$$_authenticatedCopyWithImpl(
      _$_authenticated _value, $Res Function(_$_authenticated) _then)
      : super(_value, (v) => _then(v as _$_authenticated));

  @override
  _$_authenticated get _value => super._value as _$_authenticated;

  @override
  $Res call({
    Object? user = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_authenticated(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AuthenticatedUser,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_authenticated extends _authenticated {
  const _$_authenticated({required this.user, this.message = 'Authenticated'})
      : super._();

  @override
  final AuthenticatedUser user;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'AuthenticationState.authenticated(user: $user, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_authenticated &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_authenticatedCopyWith<_$_authenticated> get copyWith =>
      __$$_authenticatedCopyWithImpl<_$_authenticated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) notAuthenticated,
    required TResult Function(UserEntity user, String message) processing,
    required TResult Function(UserEntity user, String message) error,
    required TResult Function(AuthenticatedUser user, String message)
        authenticated,
  }) {
    return authenticated(user, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? notAuthenticated,
    TResult Function(UserEntity user, String message)? processing,
    TResult Function(UserEntity user, String message)? error,
    TResult Function(AuthenticatedUser user, String message)? authenticated,
  }) {
    return authenticated?.call(user, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? notAuthenticated,
    TResult Function(UserEntity user, String message)? processing,
    TResult Function(UserEntity user, String message)? error,
    TResult Function(AuthenticatedUser user, String message)? authenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(user, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_notAuthenticated value) notAuthenticated,
    required TResult Function(_processing value) processing,
    required TResult Function(_error value) error,
    required TResult Function(_authenticated value) authenticated,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_notAuthenticated value)? notAuthenticated,
    TResult Function(_processing value)? processing,
    TResult Function(_error value)? error,
    TResult Function(_authenticated value)? authenticated,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_notAuthenticated value)? notAuthenticated,
    TResult Function(_processing value)? processing,
    TResult Function(_error value)? error,
    TResult Function(_authenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class _authenticated extends AuthenticationState {
  const factory _authenticated(
      {required final AuthenticatedUser user,
      final String message}) = _$_authenticated;
  const _authenticated._() : super._();

  AuthenticatedUser get user;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_authenticatedCopyWith<_$_authenticated> get copyWith =>
      throw _privateConstructorUsedError;
}
