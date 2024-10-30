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
  String get antImagePath => throw _privateConstructorUsedError;
  int get damage => throw _privateConstructorUsedError;
  int get currHealth => throw _privateConstructorUsedError;
  int get lower => throw _privateConstructorUsedError;
  int get upper => throw _privateConstructorUsedError;
  int get food => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

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
  $Res call(
      {String antImagePath,
      int damage,
      int currHealth,
      int lower,
      int upper,
      int food,
      String name});
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
    Object? antImagePath = null,
    Object? damage = null,
    Object? currHealth = null,
    Object? lower = null,
    Object? upper = null,
    Object? food = null,
    Object? name = null,
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
      lower: null == lower
          ? _value.lower
          : lower // ignore: cast_nullable_to_non_nullable
              as int,
      upper: null == upper
          ? _value.upper
          : upper // ignore: cast_nullable_to_non_nullable
              as int,
      food: null == food
          ? _value.food
          : food // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AntImplCopyWith<$Res> implements $AntCopyWith<$Res> {
  factory _$$AntImplCopyWith(_$AntImpl value, $Res Function(_$AntImpl) then) =
      __$$AntImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String antImagePath,
      int damage,
      int currHealth,
      int lower,
      int upper,
      int food,
      String name});
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
    Object? antImagePath = null,
    Object? damage = null,
    Object? currHealth = null,
    Object? lower = null,
    Object? upper = null,
    Object? food = null,
    Object? name = null,
  }) {
    return _then(_$AntImpl(
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
      lower: null == lower
          ? _value.lower
          : lower // ignore: cast_nullable_to_non_nullable
              as int,
      upper: null == upper
          ? _value.upper
          : upper // ignore: cast_nullable_to_non_nullable
              as int,
      food: null == food
          ? _value.food
          : food // ignore: cast_nullable_to_non_nullable
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
class _$AntImpl implements _Ant {
  const _$AntImpl(
      {this.antImagePath = ImageAssets.antThrower,
      this.damage = 1,
      this.currHealth = 2,
      this.lower = 0,
      this.upper = 99,
      this.food = 3,
      this.name = "Thrower"});

  factory _$AntImpl.fromJson(Map<String, dynamic> json) =>
      _$$AntImplFromJson(json);

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
  final int lower;
  @override
  @JsonKey()
  final int upper;
  @override
  @JsonKey()
  final int food;
  @override
  @JsonKey()
  final String name;

  @override
  String toString() {
    return 'Ant(antImagePath: $antImagePath, damage: $damage, currHealth: $currHealth, lower: $lower, upper: $upper, food: $food, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AntImpl &&
            (identical(other.antImagePath, antImagePath) ||
                other.antImagePath == antImagePath) &&
            (identical(other.damage, damage) || other.damage == damage) &&
            (identical(other.currHealth, currHealth) ||
                other.currHealth == currHealth) &&
            (identical(other.lower, lower) || other.lower == lower) &&
            (identical(other.upper, upper) || other.upper == upper) &&
            (identical(other.food, food) || other.food == food) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, antImagePath, damage, currHealth, lower, upper, food, name);

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
  const factory _Ant(
      {final String antImagePath,
      final int damage,
      final int currHealth,
      final int lower,
      final int upper,
      final int food,
      final String name}) = _$AntImpl;

  factory _Ant.fromJson(Map<String, dynamic> json) = _$AntImpl.fromJson;

  @override
  String get antImagePath;
  @override
  int get damage;
  @override
  int get currHealth;
  @override
  int get lower;
  @override
  int get upper;
  @override
  int get food;
  @override
  String get name;

  /// Create a copy of Ant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AntImplCopyWith<_$AntImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
