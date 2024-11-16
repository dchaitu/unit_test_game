// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Tile {
  String? get tileKey => throw _privateConstructorUsedError;
  Ant? get ant => throw _privateConstructorUsedError;
  String get groundTileImgUrl => throw _privateConstructorUsedError;
  String get skyTileImgUrl => throw _privateConstructorUsedError;
  List<Bee>? get bees => throw _privateConstructorUsedError;
  Tile? get nextTile => throw _privateConstructorUsedError;

  /// Create a copy of Tile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TileCopyWith<Tile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TileCopyWith<$Res> {
  factory $TileCopyWith(Tile value, $Res Function(Tile) then) =
      _$TileCopyWithImpl<$Res, Tile>;
  @useResult
  $Res call(
      {String? tileKey,
      Ant? ant,
      String groundTileImgUrl,
      String skyTileImgUrl,
      List<Bee>? bees,
      Tile? nextTile});

  $TileCopyWith<$Res>? get nextTile;
}

/// @nodoc
class _$TileCopyWithImpl<$Res, $Val extends Tile>
    implements $TileCopyWith<$Res> {
  _$TileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Tile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tileKey = freezed,
    Object? ant = freezed,
    Object? groundTileImgUrl = null,
    Object? skyTileImgUrl = null,
    Object? bees = freezed,
    Object? nextTile = freezed,
  }) {
    return _then(_value.copyWith(
      tileKey: freezed == tileKey
          ? _value.tileKey
          : tileKey // ignore: cast_nullable_to_non_nullable
              as String?,
      ant: freezed == ant
          ? _value.ant
          : ant // ignore: cast_nullable_to_non_nullable
              as Ant?,
      groundTileImgUrl: null == groundTileImgUrl
          ? _value.groundTileImgUrl
          : groundTileImgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      skyTileImgUrl: null == skyTileImgUrl
          ? _value.skyTileImgUrl
          : skyTileImgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      bees: freezed == bees
          ? _value.bees
          : bees // ignore: cast_nullable_to_non_nullable
              as List<Bee>?,
      nextTile: freezed == nextTile
          ? _value.nextTile
          : nextTile // ignore: cast_nullable_to_non_nullable
              as Tile?,
    ) as $Val);
  }

  /// Create a copy of Tile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TileCopyWith<$Res>? get nextTile {
    if (_value.nextTile == null) {
      return null;
    }

    return $TileCopyWith<$Res>(_value.nextTile!, (value) {
      return _then(_value.copyWith(nextTile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TileImplCopyWith<$Res> implements $TileCopyWith<$Res> {
  factory _$$TileImplCopyWith(
          _$TileImpl value, $Res Function(_$TileImpl) then) =
      __$$TileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? tileKey,
      Ant? ant,
      String groundTileImgUrl,
      String skyTileImgUrl,
      List<Bee>? bees,
      Tile? nextTile});

  @override
  $TileCopyWith<$Res>? get nextTile;
}

/// @nodoc
class __$$TileImplCopyWithImpl<$Res>
    extends _$TileCopyWithImpl<$Res, _$TileImpl>
    implements _$$TileImplCopyWith<$Res> {
  __$$TileImplCopyWithImpl(_$TileImpl _value, $Res Function(_$TileImpl) _then)
      : super(_value, _then);

  /// Create a copy of Tile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tileKey = freezed,
    Object? ant = freezed,
    Object? groundTileImgUrl = null,
    Object? skyTileImgUrl = null,
    Object? bees = freezed,
    Object? nextTile = freezed,
  }) {
    return _then(_$TileImpl(
      tileKey: freezed == tileKey
          ? _value.tileKey
          : tileKey // ignore: cast_nullable_to_non_nullable
              as String?,
      ant: freezed == ant
          ? _value.ant
          : ant // ignore: cast_nullable_to_non_nullable
              as Ant?,
      groundTileImgUrl: null == groundTileImgUrl
          ? _value.groundTileImgUrl
          : groundTileImgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      skyTileImgUrl: null == skyTileImgUrl
          ? _value.skyTileImgUrl
          : skyTileImgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      bees: freezed == bees
          ? _value._bees
          : bees // ignore: cast_nullable_to_non_nullable
              as List<Bee>?,
      nextTile: freezed == nextTile
          ? _value.nextTile
          : nextTile // ignore: cast_nullable_to_non_nullable
              as Tile?,
    ));
  }
}

/// @nodoc

class _$TileImpl extends _Tile {
  _$TileImpl(
      {this.tileKey,
      this.ant,
      required this.groundTileImgUrl,
      required this.skyTileImgUrl,
      final List<Bee>? bees,
      this.nextTile})
      : _bees = bees,
        super._();

  @override
  final String? tileKey;
  @override
  final Ant? ant;
  @override
  final String groundTileImgUrl;
  @override
  final String skyTileImgUrl;
  final List<Bee>? _bees;
  @override
  List<Bee>? get bees {
    final value = _bees;
    if (value == null) return null;
    if (_bees is EqualUnmodifiableListView) return _bees;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Tile? nextTile;

  @override
  String toString() {
    return 'Tile(tileKey: $tileKey, ant: $ant, groundTileImgUrl: $groundTileImgUrl, skyTileImgUrl: $skyTileImgUrl, bees: $bees, nextTile: $nextTile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TileImpl &&
            (identical(other.tileKey, tileKey) || other.tileKey == tileKey) &&
            (identical(other.ant, ant) || other.ant == ant) &&
            (identical(other.groundTileImgUrl, groundTileImgUrl) ||
                other.groundTileImgUrl == groundTileImgUrl) &&
            (identical(other.skyTileImgUrl, skyTileImgUrl) ||
                other.skyTileImgUrl == skyTileImgUrl) &&
            const DeepCollectionEquality().equals(other._bees, _bees) &&
            (identical(other.nextTile, nextTile) ||
                other.nextTile == nextTile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tileKey, ant, groundTileImgUrl,
      skyTileImgUrl, const DeepCollectionEquality().hash(_bees), nextTile);

  /// Create a copy of Tile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TileImplCopyWith<_$TileImpl> get copyWith =>
      __$$TileImplCopyWithImpl<_$TileImpl>(this, _$identity);
}

abstract class _Tile extends Tile {
  factory _Tile(
      {final String? tileKey,
      final Ant? ant,
      required final String groundTileImgUrl,
      required final String skyTileImgUrl,
      final List<Bee>? bees,
      final Tile? nextTile}) = _$TileImpl;
  _Tile._() : super._();

  @override
  String? get tileKey;
  @override
  Ant? get ant;
  @override
  String get groundTileImgUrl;
  @override
  String get skyTileImgUrl;
  @override
  List<Bee>? get bees;
  @override
  Tile? get nextTile;

  /// Create a copy of Tile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TileImplCopyWith<_$TileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
