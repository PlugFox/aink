// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'settings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SettingsEvent {
  SettingsEntity get settings => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SettingsEntity settings) mutate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(SettingsEntity settings)? mutate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SettingsEntity settings)? mutate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MutateSettingsEvent value) mutate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_MutateSettingsEvent value)? mutate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MutateSettingsEvent value)? mutate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingsEventCopyWith<SettingsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsEventCopyWith<$Res> {
  factory $SettingsEventCopyWith(
          SettingsEvent value, $Res Function(SettingsEvent) then) =
      _$SettingsEventCopyWithImpl<$Res>;
  $Res call({SettingsEntity settings});
}

/// @nodoc
class _$SettingsEventCopyWithImpl<$Res>
    implements $SettingsEventCopyWith<$Res> {
  _$SettingsEventCopyWithImpl(this._value, this._then);

  final SettingsEvent _value;
  // ignore: unused_field
  final $Res Function(SettingsEvent) _then;

  @override
  $Res call({
    Object? settings = freezed,
  }) {
    return _then(_value.copyWith(
      settings: settings == freezed
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as SettingsEntity,
    ));
  }
}

/// @nodoc
abstract class _$$_MutateSettingsEventCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory _$$_MutateSettingsEventCopyWith(_$_MutateSettingsEvent value,
          $Res Function(_$_MutateSettingsEvent) then) =
      __$$_MutateSettingsEventCopyWithImpl<$Res>;
  @override
  $Res call({SettingsEntity settings});
}

/// @nodoc
class __$$_MutateSettingsEventCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res>
    implements _$$_MutateSettingsEventCopyWith<$Res> {
  __$$_MutateSettingsEventCopyWithImpl(_$_MutateSettingsEvent _value,
      $Res Function(_$_MutateSettingsEvent) _then)
      : super(_value, (v) => _then(v as _$_MutateSettingsEvent));

  @override
  _$_MutateSettingsEvent get _value => super._value as _$_MutateSettingsEvent;

  @override
  $Res call({
    Object? settings = freezed,
  }) {
    return _then(_$_MutateSettingsEvent(
      settings == freezed
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as SettingsEntity,
    ));
  }
}

/// @nodoc

class _$_MutateSettingsEvent implements _MutateSettingsEvent {
  const _$_MutateSettingsEvent(this.settings);

  @override
  final SettingsEntity settings;

  @override
  String toString() {
    return 'SettingsEvent.mutate(settings: $settings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MutateSettingsEvent &&
            const DeepCollectionEquality().equals(other.settings, settings));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(settings));

  @JsonKey(ignore: true)
  @override
  _$$_MutateSettingsEventCopyWith<_$_MutateSettingsEvent> get copyWith =>
      __$$_MutateSettingsEventCopyWithImpl<_$_MutateSettingsEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SettingsEntity settings) mutate,
  }) {
    return mutate(settings);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(SettingsEntity settings)? mutate,
  }) {
    return mutate?.call(settings);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SettingsEntity settings)? mutate,
    required TResult orElse(),
  }) {
    if (mutate != null) {
      return mutate(settings);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MutateSettingsEvent value) mutate,
  }) {
    return mutate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_MutateSettingsEvent value)? mutate,
  }) {
    return mutate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MutateSettingsEvent value)? mutate,
    required TResult orElse(),
  }) {
    if (mutate != null) {
      return mutate(this);
    }
    return orElse();
  }
}

abstract class _MutateSettingsEvent implements SettingsEvent {
  const factory _MutateSettingsEvent(final SettingsEntity settings) =
      _$_MutateSettingsEvent;

  @override
  SettingsEntity get settings;
  @override
  @JsonKey(ignore: true)
  _$$_MutateSettingsEventCopyWith<_$_MutateSettingsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SettingsState {
  SettingsEntity get data => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SettingsEntity data, String message) idle,
    required TResult Function(SettingsEntity data, String message) processing,
    required TResult Function(SettingsEntity data, String message) successful,
    required TResult Function(SettingsEntity data, String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(SettingsEntity data, String message)? idle,
    TResult Function(SettingsEntity data, String message)? processing,
    TResult Function(SettingsEntity data, String message)? successful,
    TResult Function(SettingsEntity data, String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SettingsEntity data, String message)? idle,
    TResult Function(SettingsEntity data, String message)? processing,
    TResult Function(SettingsEntity data, String message)? successful,
    TResult Function(SettingsEntity data, String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IdleSettingsState value) idle,
    required TResult Function(_ProcessingSettingsState value) processing,
    required TResult Function(_SuccessfulSettingsState value) successful,
    required TResult Function(_ErrorSettingsState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_IdleSettingsState value)? idle,
    TResult Function(_ProcessingSettingsState value)? processing,
    TResult Function(_SuccessfulSettingsState value)? successful,
    TResult Function(_ErrorSettingsState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IdleSettingsState value)? idle,
    TResult Function(_ProcessingSettingsState value)? processing,
    TResult Function(_SuccessfulSettingsState value)? successful,
    TResult Function(_ErrorSettingsState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingsStateCopyWith<SettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
          SettingsState value, $Res Function(SettingsState) then) =
      _$SettingsStateCopyWithImpl<$Res>;
  $Res call({SettingsEntity data, String message});
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._value, this._then);

