import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unit_test_game/constants/get_ants.dart';
import 'package:unit_test_game/models/ant.dart';
import 'package:unit_test_game/models/freezed_models/bee/bee.dart';
import 'package:unit_test_game/models/freezed_models/tile/tile.dart';
import 'package:unit_test_game/models/thrower_ant.dart';
import 'package:unit_test_game/providers/providers.dart';

class GameState {
  List<Tile> tiles;
  GameStatus gameStatus;
  int foodAvailable;
  String? selectedAntUrl;
  int beesInHive;
  Map<int, List<Tile>> get tunnels => createTilesAndTunnel();

  GameState(
      {required this.tiles,
      required this.gameStatus,
      required this.foodAvailable,
      this.selectedAntUrl,
      required this.beesInHive});

  GameState copyWith(
      {List<Tile>? tiles,
      GameStatus? gameStatus,
      int? countDown,
      String? selectedAntUrl,
      int? foodAvailable,
      int? beesInHive}) {
    return GameState(
      tiles: tiles ?? this.tiles,
      gameStatus: gameStatus ?? this.gameStatus,
      selectedAntUrl: selectedAntUrl ?? this.selectedAntUrl,
      foodAvailable: foodAvailable ?? this.foodAvailable,
      beesInHive: beesInHive ?? this.beesInHive,
    );
  }

  Map<int, List<Tile>> createTilesAndTunnel() {
    Map<int, List<Tile>> tunnels = {};
    List<Tile> tiles = this.tiles;

    for (int i = 0; i < tiles.length; i++) {
      int row = int.parse(tiles[i].tileKey!.split('_')[1]);

      if (!tunnels.containsKey(row)) {
        tunnels[row] = [];
      }
      tunnels[row]!.add(tiles[i]);
      if (i + 1 < tiles.length) {
        int nextTileRow = int.parse(tiles[i + 1].tileKey!.split('_')[1]);
        if (row == nextTileRow) {
          tiles[i] = tiles[i].copyWith(nextTile: tiles[i + 1]);
        }
      }
    }

    return tunnels;
  }
}

class GameStatus {
  bool beesWon;
  bool antsWon;

  bool get gameCompleted => antsWon || beesWon;

  GameStatus({this.beesWon = false, this.antsWon = false});

  GameStatus copyWith({bool? beesWon, bool? antsWon}) {
    return GameStatus(
      beesWon: beesWon ?? this.beesWon,
      antsWon: antsWon ?? this.antsWon,
    );
  }

  @override
  String toString() {
    return "antsWon:- $antsWon beesWon:- $beesWon";
  }
}

final gameStateProvider =
    StateNotifierProvider<GameStateNotifier, GameState>((ref) {
  return GameStateNotifier(
    gameState: GameState(
        tiles: ref.watch(tilesProvider),
        gameStatus: GameStatus(),
        foodAvailable: 50,
        beesInHive: 10),
  );
});

class GameStateNotifier extends StateNotifier<GameState> {
  GameStateNotifier({gameState}) : super(gameState);

  void beesWonGameState() => state =
      state.copyWith(gameStatus: state.gameStatus.copyWith(beesWon: true));

  void antsWonGameState() => state =
      state.copyWith(gameStatus: state.gameStatus.copyWith(antsWon: true));

  void updateTiles(List<Tile> newTiles) {
    state = state.copyWith(tiles: newTiles);
  }

  void moveBeeForward() {
    var tunnels = state.tunnels;
    for (var tiles in tunnels.values) {
      // print("updated Tiles ${tiles}");
      moveBeeForwardEachTunnel(tiles);
    }
  }

