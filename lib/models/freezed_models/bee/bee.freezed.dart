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
  int get currHealth => throw _privateConstructorUsedError;
  bool get isMoving => throw _privateConstructorUsedError;

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
  $Res call({int currHealth, bool isMoving});
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
    Object? currHealth = null,
    Object? isMoving = null,
  }) {
    return _then(_value.copyWith(
      currHealth: null == currHealth
          ? _value.currHealth
          : currHealth // ignore: cast_nullable_to_non_nullable
              as int,
      isMoving: null == isMoving
          ? _value.isMoving
          : isMoving // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BeeImplCopyWith<$Res> implements $BeeCopyWith<$Res> {
  factory _$$BeeImplCopyWith(_$BeeImpl value, $Res Function(_$BeeImpl) then) =
      __$$BeeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int currHealth, bool isMoving});
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
    Object? currHealth = null,
    Object? isMoving = null,
  }) {
    return _then(_$BeeImpl(
      currHealth: null == currHealth
          ? _value.currHealth
          : currHealth // ignore: cast_nullable_to_non_nullable
              as int,
      isMoving: null == isMoving
          ? _value.isMoving
          : isMoving // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BeeImpl extends _Bee {
  const _$BeeImpl({this.currHealth = 2, this.isMoving = false}) : super._();

  factory _$BeeImpl.fromJson(Map<String, dynamic> json) =>
      _$$BeeImplFromJson(json);

  @override
  @JsonKey()
  final int currHealth;
  @override
  @JsonKey()
  final bool isMoving;

  @override
  String toString() {
    return 'Bee(currHealth: $currHealth, isMoving: $isMoving)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeeImpl &&
            (identical(other.currHealth, currHealth) ||
                other.currHealth == currHealth) &&
            (identical(other.isMoving, isMoving) ||
                other.isMoving == isMoving));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, currHealth, isMoving);

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

abstract class _Bee extends Bee {
  const factory _Bee({final int currHealth, final bool isMoving}) = _$BeeImpl;
  const _Bee._() : super._();

  factory _Bee.fromJson(Map<String, dynamic> json) = _$BeeImpl.fromJson;

  @override
  int get currHealth;
  @override
  bool get isMoving;

  /// Create a copy of Bee
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BeeImplCopyWith<_$BeeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
