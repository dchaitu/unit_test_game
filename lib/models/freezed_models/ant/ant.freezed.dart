// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Ant _$AntFromJson(Map<String, dynamic> json) {
  return _Ant.fromJson(json);
}

/// @nodoc
mixin _$Ant {
  int get currHealth => throw _privateConstructorUsedError;

  /// Serializes this Ant to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Ant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AntCopyWith<Ant> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AntCopyWith<$Res> {
  factory $AntCopyWith(Ant value, $Res Function(Ant) then) =
      _$AntCopyWithImpl<$Res, Ant>;
  @useResult
  $Res call({int currHealth});
}

/// @nodoc
class _$AntCopyWithImpl<$Res, $Val extends Ant> implements $AntCopyWith<$Res> {
  _$AntCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Ant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currHealth = null,
  }) {
    return _then(_value.copyWith(
      currHealth: null == currHealth
          ? _value.currHealth
          : currHealth // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AntImplCopyWith<$Res> implements $AntCopyWith<$Res> {
  factory _$$AntImplCopyWith(_$AntImpl value, $Res Function(_$AntImpl) then) =
      __$$AntImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int currHealth});
}

/// @nodoc
class __$$AntImplCopyWithImpl<$Res> extends _$AntCopyWithImpl<$Res, _$AntImpl>
    implements _$$AntImplCopyWith<$Res> {
  __$$AntImplCopyWithImpl(_$AntImpl _value, $Res Function(_$AntImpl) _then)
      : super(_value, _then);

  /// Create a copy of Ant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currHealth = null,
  }) {
    return _then(_$AntImpl(
      currHealth: null == currHealth
          ? _value.currHealth
          : currHealth // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AntImpl implements _Ant {
  const _$AntImpl({this.currHealth = 2});

  factory _$AntImpl.fromJson(Map<String, dynamic> json) =>
      _$$AntImplFromJson(json);

  @override
  @JsonKey()
  final int currHealth;

  @override
  String toString() {
    return 'Ant(currHealth: $currHealth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AntImpl &&
            (identical(other.currHealth, currHealth) ||
                other.currHealth == currHealth));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, currHealth);

  /// Create a copy of Ant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AntImplCopyWith<_$AntImpl> get copyWith =>
      __$$AntImplCopyWithImpl<_$AntImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AntImplToJson(
      this,
    );
  }
}

abstract class _Ant implements Ant {
  const factory _Ant({final int currHealth}) = _$AntImpl;

  factory _Ant.fromJson(Map<String, dynamic> json) = _$AntImpl.fromJson;

  @override
  int get currHealth;

  /// Create a copy of Ant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AntImplCopyWith<_$AntImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