  void moveBeeForwardEachTunnel(List<Tile> gameTiles) {
    List<Tile> updatedTiles = [...state.tiles];
    for (int i = 0; i < state.tiles.length; i++) {
      // print("MU: Tile ${state.tiles[i].tileKey} Bees: ${state.tiles[i].noOfBees} Ant Health: ${state.tiles[i].ant?.currHealth} ${state.tiles[i].isAntPresent}");
    }


    for (int i = 1; i < gameTiles.length; i++) {
      // print("M: Tile ${gameTiles[i].tileKey} Bees: ${gameTiles[i].noOfBees} Ant Health: ${gameTiles[i].ant?.currHealth} ${gameTiles[i].isAntPresent}");
      if (gameTiles[i].isBeePresent && !gameTiles[i].isAntPresent) {
        // Bee bee = gameTiles[i].bees!.last;
        var presentBees =
            gameTiles[i].bees?.sublist(0, gameTiles[i].bees!.length);
        gameTiles[i] = gameTiles[i].copyWith(bees: []);
        // Adding to next Tile
        gameTiles[i - 1] =
            gameTiles[i - 1].copyWith(bees: [...?gameTiles[i - 1].bees, ...?presentBees]);
        updatedTiles = updatedTiles.map((tile) {
          if (tile.tileKey == gameTiles[i].tileKey)
            return gameTiles[i];
          else if (tile.tileKey == gameTiles[i - 1].tileKey)
            return gameTiles[i - 1];
          return tile;
        }).toList();
      }
    }
    state = state.copyWith(tiles: updatedTiles);
  }

  void addBeeToEnd(WidgetRef ref) {
    print("Calling bees ${DateTime.now()}");

    List<Tile> updatedTiles = state.tiles;
    var endTiles = ref.read(tileEntranceForBeesProvider);
    updatedTiles = updatedTiles.map((oldTile) {
      if (endTiles.any((endTile) => endTile.tileKey == oldTile.tileKey)) {
        return oldTile.copyWith(bees: <Bee>[...oldTile.bees!, Bee()]);
      }
      return oldTile;
    }).toList();

    var currBees = state.beesInHive - endTiles.length;
    state = state.copyWith(tiles: updatedTiles, beesInHive: currBees);
  }

  void showTileDetails() {
    var gameTiles = state.tiles;

    for (int i = 0; i < gameTiles.length; i++) {
      print(
          "isAntPresent: ${gameTiles[i].isAntPresent}, antImagePath: ${gameTiles[i].antImagePath}, Bees: ${gameTiles[i].noOfBees}, isBeePresent: ${gameTiles[i].isBeePresent} TileKey: ${gameTiles[i].tileKey} NextKey: ${gameTiles[i].nextTile?.tileKey}");
    }
  }

  Ant? reduceHealth(Ant ant, int noOfBees) {
    int newHealth = ant.currHealth - 1 * noOfBees;
    return newHealth >= 1 ? ant.copyWith(currHealth: newHealth) : null;
  }

  Bee? reduceBeeHealth(Bee bee) {
    return bee.currHealth >= 1
        ? bee.copyWith(currHealth: bee.currHealth - 1)
        : null;
  }

  void beeStingAnt() {
    List<Tile> gameTiles = [...state.tiles];
    for (int i = 0; i < gameTiles.length; i++) {
      if (gameTiles[i].isAntPresent && gameTiles[i].isBeePresent) {
        print(
            "Before Attack Tile ${gameTiles[i].tileKey} Bees: ${gameTiles[i].noOfBees} Ant Health: ${gameTiles[i].ant?.currHealth} ${gameTiles[i].isAntPresent}");
        Ant? newAnt = reduceHealth(gameTiles[i].ant!, gameTiles[i].noOfBees);
        if (newAnt != null && newAnt.currHealth <= 0) {
          throw Error();
        }
        gameTiles[i] = gameTiles[i].copyWith(ant: newAnt);
        print(
            "After Attack Tile ${gameTiles[i].tileKey} Bees: ${gameTiles[i].noOfBees} Ant Health: ${gameTiles[i].ant?.currHealth} ${gameTiles[i].isAntPresent}");
      } else {
        print("Tile ${gameTiles[i].tileKey} Bees: ${gameTiles[i].noOfBees} Ant Health: ${gameTiles[i].ant?.currHealth} ${gameTiles[i].isAntPresent}");

      }
    }
    state = state.copyWith(tiles: gameTiles);
    for (int i = 0; i < state.tiles.length; i++) {
      print("BA: Tile ${state.tiles[i].tileKey} Bees: ${state.tiles[i].noOfBees} Ant Health: ${state.tiles[i].ant?.currHealth} ${state.tiles[i].isAntPresent}");
    }
  }

