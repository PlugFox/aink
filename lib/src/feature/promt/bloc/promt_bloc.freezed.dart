// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'promt_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PromtEvent {
  String get promt => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String promt) generate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String promt)? generate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String promt)? generate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GeneratePromtEvent value) generate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GeneratePromtEvent value)? generate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeneratePromtEvent value)? generate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PromtEventCopyWith<PromtEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromtEventCopyWith<$Res> {
  factory $PromtEventCopyWith(
          PromtEvent value, $Res Function(PromtEvent) then) =
      _$PromtEventCopyWithImpl<$Res>;
  $Res call({String promt});
}

/// @nodoc
class _$PromtEventCopyWithImpl<$Res> implements $PromtEventCopyWith<$Res> {
  _$PromtEventCopyWithImpl(this._value, this._then);

  final PromtEvent _value;
  // ignore: unused_field
  final $Res Function(PromtEvent) _then;

  @override
  $Res call({
    Object? promt = freezed,
  }) {
    return _then(_value.copyWith(
      promt: promt == freezed
          ? _value.promt
          : promt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$GeneratePromtEventCopyWith<$Res>
    implements $PromtEventCopyWith<$Res> {
  factory _$$GeneratePromtEventCopyWith(_$GeneratePromtEvent value,
          $Res Function(_$GeneratePromtEvent) then) =
      __$$GeneratePromtEventCopyWithImpl<$Res>;
  @override
  $Res call({String promt});
}

/// @nodoc
class __$$GeneratePromtEventCopyWithImpl<$Res>
    extends _$PromtEventCopyWithImpl<$Res>
    implements _$$GeneratePromtEventCopyWith<$Res> {
  __$$GeneratePromtEventCopyWithImpl(
      _$GeneratePromtEvent _value, $Res Function(_$GeneratePromtEvent) _then)
      : super(_value, (v) => _then(v as _$GeneratePromtEvent));

  @override
  _$GeneratePromtEvent get _value => super._value as _$GeneratePromtEvent;

  @override
  $Res call({
    Object? promt = freezed,
  }) {
    return _then(_$GeneratePromtEvent(
      promt: promt == freezed
          ? _value.promt
          : promt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GeneratePromtEvent extends GeneratePromtEvent {
  const _$GeneratePromtEvent({required this.promt}) : super._();

  @override
  final String promt;

  @override
  String toString() {
    return 'PromtEvent.generate(promt: $promt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneratePromtEvent &&
            const DeepCollectionEquality().equals(other.promt, promt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(promt));

  @JsonKey(ignore: true)
  @override
  _$$GeneratePromtEventCopyWith<_$GeneratePromtEvent> get copyWith =>
      __$$GeneratePromtEventCopyWithImpl<_$GeneratePromtEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String promt) generate,
  }) {
    return generate(promt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String promt)? generate,
  }) {
    return generate?.call(promt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String promt)? generate,
    required TResult orElse(),
  }) {
    if (generate != null) {
      return generate(promt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GeneratePromtEvent value) generate,
  }) {
    return generate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GeneratePromtEvent value)? generate,
  }) {
    return generate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GeneratePromtEvent value)? generate,
    required TResult orElse(),
  }) {
    if (generate != null) {
      return generate(this);
    }
    return orElse();
  }
}

abstract class GeneratePromtEvent extends PromtEvent {
  const factory GeneratePromtEvent({required final String promt}) =
      _$GeneratePromtEvent;
  const GeneratePromtEvent._() : super._();