  final SettingsState _value;
  // ignore: unused_field
  final $Res Function(SettingsState) _then;

  @override
  $Res call({
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SettingsEntity,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_IdleSettingsStateCopyWith<$Res>
    implements $SettingsStateCopyWith<$Res> {
  factory _$$_IdleSettingsStateCopyWith(_$_IdleSettingsState value,
          $Res Function(_$_IdleSettingsState) then) =
      __$$_IdleSettingsStateCopyWithImpl<$Res>;
  @override
  $Res call({SettingsEntity data, String message});
}

/// @nodoc
class __$$_IdleSettingsStateCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res>
    implements _$$_IdleSettingsStateCopyWith<$Res> {
  __$$_IdleSettingsStateCopyWithImpl(
      _$_IdleSettingsState _value, $Res Function(_$_IdleSettingsState) _then)
      : super(_value, (v) => _then(v as _$_IdleSettingsState));

  @override
  _$_IdleSettingsState get _value => super._value as _$_IdleSettingsState;

  @override
  $Res call({
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_IdleSettingsState(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SettingsEntity,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_IdleSettingsState extends _IdleSettingsState {
  const _$_IdleSettingsState({required this.data, this.message = 'Idle'})
      : super._();

  @override
  final SettingsEntity data;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'SettingsState.idle(data: $data, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IdleSettingsState &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_IdleSettingsStateCopyWith<_$_IdleSettingsState> get copyWith =>
      __$$_IdleSettingsStateCopyWithImpl<_$_IdleSettingsState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SettingsEntity data, String message) idle,
    required TResult Function(SettingsEntity data, String message) processing,
    required TResult Function(SettingsEntity data, String message) successful,
    required TResult Function(SettingsEntity data, String message) error,
  }) {
    return idle(data, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(SettingsEntity data, String message)? idle,
    TResult Function(SettingsEntity data, String message)? processing,
    TResult Function(SettingsEntity data, String message)? successful,
    TResult Function(SettingsEntity data, String message)? error,
  }) {
    return idle?.call(data, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SettingsEntity data, String message)? idle,
    TResult Function(SettingsEntity data, String message)? processing,
    TResult Function(SettingsEntity data, String message)? successful,
    TResult Function(SettingsEntity data, String message)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(data, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IdleSettingsState value) idle,
    required TResult Function(_ProcessingSettingsState value) processing,
    required TResult Function(_SuccessfulSettingsState value) successful,
    required TResult Function(_ErrorSettingsState value) error,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_IdleSettingsState value)? idle,
    TResult Function(_ProcessingSettingsState value)? processing,
    TResult Function(_SuccessfulSettingsState value)? successful,
    TResult Function(_ErrorSettingsState value)? error,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IdleSettingsState value)? idle,
    TResult Function(_ProcessingSettingsState value)? processing,
    TResult Function(_SuccessfulSettingsState value)? successful,
    TResult Function(_ErrorSettingsState value)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _IdleSettingsState extends SettingsState {
  const factory _IdleSettingsState(
      {required final SettingsEntity data,
      final String message}) = _$_IdleSettingsState;
  const _IdleSettingsState._() : super._();

  @override
  SettingsEntity get data;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_IdleSettingsStateCopyWith<_$_IdleSettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ProcessingSettingsStateCopyWith<$Res>
    implements $SettingsStateCopyWith<$Res> {
  factory _$$_ProcessingSettingsStateCopyWith(_$_ProcessingSettingsState value,
          $Res Function(_$_ProcessingSettingsState) then) =
      __$$_ProcessingSettingsStateCopyWithImpl<$Res>;
  @override
  $Res call({SettingsEntity data, String message});
}

/// @nodoc
class __$$_ProcessingSettingsStateCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res>
    implements _$$_ProcessingSettingsStateCopyWith<$Res> {
  __$$_ProcessingSettingsStateCopyWithImpl(_$_ProcessingSettingsState _value,
      $Res Function(_$_ProcessingSettingsState) _then)
      : super(_value, (v) => _then(v as _$_ProcessingSettingsState));

  @override
  _$_ProcessingSettingsState get _value =>
      super._value as _$_ProcessingSettingsState;

  @override
  $Res call({
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_ProcessingSettingsState(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SettingsEntity,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ProcessingSettingsState extends _ProcessingSettingsState {
  const _$_ProcessingSettingsState(
      {required this.data, this.message = 'Processing'})
      : super._();

  @override
  final SettingsEntity data;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'SettingsState.processing(data: $data, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProcessingSettingsState &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_ProcessingSettingsStateCopyWith<_$_ProcessingSettingsState>
      get copyWith =>
          __$$_ProcessingSettingsStateCopyWithImpl<_$_ProcessingSettingsState>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SettingsEntity data, String message) idle,
    required TResult Function(SettingsEntity data, String message) processing,
    required TResult Function(SettingsEntity data, String message) successful,
    required TResult Function(SettingsEntity data, String message) error,
  }) {
    return processing(data, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(SettingsEntity data, String message)? idle,
    TResult Function(SettingsEntity data, String message)? processing,
    TResult Function(SettingsEntity data, String message)? successful,
    TResult Function(SettingsEntity data, String message)? error,
  }) {
    return processing?.call(data, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SettingsEntity data, String message)? idle,
    TResult Function(SettingsEntity data, String message)? processing,
    TResult Function(SettingsEntity data, String message)? successful,
    TResult Function(SettingsEntity data, String message)? error,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(data, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IdleSettingsState value) idle,
    required TResult Function(_ProcessingSettingsState value) processing,
    required TResult Function(_SuccessfulSettingsState value) successful,
    required TResult Function(_ErrorSettingsState value) error,
  }) {
    return processing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_IdleSettingsState value)? idle,
    TResult Function(_ProcessingSettingsState value)? processing,
    TResult Function(_SuccessfulSettingsState value)? successful,
    TResult Function(_ErrorSettingsState value)? error,
  }) {
    return processing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IdleSettingsState value)? idle,
    TResult Function(_ProcessingSettingsState value)? processing,
    TResult Function(_SuccessfulSettingsState value)? successful,
    TResult Function(_ErrorSettingsState value)? error,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(this);
    }
    return orElse();
  }
}

abstract class _ProcessingSettingsState extends SettingsState {
  const factory _ProcessingSettingsState(
      {required final SettingsEntity data,
      final String message}) = _$_ProcessingSettingsState;
  const _ProcessingSettingsState._() : super._();

