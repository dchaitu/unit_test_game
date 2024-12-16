import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unit_test_game/constants/get_ants.dart';
import 'package:unit_test_game/models/ant.dart';
import 'package:unit_test_game/models/freezed_models/bee/bee.dart';

part 'tile.freezed.dart';
// part 'tile.g.dart';


@freezed
class Tile with _$Tile {
  factory Tile({
    Ant? ant,
    required String tileKey,
    required String groundTileImgUrl,
    required String skyTileImgUrl,
    List<Bee>? bees,
  }) = _Tile;
  // factory Tile.fromJson(Map<String, dynamic> json) => _$TileFromJson(json);

  Tile._();

  String? get antImagePath => ant != null ? getStringFromAnt(ant!) : null;

  int get noOfBees => bees?.length ?? 0;

  bool get isBeePresent => bees != null && bees!.isNotEmpty;

  bool get isAntPresent => ant != null;


}
