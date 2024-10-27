// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_parameter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AudioParameter _$AudioParameterFromJson(Map<String, dynamic> json) {
  return _AudioParameter.fromJson(json);
}

/// @nodoc
mixin _$AudioParameter {
  int get value => throw _privateConstructorUsedError;
  int get midiMsg => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// Serializes this AudioParameter to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AudioParameter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AudioParameterCopyWith<AudioParameter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioParameterCopyWith<$Res> {
  factory $AudioParameterCopyWith(
          AudioParameter value, $Res Function(AudioParameter) then) =
      _$AudioParameterCopyWithImpl<$Res, AudioParameter>;
  @useResult
  $Res call({int value, int midiMsg, String name});
}

/// @nodoc
class _$AudioParameterCopyWithImpl<$Res, $Val extends AudioParameter>
    implements $AudioParameterCopyWith<$Res> {
  _$AudioParameterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AudioParameter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? midiMsg = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      midiMsg: null == midiMsg
          ? _value.midiMsg
          : midiMsg // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AudioParameterImplCopyWith<$Res>
    implements $AudioParameterCopyWith<$Res> {
  factory _$$AudioParameterImplCopyWith(_$AudioParameterImpl value,
          $Res Function(_$AudioParameterImpl) then) =
      __$$AudioParameterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int value, int midiMsg, String name});
}

/// @nodoc
class __$$AudioParameterImplCopyWithImpl<$Res>
    extends _$AudioParameterCopyWithImpl<$Res, _$AudioParameterImpl>
    implements _$$AudioParameterImplCopyWith<$Res> {
  __$$AudioParameterImplCopyWithImpl(
      _$AudioParameterImpl _value, $Res Function(_$AudioParameterImpl) _then)
      : super(_value, _then);

  /// Create a copy of AudioParameter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? midiMsg = null,
    Object? name = null,
  }) {
    return _then(_$AudioParameterImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      midiMsg: null == midiMsg
          ? _value.midiMsg
          : midiMsg // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AudioParameterImpl implements _AudioParameter {
  const _$AudioParameterImpl(
      {required this.value, required this.midiMsg, required this.name});

  factory _$AudioParameterImpl.fromJson(Map<String, dynamic> json) =>
      _$$AudioParameterImplFromJson(json);

  @override
  final int value;
  @override
  final int midiMsg;
  @override
  final String name;

  @override
  String toString() {
    return 'AudioParameter(value: $value, midiMsg: $midiMsg, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudioParameterImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.midiMsg, midiMsg) || other.midiMsg == midiMsg) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value, midiMsg, name);

  /// Create a copy of AudioParameter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AudioParameterImplCopyWith<_$AudioParameterImpl> get copyWith =>
      __$$AudioParameterImplCopyWithImpl<_$AudioParameterImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AudioParameterImplToJson(
      this,
    );
  }
}

abstract class _AudioParameter implements AudioParameter {
  const factory _AudioParameter(
      {required final int value,
      required final int midiMsg,
      required final String name}) = _$AudioParameterImpl;

  factory _AudioParameter.fromJson(Map<String, dynamic> json) =
      _$AudioParameterImpl.fromJson;

  @override
  int get value;
  @override
  int get midiMsg;
  @override
  String get name;

  /// Create a copy of AudioParameter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AudioParameterImplCopyWith<_$AudioParameterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
