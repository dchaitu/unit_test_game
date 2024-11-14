import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unit_test_game/constants/get_ants.dart';
import 'package:unit_test_game/models/ant.dart';
import 'package:unit_test_game/models/thrower_ant.dart';
import 'package:unit_test_game/providers/providers.dart';
import 'package:unit_test_game/models/tile.dart';
import 'package:unit_test_game/models/bee.dart';

class GameState {
  List<Tile> tiles;
  GameStatus gameStatus;
  int foodAvailable;
  String? selectedAntUrl;
  int beesInHive;

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

  void moveBeeForward(WidgetRef ref) {
    Map<int, List<Tile>> tunnels = ref.read(tunnelFromTilesProvider);
    for (var tiles in tunnels.values) {
      moveForwardEachTunnel(tiles);
    }
  }

  moveForwardEachTunnel(List<Tile> gameTiles) {
    List<Tile> updatedTiles = state.tiles;

    for (int i = 1; i < gameTiles.length; i++) {
      if (gameTiles[i].isBeePresent && !gameTiles[i].isAntPresent) {
        Bee bee = gameTiles[i].bees!.last;
        gameTiles[i].bees!.remove(bee);
        gameTiles[i - 1].bees!.add(bee);
        updatedTiles.map((tile) {
          if (tile.tileKey == gameTiles[i].tileKey)
            return gameTiles[i];
          else if (tile.tileKey == gameTiles[i - 1].tileKey)
            return gameTiles[i - 1];
          return tile;
        }).toList();

        state = state.copyWith(tiles: updatedTiles);
      }
    }
  }

  void addBeeToEnd(WidgetRef ref) {
    print("Calling bees ${DateTime.now()}");

    List<Tile> updatedTiles = state.tiles;
    var endTiles = ref.watch(tileEntranceForBeesProvider);
    for (Tile tile in endTiles) {
      tile.bees!.add(Bee());
    }

    for (Tile tile in endTiles) {
      updatedTiles.map((oldTile) {
        (oldTile.tileKey == tile.tileKey) ? tile : oldTile;
      }).toList();
    }
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

  Ant? reduceHealth(Ant ant) {
    return ant.currHealth > 1
        ? ant.copyWith(currHealth: ant.currHealth - 1)
        : null;
  }

  Bee reduceBeeHealth(Bee bee) {
    return bee.copyWith(currHealth: bee.currHealth - 1);
  }

  void beeStingAnt() {
    var gameTiles = state.tiles;
    for (int i = 0; i < gameTiles.length; i++) {
      if (gameTiles[i].isAntPresent == true &&
          gameTiles[i].isBeePresent == true) {
        for(int j=0;j< gameTiles[i].noOfBees;j++) {
        Ant? newAnt = reduceHealth(gameTiles[i].ant!);
        gameTiles[i].ant = newAnt;
        if (gameTiles[i].ant != null && gameTiles[i].ant!.currHealth <= 0) {
          gameTiles[i].antImagePath = null;
          gameTiles[i].ant = null;
        }
        }
      }
      state = state.copyWith(tiles: gameTiles);
    }
  }

  Tile? nearestBee(Tile tile) {
    int currDis = 0;
    int lowerBound;
    int upperBound;

    if (tile.antImagePath == ShortThrowerAnt.antImagePath) {
      lowerBound = ShortThrowerAnt.lower;
      upperBound = ShortThrowerAnt.upper;
    } else if (tile.antImagePath == LongThrowerAnt.antImagePath) {
      lowerBound = LongThrowerAnt.lower;
      upperBound = LongThrowerAnt.upper;
    } else {
      lowerBound = Ant.lower;
      upperBound = Ant.upper;
    }


    Tile? currentTile = tile;

    while (currentTile != null &&
        (lowerBound <= currDis && currDis <= upperBound)) {
      if (currentTile.isBeePresent) {
        return currentTile;
      } else if (currentTile.nextTile != null) {
        currentTile = currentTile.nextTile;
        currDis++;
      } else {
        break;
      }
    }
    return null;
  }

  void antAttack(Tile tile) {
    var gameTiles = state.tiles;
    Tile? currTile = nearestBee(tile);

    if (currTile != null) {
      var bees = currTile.bees ?? [];
      Bee? bee = bees.isNotEmpty ? bees.last : null;

      if (bee != null) {
        bee = reduceBeeHealth(bee);

        if (bee.currHealth <= 0) {
          bees.removeLast();
        } else {
          bees[bees.length - 1] = bee;
        }

        final updatedTile = currTile.copyWith(bees: bees);
        gameTiles = gameTiles.map((t) {
          return t.tileKey == updatedTile.tileKey ? updatedTile : t;
        }).toList();

        state = state.copyWith(tiles: gameTiles);
      }
    }
  }

  void selectAnt(String imagePath) {
    state = state.copyWith(selectedAntUrl: imagePath);
  }

  void addImgToTile(Tile addAntToTile) {
    int antFoodCost;
    if (addAntToTile.antImagePath == ShortThrowerAnt.antImagePath) {
      antFoodCost = ShortThrowerAnt.food;
    } else if (addAntToTile.antImagePath == LongThrowerAnt.antImagePath) {
      antFoodCost = LongThrowerAnt.food;
    } else {
      antFoodCost = Ant.food;
    }


    var gameTiles = state.tiles;
    var imgPath = state.selectedAntUrl;
    for (int i = 0; i < gameTiles.length; i++) {
      if (gameTiles[i].tileKey == addAntToTile.tileKey &&
          gameTiles[i].isAntPresent == false &&
          state.foodAvailable > 0) {
        gameTiles[i] = gameTiles[i]
            .copyWith(antImagePath: imgPath, ant: getAntFromImage(imgPath!));
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