  @override
  SettingsEntity get data;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_ProcessingSettingsStateCopyWith<_$_ProcessingSettingsState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SuccessfulSettingsStateCopyWith<$Res>
    implements $SettingsStateCopyWith<$Res> {
  factory _$$_SuccessfulSettingsStateCopyWith(_$_SuccessfulSettingsState value,
          $Res Function(_$_SuccessfulSettingsState) then) =
      __$$_SuccessfulSettingsStateCopyWithImpl<$Res>;
  @override
  $Res call({SettingsEntity data, String message});
}

/// @nodoc
class __$$_SuccessfulSettingsStateCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res>
    implements _$$_SuccessfulSettingsStateCopyWith<$Res> {
  __$$_SuccessfulSettingsStateCopyWithImpl(_$_SuccessfulSettingsState _value,
      $Res Function(_$_SuccessfulSettingsState) _then)
      : super(_value, (v) => _then(v as _$_SuccessfulSettingsState));

  @override
  _$_SuccessfulSettingsState get _value =>
      super._value as _$_SuccessfulSettingsState;

  @override
  $Res call({
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_SuccessfulSettingsState(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SettingsEntity,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SuccessfulSettingsState extends _SuccessfulSettingsState {
  const _$_SuccessfulSettingsState(
      {required this.data, this.message = 'Successful'})
      : super._();

  @override
  final SettingsEntity data;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'SettingsState.successful(data: $data, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SuccessfulSettingsState &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_SuccessfulSettingsStateCopyWith<_$_SuccessfulSettingsState>
      get copyWith =>
          __$$_SuccessfulSettingsStateCopyWithImpl<_$_SuccessfulSettingsState>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SettingsEntity data, String message) idle,
    required TResult Function(SettingsEntity data, String message) processing,
    required TResult Function(SettingsEntity data, String message) successful,
    required TResult Function(SettingsEntity data, String message) error,
  }) {
    return successful(data, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(SettingsEntity data, String message)? idle,
    TResult Function(SettingsEntity data, String message)? processing,
    TResult Function(SettingsEntity data, String message)? successful,
    TResult Function(SettingsEntity data, String message)? error,
  }) {
    return successful?.call(data, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SettingsEntity data, String message)? idle,
    TResult Function(SettingsEntity data, String message)? processing,
    TResult Function(SettingsEntity data, String message)? successful,
    TResult Function(SettingsEntity data, String message)? error,
    required TResult orElse(),
  }) {
    if (successful != null) {
      return successful(data, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IdleSettingsState value) idle,
    required TResult Function(_ProcessingSettingsState value) processing,
    required TResult Function(_SuccessfulSettingsState value) successful,
    required TResult Function(_ErrorSettingsState value) error,
  }) {
    return successful(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_IdleSettingsState value)? idle,
    TResult Function(_ProcessingSettingsState value)? processing,
    TResult Function(_SuccessfulSettingsState value)? successful,
    TResult Function(_ErrorSettingsState value)? error,
  }) {
    return successful?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IdleSettingsState value)? idle,
    TResult Function(_ProcessingSettingsState value)? processing,
    TResult Function(_SuccessfulSettingsState value)? successful,
    TResult Function(_ErrorSettingsState value)? error,
    required TResult orElse(),
  }) {
    if (successful != null) {
      return successful(this);
    }
    return orElse();
  }
}

