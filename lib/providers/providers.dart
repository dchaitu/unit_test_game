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
  return allTiles.where((tile) => tile.isAntPresent==true).toList();
});


final tileEntranceForBeesProvider = Provider((ref) {
  Map<int, List<Tile>> tunnels = ref.read(gameStateProvider.notifier).groupTilesByTunnel(allTiles);

  List<Tile> endTiles = [];
  for (var tiles in tunnels.values) {
    for (int i = 0; i < tiles.length - 1; i++) {
      tiles[i].nextTile = tiles[i + 1];

      if (tiles[i].nextTile == null) {
        endTiles.add(tiles[i]);
      }
    }
  }

  for (var tiles in tunnels.values) {
    print("Entrance tiles:- $tiles");

    for (int i = 0; i < tiles.length; i++) {
      if (tiles[i].nextTile == null) {
        endTiles.add(tiles[i]);
      }
    }
  }


  return endTiles;
});



