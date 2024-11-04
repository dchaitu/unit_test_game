import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unit_test_game/constants/get_ants.dart';
import 'package:unit_test_game/models/ant.dart';
import 'package:unit_test_game/providers/providers.dart';
import 'package:unit_test_game/models/tile.dart';
import 'package:unit_test_game/models/bee.dart';

class GameState {
  List<Tile> tiles;
  GameStatus gameStatus;
  int countDown;
  int foodAvailable;
  String? selectedAntUrl;
  int beesInHive;

  GameState(
      {required this.tiles,
      required this.gameStatus,
      required this.countDown,
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
        countDown: countDown ?? this.countDown,
        selectedAntUrl: selectedAntUrl ?? this.selectedAntUrl,
        foodAvailable: foodAvailable ?? this.foodAvailable,
        beesInHive: beesInHive ?? this.beesInHive);
  }
}

class GameStatus {
  bool beesWon;
  bool antsWon;
  bool timerRunning;

  bool get gameCompleted => antsWon || beesWon;

  GameStatus(
      {this.beesWon = false, this.antsWon = false, this.timerRunning = false});

  GameStatus copyWith({bool? beesWon, bool? antsWon, bool? timerRunning}) {
    return GameStatus(
        beesWon: beesWon ?? this.beesWon,
        antsWon: antsWon ?? this.antsWon,
        timerRunning: timerRunning ?? this.timerRunning);
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
          countDown: 0,
          foodAvailable: 50,
          beesInHive: 10));
});

class GameStateNotifier extends StateNotifier<GameState> {
  GameStateNotifier({gameState}) : super(gameState);

  // Timer? _gameTimer;
  void runCountdown() {
    // if (_timer != null && _timer!.isActive) return;

    // _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
    // print("state.gameStatus.gameCompleted: ${state.gameStatus.gameCompleted}");
    if (!state.gameStatus.gameCompleted) {
      state = state.copyWith(countDown: state.countDown + 1);
      // print("Countdown updated ${state.countDown}");
    } else {
      // print("Timer stopped");
      // _timer?.cancel();
      // _timer = null;
    }
    // });
  }

  void beesWonGameState() => state =
      state.copyWith(gameStatus: state.gameStatus.copyWith(beesWon: true));

  void antsWonGameState() => state =
      state.copyWith(gameStatus: state.gameStatus.copyWith(antsWon: true));

  void setTimerRunning(bool setValue) => state = state.copyWith(
      gameStatus: state.gameStatus.copyWith(timerRunning: setValue));

  void moveBeeForward(WidgetRef ref) {
    Map<int, List<Tile>> tunnels = ref.read(tunnelFromTilesProvider);
    for (var tiles in tunnels.values) {
      moveForwardEachTunnel(tiles);
    }
  }

  moveForwardEachTunnel(List<Tile> gameTiles) {
    List<Tile> updatedTiles = state.tiles;

    for (int i = 1; i < gameTiles.length; i++) {
      if (gameTiles[i].isBeePresent) {
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
    // print("endTiles:- ${endTiles.length}");
    // Updating tiles old status

    // if(state.beesInHive>0) {
    for (Tile tile in endTiles) {
      tile.bees!.add(Bee());
    }

    // print("add Bee endTiles :- $endTiles");

    // Updating state
    for (Tile tile in endTiles) {
      updatedTiles.map((oldTile) {
        (oldTile.tileKey == tile.tileKey) ? tile : oldTile;
      }).toList();
    }
    // print("oldTiles:- $updatedTiles");
    var currBees = state.beesInHive - endTiles.length;
    // print("currBees $currBees");
    state = state.copyWith(tiles: updatedTiles, beesInHive: currBees);
    // }
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
        // print("Ant reduceHealth ${gameTiles[i].ant}");
        Ant? newAnt = reduceHealth(gameTiles[i].ant!);

        gameTiles[i].ant = newAnt;
        if (gameTiles[i].ant != null && gameTiles[i].ant!.currHealth <= 0) {
          gameTiles[i].antImagePath = null;
          gameTiles[i].ant = null;
          // print("Ant end");
        }
      } else {
        // print("isAntPresent ${gameTiles[i].isAntPresent} isBeePresent ${gameTiles[i].isBeePresent} tileKey ${gameTiles[i].tileKey} Bees: ${gameTiles[i].bees}");
      }
      state = state.copyWith(tiles: gameTiles);
    }
  }

  Tile? nearestBee(Tile tile) {
    int currDis = 0;
    int lowerBound = tile.ant!.lower;
    int upperBound = tile.ant!.upper;
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
    var gameTiles = state.tiles;
    var imgPath = state.selectedAntUrl;
    for (int i = 0; i < gameTiles.length; i++) {
      if (gameTiles[i].tileKey == addAntToTile.tileKey &&
          gameTiles[i].isAntPresent == false &&
          state.foodAvailable > 0) {
        gameTiles[i] = gameTiles[i]
            .copyWith(antImagePath: imgPath, ant: getAntFromImage(imgPath!));
        var currFoodAvailable = state.foodAvailable - gameTiles[i].ant!.food;
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
