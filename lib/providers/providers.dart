import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/image_assets.dart';
import 'game_state_provider.dart';
import '../models/tile.dart';

List<Tile> allTiles = [
  Tile(
    tileKey: "tileKey_0_0",
    antImagePath: null,
    groundTileImgUrl: ImageAssets.groundTile1,
    skyTileImgUrl: ImageAssets.sky1,
    bees: [],
  ),
  Tile(
    tileKey: "tileKey_0_1",
    antImagePath: null,
    groundTileImgUrl: ImageAssets.groundTile1,
    skyTileImgUrl: ImageAssets.sky1,
    bees: [],
  ),
  Tile(
    tileKey: "tileKey_0_2",
    antImagePath: null,
    groundTileImgUrl: ImageAssets.groundTile1,
    skyTileImgUrl: ImageAssets.sky1,
    bees: [],
  ),
  Tile(
    tileKey: "tileKey_0_3",
    antImagePath: null,
    groundTileImgUrl: ImageAssets.groundTile1,
    skyTileImgUrl: ImageAssets.sky1,
    bees: [],
  ),
  Tile(
    tileKey: "tileKey_0_4",
    antImagePath: null,
    groundTileImgUrl: ImageAssets.groundTile1,
    skyTileImgUrl: ImageAssets.sky1,
    bees: [],
  ),
  Tile(
    tileKey: "tileKey_1_0",
    antImagePath: null,
    groundTileImgUrl: ImageAssets.groundTile1,
    skyTileImgUrl: ImageAssets.sky1,
    bees: [],
  ),
  Tile(
    tileKey: "tileKey_1_1",
    antImagePath: null,
    groundTileImgUrl: ImageAssets.groundTile1,
    skyTileImgUrl: ImageAssets.sky1,
    bees: [],
  ),
  Tile(
    tileKey: "tileKey_1_2",
    antImagePath: null,
    groundTileImgUrl: ImageAssets.groundTile1,
    skyTileImgUrl: ImageAssets.sky1,
    bees: [],
  ),
  Tile(
    tileKey: "tileKey_1_3",
    antImagePath: null,
    groundTileImgUrl: ImageAssets.groundTile1,
    skyTileImgUrl: ImageAssets.sky1,
    bees: [],
  ),
  Tile(
    tileKey: "tileKey_1_4",
    antImagePath: null,
    groundTileImgUrl: ImageAssets.groundTile1,
    skyTileImgUrl: ImageAssets.sky1,
    bees: [],
  )
];

final tilesProvider = Provider<List<Tile>>((ref) {
  return allTiles;

});

final tilesExitProvider = Provider<List<Tile>>((ref) {
  return allTiles.where((tile)=> tile.tileKey!.split('_')[2]=='0').toList();

});


final tilesWithAntsProvider = Provider((ref) {
  var allTiles = ref.watch(gameStateProvider).tiles;
  return allTiles.where((tile) => tile.isAntPresent==true).toList();
});



final tunnelFromTilesProvider = Provider((ref) {
    Map<int, List<Tile>> tunnels = {};
    var tiles = ref.watch(gameStateProvider).tiles;


    for (Tile tile in tiles) {
      int row = int.parse(tile.tileKey!.split('_')[1]);

      if (!tunnels.containsKey(row)) {
        tunnels[row] = [];
      }
      tunnels[row]!.add(tile);
    }

    return tunnels;

});


final tileEntranceForBeesProvider = Provider((ref) {
  Map<int, List<Tile>> tunnels = ref.read(tunnelFromTilesProvider);

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