  Tile? nearestBeeToAnt(Tile currentTile) {
    int currDis = 0;
    int lowerBound;
    int upperBound;
    var updatedTiles = state.tiles;
    for(Tile tile in updatedTiles) {
      if (tile.tileKey == currentTile.tileKey) {
        print("nearest Bee for currTile ${tile.tileKey} Bees: ${tile.noOfBees} Ant Health: ${tile.ant?.currHealth} ${tile.isAntPresent}");
        currentTile = tile;
      }
    }

    if (currentTile.antImagePath == ShortThrowerAnt.antImagePath) {
      lowerBound = ShortThrowerAnt.lower;
      upperBound = ShortThrowerAnt.upper;
    } else if (currentTile.antImagePath == LongThrowerAnt.antImagePath) {
      lowerBound = LongThrowerAnt.lower;
      upperBound = LongThrowerAnt.upper;
    } else {
      lowerBound = Ant.lower;
      upperBound = Ant.upper;
    }

    // Tile? currentTile = tile;
    state = state.copyWith(tiles: updatedTiles);
    // TODO: REMOVE nextTile
    while (
        (lowerBound <= currDis && currDis <= upperBound)) {
      if (currentTile.isBeePresent) {
        return currentTile;
      } else if (currentTile.nextTile != null) {
        currentTile = currentTile.nextTile!;
        currDis++;
      } else {
        break;
      }
    }
    return null;
  }


  void antsAttackBees() {
    for (int i = 0; i < state.tiles.length; i++) {
      print("AB1: Tile ${state.tiles[i].tileKey} Bees: ${state.tiles[i].noOfBees} Ant Health: ${state.tiles[i].ant?.currHealth} ${state.tiles[i].isAntPresent}");
    }
    // TODO: There is a bug is in the attack check once
    var gameTiles = state.tiles;
    var tilesWithAnts = state.tiles.where((tile) => tile.isAntPresent).toList();
    for (int i = 0; i < tilesWithAnts.length; i++) {
      print("tilesWithAnts: Tile ${tilesWithAnts[i].tileKey} Bees: ${tilesWithAnts[i].noOfBees} Ant Health: ${tilesWithAnts[i].ant?.currHealth} ${tilesWithAnts[i].isAntPresent}");
    }
    for (Tile tile in tilesWithAnts) {
      Tile? currTile = nearestBeeToAnt(tile);
      if (currTile != null) {
        var bees = currTile.bees ?? [];
        Bee? bee = bees.isNotEmpty ? bees.last : null;

        if (bee != null) {
          bee = reduceBeeHealth(bee);
          List<Bee> updatedBees = bees.sublist(0, bees.length - 1);
          if (bee!.currHealth > 0) {
            updatedBees.add(bee);
          }
          print("Before update currTile ${currTile.tileKey} Bees: ${currTile.noOfBees} Ant Health: ${currTile.ant?.currHealth} ${currTile.isAntPresent}");
          currTile = currTile.copyWith(bees: updatedBees);
        }

        gameTiles = gameTiles.map(
                (t) =>  t.tileKey == currTile!.tileKey ? currTile : t
        ).toList();

        state = state.copyWith(tiles: gameTiles);
      }
    }
    for (int i = 0; i < state.tiles.length; i++) {
      print("AB2: Tile ${state.tiles[i].tileKey} Bees: ${state.tiles[i].noOfBees} Ant Health: ${state.tiles[i].ant?.currHealth} ${state.tiles[i].isAntPresent}");
    }
  }

  void selectAnt(String imagePath) {
    state = state.copyWith(selectedAntUrl: imagePath);
  }

  void addImgToTile(Tile addAntToTile) {
    int antFoodCost;
    List<Tile> gameTiles = state.tiles;
    String? selectedImgPath = state.selectedAntUrl;

    if (selectedImgPath == ShortThrowerAnt.antImagePath) {
      antFoodCost = ShortThrowerAnt.food;
    } else if (selectedImgPath == LongThrowerAnt.antImagePath) {
      antFoodCost = LongThrowerAnt.food;
    } else {
      antFoodCost = Ant.food;
    }

    for (int i = 0; i < gameTiles.length; i++) {
      if (gameTiles[i].tileKey == addAntToTile.tileKey &&
          gameTiles[i].isAntPresent == false &&
          state.foodAvailable > 0) {
        gameTiles[i] =
            gameTiles[i].copyWith(ant: getAntFromImage(selectedImgPath!));
        var currFoodAvailable = state.foodAvailable - antFoodCost;
        if (currFoodAvailable > 0) {
          state = state.copyWith(foodAvailable: currFoodAvailable);
        } else {
          print("Insufficient food");
        }
      }
    }

    state = state.copyWith(tiles: gameTiles);
  }
}