  @override
  String get promt;
  @override
  @JsonKey(ignore: true)
  _$$GeneratePromtEventCopyWith<_$GeneratePromtEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PromtState {
  PromtEntity get data => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PromtEntity data, String message) idle,
    required TResult Function(PromtEntity data, String message) processing,
    required TResult Function(PromtEntity data, String message) successful,
    required TResult Function(PromtEntity data, String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PromtEntity data, String message)? idle,
    TResult Function(PromtEntity data, String message)? processing,
    TResult Function(PromtEntity data, String message)? successful,
    TResult Function(PromtEntity data, String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PromtEntity data, String message)? idle,
    TResult Function(PromtEntity data, String message)? processing,
    TResult Function(PromtEntity data, String message)? successful,
    TResult Function(PromtEntity data, String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IdlePromtState value) idle,
    required TResult Function(ProcessingPromtState value) processing,
    required TResult Function(SuccessfulPromtState value) successful,
    required TResult Function(ErrorPromtState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(IdlePromtState value)? idle,
    TResult Function(ProcessingPromtState value)? processing,
    TResult Function(SuccessfulPromtState value)? successful,
    TResult Function(ErrorPromtState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IdlePromtState value)? idle,
    TResult Function(ProcessingPromtState value)? processing,
    TResult Function(SuccessfulPromtState value)? successful,
    TResult Function(ErrorPromtState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PromtStateCopyWith<PromtState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromtStateCopyWith<$Res> {
  factory $PromtStateCopyWith(
          PromtState value, $Res Function(PromtState) then) =
      _$PromtStateCopyWithImpl<$Res>;
  $Res call({PromtEntity data, String message});
}

/// @nodoc
class _$PromtStateCopyWithImpl<$Res> implements $PromtStateCopyWith<$Res> {
  _$PromtStateCopyWithImpl(this._value, this._then);

  final PromtState _value;
  // ignore: unused_field
  final $Res Function(PromtState) _then;

  @override
  $Res call({
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as PromtEntity,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$IdlePromtStateCopyWith<$Res>
    implements $PromtStateCopyWith<$Res> {
  factory _$$IdlePromtStateCopyWith(
          _$IdlePromtState value, $Res Function(_$IdlePromtState) then) =
      __$$IdlePromtStateCopyWithImpl<$Res>;
  @override
  $Res call({PromtEntity data, String message});
}

/// @nodoc
class __$$IdlePromtStateCopyWithImpl<$Res>
    extends _$PromtStateCopyWithImpl<$Res>
    implements _$$IdlePromtStateCopyWith<$Res> {
  __$$IdlePromtStateCopyWithImpl(
      _$IdlePromtState _value, $Res Function(_$IdlePromtState) _then)
      : super(_value, (v) => _then(v as _$IdlePromtState));

  @override
  _$IdlePromtState get _value => super._value as _$IdlePromtState;

  @override
  $Res call({
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_$IdlePromtState(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as PromtEntity,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$IdlePromtState extends IdlePromtState {
  const _$IdlePromtState({required this.data, this.message = 'Idle'})
      : super._();

  @override
  final PromtEntity data;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'PromtState.idle(data: $data, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdlePromtState &&
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
  _$$IdlePromtStateCopyWith<_$IdlePromtState> get copyWith =>
      __$$IdlePromtStateCopyWithImpl<_$IdlePromtState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PromtEntity data, String message) idle,
    required TResult Function(PromtEntity data, String message) processing,
    required TResult Function(PromtEntity data, String message) successful,
    required TResult Function(PromtEntity data, String message) error,
  }) {
    return idle(data, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PromtEntity data, String message)? idle,
    TResult Function(PromtEntity data, String message)? processing,
    TResult Function(PromtEntity data, String message)? successful,
    TResult Function(PromtEntity data, String message)? error,
  }) {
    return idle?.call(data, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PromtEntity data, String message)? idle,
    TResult Function(PromtEntity data, String message)? processing,
    TResult Function(PromtEntity data, String message)? successful,
    TResult Function(PromtEntity data, String message)? error,
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
    required TResult Function(IdlePromtState value) idle,
    required TResult Function(ProcessingPromtState value) processing,
    required TResult Function(SuccessfulPromtState value) successful,
    required TResult Function(ErrorPromtState value) error,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(IdlePromtState value)? idle,
    TResult Function(ProcessingPromtState value)? processing,
    TResult Function(SuccessfulPromtState value)? successful,
    TResult Function(ErrorPromtState value)? error,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IdlePromtState value)? idle,
    TResult Function(ProcessingPromtState value)? processing,
    TResult Function(SuccessfulPromtState value)? successful,
    TResult Function(ErrorPromtState value)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class IdlePromtState extends PromtState {
  const factory IdlePromtState(
      {required final PromtEntity data,
      final String message}) = _$IdlePromtState;
  const IdlePromtState._() : super._();

  @override
  PromtEntity get data;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$IdlePromtStateCopyWith<_$IdlePromtState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProcessingPromtStateCopyWith<$Res>
    implements $PromtStateCopyWith<$Res> {
  factory _$$ProcessingPromtStateCopyWith(_$ProcessingPromtState value,
          $Res Function(_$ProcessingPromtState) then) =
      __$$ProcessingPromtStateCopyWithImpl<$Res>;
  @override
  $Res call({PromtEntity data, String message});
}

/// @nodoc
class __$$ProcessingPromtStateCopyWithImpl<$Res>
    extends _$PromtStateCopyWithImpl<$Res>
    implements _$$ProcessingPromtStateCopyWith<$Res> {
  __$$ProcessingPromtStateCopyWithImpl(_$ProcessingPromtState _value,
      $Res Function(_$ProcessingPromtState) _then)
      : super(_value, (v) => _then(v as _$ProcessingPromtState));

  @override
  _$ProcessingPromtState get _value => super._value as _$ProcessingPromtState;

  @override
  $Res call({
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_$ProcessingPromtState(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as PromtEntity,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProcessingPromtState extends ProcessingPromtState {
  const _$ProcessingPromtState(
      {required this.data, this.message = 'Processing'})
      : super._();

  @override
  final PromtEntity data;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'PromtState.processing(data: $data, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcessingPromtState &&
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
  _$$ProcessingPromtStateCopyWith<_$ProcessingPromtState> get copyWith =>
      __$$ProcessingPromtStateCopyWithImpl<_$ProcessingPromtState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PromtEntity data, String message) idle,
    required TResult Function(PromtEntity data, String message) processing,
    required TResult Function(PromtEntity data, String message) successful,
    required TResult Function(PromtEntity data, String message) error,
  }) {
    return processing(data, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PromtEntity data, String message)? idle,
    TResult Function(PromtEntity data, String message)? processing,
    TResult Function(PromtEntity data, String message)? successful,
    TResult Function(PromtEntity data, String message)? error,
  }) {
    return processing?.call(data, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PromtEntity data, String message)? idle,
    TResult Function(PromtEntity data, String message)? processing,
    TResult Function(PromtEntity data, String message)? successful,
    TResult Function(PromtEntity data, String message)? error,
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
    required TResult Function(IdlePromtState value) idle,
    required TResult Function(ProcessingPromtState value) processing,
    required TResult Function(SuccessfulPromtState value) successful,
    required TResult Function(ErrorPromtState value) error,
  }) {
    return processing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(IdlePromtState value)? idle,
    TResult Function(ProcessingPromtState value)? processing,
    TResult Function(SuccessfulPromtState value)? successful,
    TResult Function(ErrorPromtState value)? error,
  }) {
    return processing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IdlePromtState value)? idle,
    TResult Function(ProcessingPromtState value)? processing,
    TResult Function(SuccessfulPromtState value)? successful,
    TResult Function(ErrorPromtState value)? error,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(this);
    }
    return orElse();
  }
}

abstract class ProcessingPromtState extends PromtState {
  const factory ProcessingPromtState(
      {required final PromtEntity data,
      final String message}) = _$ProcessingPromtState;
  const ProcessingPromtState._() : super._();

  @override
  PromtEntity get data;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$ProcessingPromtStateCopyWith<_$ProcessingPromtState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessfulPromtStateCopyWith<$Res>
    implements $PromtStateCopyWith<$Res> {
  factory _$$SuccessfulPromtStateCopyWith(_$SuccessfulPromtState value,
          $Res Function(_$SuccessfulPromtState) then) =
      __$$SuccessfulPromtStateCopyWithImpl<$Res>;
  @override
  $Res call({PromtEntity data, String message});
}

/// @nodoc
class __$$SuccessfulPromtStateCopyWithImpl<$Res>
    extends _$PromtStateCopyWithImpl<$Res>
    implements _$$SuccessfulPromtStateCopyWith<$Res> {
  __$$SuccessfulPromtStateCopyWithImpl(_$SuccessfulPromtState _value,
      $Res Function(_$SuccessfulPromtState) _then)
      : super(_value, (v) => _then(v as _$SuccessfulPromtState));

  @override
  _$SuccessfulPromtState get _value => super._value as _$SuccessfulPromtState;

  @override
  $Res call({
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_$SuccessfulPromtState(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as PromtEntity,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SuccessfulPromtState extends SuccessfulPromtState {
  const _$SuccessfulPromtState(
      {required this.data, this.message = 'Successful'})
      : super._();

  @override
  final PromtEntity data;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'PromtState.successful(data: $data, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessfulPromtState &&
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
  _$$SuccessfulPromtStateCopyWith<_$SuccessfulPromtState> get copyWith =>
      __$$SuccessfulPromtStateCopyWithImpl<_$SuccessfulPromtState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PromtEntity data, String message) idle,
    required TResult Function(PromtEntity data, String message) processing,
    required TResult Function(PromtEntity data, String message) successful,
    required TResult Function(PromtEntity data, String message) error,
  }) {
    return successful(data, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PromtEntity data, String message)? idle,
    TResult Function(PromtEntity data, String message)? processing,
    TResult Function(PromtEntity data, String message)? successful,
    TResult Function(PromtEntity data, String message)? error,
  }) {
    return successful?.call(data, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PromtEntity data, String message)? idle,
    TResult Function(PromtEntity data, String message)? processing,
    TResult Function(PromtEntity data, String message)? successful,
    TResult Function(PromtEntity data, String message)? error,
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
    required TResult Function(IdlePromtState value) idle,
    required TResult Function(ProcessingPromtState value) processing,
    required TResult Function(SuccessfulPromtState value) successful,
    required TResult Function(ErrorPromtState value) error,
  }) {
    return successful(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(IdlePromtState value)? idle,
    TResult Function(ProcessingPromtState value)? processing,
    TResult Function(SuccessfulPromtState value)? successful,
    TResult Function(ErrorPromtState value)? error,
  }) {
    return successful?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IdlePromtState value)? idle,
    TResult Function(ProcessingPromtState value)? processing,
    TResult Function(SuccessfulPromtState value)? successful,
    TResult Function(ErrorPromtState value)? error,
    required TResult orElse(),
  }) {
    if (successful != null) {
      return successful(this);
    }
    return orElse();
  }
}

abstract class SuccessfulPromtState extends PromtState {
  const factory SuccessfulPromtState(
      {required final PromtEntity data,
      final String message}) = _$SuccessfulPromtState;
  const SuccessfulPromtState._() : super._();

  @override
  PromtEntity get data;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$SuccessfulPromtStateCopyWith<_$SuccessfulPromtState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorPromtStateCopyWith<$Res>
    implements $PromtStateCopyWith<$Res> {
  factory _$$ErrorPromtStateCopyWith(
          _$ErrorPromtState value, $Res Function(_$ErrorPromtState) then) =
      __$$ErrorPromtStateCopyWithImpl<$Res>;
  @override
  $Res call({PromtEntity data, String message});
}

/// @nodoc
class __$$ErrorPromtStateCopyWithImpl<$Res>
    extends _$PromtStateCopyWithImpl<$Res>
    implements _$$ErrorPromtStateCopyWith<$Res> {
  __$$ErrorPromtStateCopyWithImpl(
      _$ErrorPromtState _value, $Res Function(_$ErrorPromtState) _then)
      : super(_value, (v) => _then(v as _$ErrorPromtState));

  @override
  _$ErrorPromtState get _value => super._value as _$ErrorPromtState;

  @override
  $Res call({
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_$ErrorPromtState(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as PromtEntity,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorPromtState extends ErrorPromtState {
  const _$ErrorPromtState(
      {required this.data, this.message = 'An error has occurred'})
      : super._();

  @override
  final PromtEntity data;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'PromtState.error(data: $data, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorPromtState &&
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
  _$$ErrorPromtStateCopyWith<_$ErrorPromtState> get copyWith =>
      __$$ErrorPromtStateCopyWithImpl<_$ErrorPromtState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PromtEntity data, String message) idle,
    required TResult Function(PromtEntity data, String message) processing,
    required TResult Function(PromtEntity data, String message) successful,
    required TResult Function(PromtEntity data, String message) error,
  }) {
    return error(data, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PromtEntity data, String message)? idle,
    TResult Function(PromtEntity data, String message)? processing,
    TResult Function(PromtEntity data, String message)? successful,
    TResult Function(PromtEntity data, String message)? error,
  }) {
    return error?.call(data, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PromtEntity data, String message)? idle,
    TResult Function(PromtEntity data, String message)? processing,
    TResult Function(PromtEntity data, String message)? successful,
    TResult Function(PromtEntity data, String message)? error,
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
    required TResult Function(IdlePromtState value) idle,
    required TResult Function(ProcessingPromtState value) processing,
    required TResult Function(SuccessfulPromtState value) successful,
    required TResult Function(ErrorPromtState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(IdlePromtState value)? idle,
    TResult Function(ProcessingPromtState value)? processing,
    TResult Function(SuccessfulPromtState value)? successful,
    TResult Function(ErrorPromtState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IdlePromtState value)? idle,
    TResult Function(ProcessingPromtState value)? processing,
    TResult Function(SuccessfulPromtState value)? successful,
    TResult Function(ErrorPromtState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorPromtState extends PromtState {
  const factory ErrorPromtState(
      {required final PromtEntity data,
      final String message}) = _$ErrorPromtState;
  const ErrorPromtState._() : super._();

  @override
  PromtEntity get data;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$ErrorPromtStateCopyWith<_$ErrorPromtState> get copyWith =>
      throw _privateConstructorUsedError;
}
