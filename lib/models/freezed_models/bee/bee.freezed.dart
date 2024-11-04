// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bee.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Bee _$BeeFromJson(Map<String, dynamic> json) {
  return _Bee.fromJson(json);
}

/// @nodoc
mixin _$Bee {
  String get antImagePath => throw _privateConstructorUsedError;
  int get damage => throw _privateConstructorUsedError;
  int get currHealth => throw _privateConstructorUsedError;
  int get maxHealth => throw _privateConstructorUsedError;

  /// Serializes this Bee to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Bee
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BeeCopyWith<Bee> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeeCopyWith<$Res> {
  factory $BeeCopyWith(Bee value, $Res Function(Bee) then) =
      _$BeeCopyWithImpl<$Res, Bee>;
  @useResult
  $Res call({String antImagePath, int damage, int currHealth, int maxHealth});
}

/// @nodoc
class _$BeeCopyWithImpl<$Res, $Val extends Bee> implements $BeeCopyWith<$Res> {
  _$BeeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Bee
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? antImagePath = null,
    Object? damage = null,
    Object? currHealth = null,
    Object? maxHealth = null,
  }) {
    return _then(_value.copyWith(
      antImagePath: null == antImagePath
          ? _value.antImagePath
          : antImagePath // ignore: cast_nullable_to_non_nullable
              as String,
      damage: null == damage
          ? _value.damage
          : damage // ignore: cast_nullable_to_non_nullable
              as int,
      currHealth: null == currHealth
          ? _value.currHealth
          : currHealth // ignore: cast_nullable_to_non_nullable
              as int,
      maxHealth: null == maxHealth
          ? _value.maxHealth
          : maxHealth // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BeeImplCopyWith<$Res> implements $BeeCopyWith<$Res> {
  factory _$$BeeImplCopyWith(_$BeeImpl value, $Res Function(_$BeeImpl) then) =
      __$$BeeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String antImagePath, int damage, int currHealth, int maxHealth});
}

/// @nodoc
class __$$BeeImplCopyWithImpl<$Res> extends _$BeeCopyWithImpl<$Res, _$BeeImpl>
    implements _$$BeeImplCopyWith<$Res> {
  __$$BeeImplCopyWithImpl(_$BeeImpl _value, $Res Function(_$BeeImpl) _then)
      : super(_value, _then);

  /// Create a copy of Bee
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? antImagePath = null,
    Object? damage = null,
    Object? currHealth = null,
    Object? maxHealth = null,
  }) {
    return _then(_$BeeImpl(
      antImagePath: null == antImagePath
          ? _value.antImagePath
          : antImagePath // ignore: cast_nullable_to_non_nullable
              as String,
      damage: null == damage
          ? _value.damage
          : damage // ignore: cast_nullable_to_non_nullable
              as int,
      currHealth: null == currHealth
          ? _value.currHealth
          : currHealth // ignore: cast_nullable_to_non_nullable
              as int,
      maxHealth: null == maxHealth
          ? _value.maxHealth
          : maxHealth // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BeeImpl implements _Bee {
  const _$BeeImpl(
      {this.antImagePath = ImageAssets.bee,
      this.damage = 1,
      this.currHealth = 2,
      this.maxHealth = 2});

  factory _$BeeImpl.fromJson(Map<String, dynamic> json) =>
      _$$BeeImplFromJson(json);

  @override
  @JsonKey()
  final String antImagePath;
  @override
  @JsonKey()
  final int damage;
  @override
  @JsonKey()
  final int currHealth;
  @override
  @JsonKey()
  final int maxHealth;

  @override
  String toString() {
    return 'Bee(antImagePath: $antImagePath, damage: $damage, currHealth: $currHealth, maxHealth: $maxHealth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeeImpl &&
            (identical(other.antImagePath, antImagePath) ||
                other.antImagePath == antImagePath) &&
            (identical(other.damage, damage) || other.damage == damage) &&
            (identical(other.currHealth, currHealth) ||
                other.currHealth == currHealth) &&
            (identical(other.maxHealth, maxHealth) ||
                other.maxHealth == maxHealth));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, antImagePath, damage, currHealth, maxHealth);

  /// Create a copy of Bee
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BeeImplCopyWith<_$BeeImpl> get copyWith =>
      __$$BeeImplCopyWithImpl<_$BeeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BeeImplToJson(
      this,
    );
  }
}

abstract class _Bee implements Bee {
  const factory _Bee(
      {final String antImagePath,
      final int damage,
      final int currHealth,
      final int maxHealth}) = _$BeeImpl;

  factory _Bee.fromJson(Map<String, dynamic> json) = _$BeeImpl.fromJson;

  @override
  String get antImagePath;
  @override
  int get damage;
  @override
  int get currHealth;
  @override
  int get maxHealth;

  /// Create a copy of Bee
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BeeImplCopyWith<_$BeeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
