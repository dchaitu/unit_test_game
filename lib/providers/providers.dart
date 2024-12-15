import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:unit_test_game/constants/image_assets.dart';
import 'package:unit_test_game/models/custom_time.dart';
import 'package:unit_test_game/providers/game_state_provider.dart';

import '../models/freezed_models/tile/tile.dart';

List<Tile> allTiles = [
  Tile(
    tileKey: "tileKey_0_0",
    groundTileImgUrl: ImageAssets.groundTile1,
    skyTileImgUrl: ImageAssets.sky1,
    bees: [],
  ),
  Tile(
    tileKey: "tileKey_0_1",
    groundTileImgUrl: ImageAssets.groundTile1,
    skyTileImgUrl: ImageAssets.sky1,
    bees: [],
  ),
  Tile(
    tileKey: "tileKey_0_2",
    groundTileImgUrl: ImageAssets.groundTile1,
    skyTileImgUrl: ImageAssets.sky1,
    bees: [],
  ),
  Tile(
    tileKey: "tileKey_0_3",
    groundTileImgUrl: ImageAssets.groundTile1,
    skyTileImgUrl: ImageAssets.sky1,
    bees: [],
  ),
  Tile(
    tileKey: "tileKey_0_4",
    groundTileImgUrl: ImageAssets.groundTile1,
    skyTileImgUrl: ImageAssets.sky1,
    bees: [],
  ),
  Tile(
    tileKey: "tileKey_1_0",
    groundTileImgUrl: ImageAssets.groundTile1,
    skyTileImgUrl: ImageAssets.sky1,
    bees: [],
  ),
  Tile(
    tileKey: "tileKey_1_1",
    groundTileImgUrl: ImageAssets.groundTile1,
    skyTileImgUrl: ImageAssets.sky1,
    bees: [],
  ),
  Tile(
    tileKey: "tileKey_1_2",
    groundTileImgUrl: ImageAssets.groundTile1,
    skyTileImgUrl: ImageAssets.sky1,
    bees: [],
  ),
  Tile(
    tileKey: "tileKey_1_3",
    groundTileImgUrl: ImageAssets.groundTile1,
    skyTileImgUrl: ImageAssets.sky1,
    bees: [],
  ),
  Tile(
    tileKey: "tileKey_1_4",
    groundTileImgUrl: ImageAssets.groundTile1,
    skyTileImgUrl: ImageAssets.sky1,
    bees: [],
  )
];

final tilesProvider = Provider<List<Tile>>((ref) {
  return allTiles;

});

final tilesExitProvider = Provider<List<Tile>>((ref) {
  final allTiles = ref.watch(gameStateProvider).tiles;
  return allTiles.where((tile)=> tile.tileKey!.split('_')[2]=='0').toList();

});


final tilesWithAntsProvider = Provider((ref) {
  var allTiles = ref.watch(gameStateProvider).tiles;
  return allTiles.where((tile) => tile.isAntPresent==true).toList();
});

final tileProvider = Provider.family<Tile, String>((ref, tileKey) {
  final gameState = ref.watch(gameStateProvider);
  return gameState.tiles.firstWhere((tile) => tile.tileKey == tileKey);
});


final tileEntranceForBeesProvider = Provider((ref) {
  Map<int, List<Tile>> tunnels = ref.watch(gameStateProvider).tunnels;

  List<Tile> endTiles = [];
  for (var tiles in tunnels.values) {

    for (int i = 0; i < tiles.length; i++) {
      if (tiles[i].nextTile == null) {
        endTiles.add(tiles[i]);
      }
    }
  }


  return endTiles;
});

final customTimerProvider = Provider<CustomTimer>((ref) {
  final timer = CustomTimer();
  ref.onDispose(timer.dispose); // Ensure resources are cleaned up
  return timer;
});