abstract class _SuccessfulSettingsState extends SettingsState {
  const factory _SuccessfulSettingsState(
      {required final SettingsEntity data,
      final String message}) = _$_SuccessfulSettingsState;
  const _SuccessfulSettingsState._() : super._();

  @override
  SettingsEntity get data;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_SuccessfulSettingsStateCopyWith<_$_SuccessfulSettingsState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorSettingsStateCopyWith<$Res>
    implements $SettingsStateCopyWith<$Res> {
  factory _$$_ErrorSettingsStateCopyWith(_$_ErrorSettingsState value,
          $Res Function(_$_ErrorSettingsState) then) =
      __$$_ErrorSettingsStateCopyWithImpl<$Res>;
  @override
  $Res call({SettingsEntity data, String message});
}

/// @nodoc
class __$$_ErrorSettingsStateCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res>
    implements _$$_ErrorSettingsStateCopyWith<$Res> {
  __$$_ErrorSettingsStateCopyWithImpl(
      _$_ErrorSettingsState _value, $Res Function(_$_ErrorSettingsState) _then)
      : super(_value, (v) => _then(v as _$_ErrorSettingsState));

  @override
  _$_ErrorSettingsState get _value => super._value as _$_ErrorSettingsState;

  @override
  $Res call({
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_ErrorSettingsState(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as SettingsEntity,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ErrorSettingsState extends _ErrorSettingsState {
  const _$_ErrorSettingsState(
      {required this.data, this.message = 'An error has occurred'})
      : super._();

  @override
  final SettingsEntity data;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'SettingsState.error(data: $data, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ErrorSettingsState &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_ErrorSettingsStateCopyWith<_$_ErrorSettingsState> get copyWith =>
      __$$_ErrorSettingsStateCopyWithImpl<_$_ErrorSettingsState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SettingsEntity data, String message) idle,
    required TResult Function(SettingsEntity data, String message) processing,
    required TResult Function(SettingsEntity data, String message) successful,
    required TResult Function(SettingsEntity data, String message) error,
  }) {
    return error(data, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(SettingsEntity data, String message)? idle,
    TResult Function(SettingsEntity data, String message)? processing,
    TResult Function(SettingsEntity data, String message)? successful,
    TResult Function(SettingsEntity data, String message)? error,
  }) {
    return error?.call(data, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SettingsEntity data, String message)? idle,
    TResult Function(SettingsEntity data, String message)? processing,
    TResult Function(SettingsEntity data, String message)? successful,
    TResult Function(SettingsEntity data, String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(data, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IdleSettingsState value) idle,
    required TResult Function(_ProcessingSettingsState value) processing,
    required TResult Function(_SuccessfulSettingsState value) successful,
    required TResult Function(_ErrorSettingsState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_IdleSettingsState value)? idle,
    TResult Function(_ProcessingSettingsState value)? processing,
    TResult Function(_SuccessfulSettingsState value)? successful,
    TResult Function(_ErrorSettingsState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IdleSettingsState value)? idle,
    TResult Function(_ProcessingSettingsState value)? processing,
    TResult Function(_SuccessfulSettingsState value)? successful,
    TResult Function(_ErrorSettingsState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorSettingsState extends SettingsState {
  const factory _ErrorSettingsState(
      {required final SettingsEntity data,
      final String message}) = _$_ErrorSettingsState;
  const _ErrorSettingsState._() : super._();

  @override
  SettingsEntity get data;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_ErrorSettingsStateCopyWith<_$_ErrorSettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}
