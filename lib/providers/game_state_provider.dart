
import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unit_test_game/providers/providers.dart';
import '../models/tile.dart';
import '../models/bee.dart';

class GameStatus {
  bool beesWon;
  bool antsWon;
  bool timeCompleted;

  bool get gameCompleted => timeCompleted || antsWon || beesWon;

  GameStatus({
    this.beesWon = false,
    this.antsWon = false,
    this.timeCompleted = false,
  });

  GameStatus copyWith({bool? beesWon, bool? antsWon, bool? timeCompleted}) {
    return GameStatus(
      beesWon: beesWon ?? this.beesWon,
      antsWon: antsWon ?? this.antsWon,
      timeCompleted: timeCompleted ?? this.timeCompleted,
    );
  }

  @override
  String toString() {
    return "timeCompleted:- $timeCompleted antsWon:- $antsWon beesWon:- $beesWon";
  }
}

class GameState{
  List<Tile> tiles;
  GameStatus gameStatus;
  int countDown;
  int foodAvailable;
  String? selectedAntUrl;
  int beesInHive;



  GameState({required this.tiles, required this.gameStatus, required this.countDown, required this.foodAvailable,this.selectedAntUrl, required this.beesInHive});


  GameState copyWith({
    List<Tile>? tiles,
    GameStatus? gameStatus,
    int? countDown,
    String? selectedAntUrl,
    int? foodAvailable,
    int? beesInHive

  })
  {
    return GameState(
        tiles: tiles ?? this.tiles,
        gameStatus: gameStatus?? this.gameStatus,
        countDown: countDown ?? this.countDown,
        selectedAntUrl:selectedAntUrl ?? this.selectedAntUrl,
        foodAvailable:foodAvailable ?? this.foodAvailable,
        beesInHive:beesInHive ?? this.beesInHive
    );
  }


}
// final timerProvider = StateNotifierProvider<TimeNotifier,int>((ref)
// {
//   return TimeNotifier();
//
// });
//
// class TimeNotifier extends StateNotifier<int> {
// TimeNotifier({timer}): super(timer);
//   Timer? _timer;
//   void runCountdown() {
//   if (_timer != null && _timer!.isActive) return;
//
//   _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//   if(state==30) {
//     print("Timer stopped");
//     _timer?.cancel();
//   }
//   else {
//
//       state = state+1;
//     }
//
//   });
//   }
//
//
// }


final gameStateProvider = StateNotifierProvider<GameStateNotifier, GameState>((ref)
{
  return GameStateNotifier(
      gameState: GameState(
          tiles: ref.watch(tilesProvider),
          gameStatus: GameStatus(),
          countDown: 0,
          foodAvailable:50,
          beesInHive:10
      )
  );

});


class GameStateNotifier extends StateNotifier<GameState> {
  GameStateNotifier({gameState}): super(gameState);
  Timer? _timer;
  void runCountdown() {
    if (_timer != null && _timer!.isActive) return;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      print("state.gameStatus.gameCompleted: ${state.gameStatus.gameCompleted}");
      if(!state.gameStatus.gameCompleted) {
        state = state.copyWith(countDown: state.countDown+1);
        print("Countdown updated ${state.countDown}");
      }
      else {
        print("Timer stopped");
        _timer?.cancel();
        _timer = null;
      }
    });
  }

  void beesWonGameState() => state = state.copyWith(gameStatus: state.gameStatus.copyWith(beesWon: true, ));
  void antsWonGameState() => state = state.copyWith(gameStatus: state.gameStatus.copyWith(antsWon: true, ));
  // void timesUpGameState() => state = state.copyWith(gameStatus: state.gameStatus.copyWith(timeCompleted: true));

  Map<int, List<Tile>> groupTilesByTunnel(List<Tile> tiles) {
    Map<int, List<Tile>> tunnels = {};

    for (Tile tile in tiles) {
      int row = int.parse(tile.tileKey!.split('_')[1]);

      if (!tunnels.containsKey(row)) {
        tunnels[row] = [];
      }
      tunnels[row]!.add(tile);
    }

    return tunnels;
  }

  void moveBeeForward()
  {
    print("Bees moving forward");
    var tunnels = groupTilesByTunnel(state.tiles);
    for (var tiles in tunnels.values) {
        moveForwardEachTunnel(tiles);
    }

  }

  moveForwardEachTunnel(List<Tile> gameTiles)
  {
    List<Tile> updatedTiles = state.tiles;

    for (int i = gameTiles.length - 1; i > 0; i--)
    {
      Future.delayed(Duration(seconds: (gameTiles.length - i)*3), () {

        if(gameTiles[i].isBeePresent) {
          Bee bee = gameTiles[i].bees!.last;
          gameTiles[i].bees!.remove(bee);
          gameTiles[i-1].bees!.add(bee);
          updatedTiles.map((tile) {
            if(tile.tileKey== gameTiles[i].tileKey)
              return gameTiles[i];
            else if(tile.tileKey  == gameTiles[i-1].tileKey)
              return gameTiles[i-1];
            return tile;
          }).toList();

          state = state.copyWith(tiles: updatedTiles);
          
        }
      });


    }
  }


  void addBeeToEnd(List<Tile> gameTiles)
  {
    List<Tile> updatedTiles = state.tiles;
    // Updating tiles old status

    if(state.beesInHive>0) {
      for (Tile tile in gameTiles) {
        tile.bees!.add(Bee());
      }

      print("add Bee endTiles :- $gameTiles");

      // Updating state
      for (Tile tile in gameTiles) {
        updatedTiles.map((oldTile) {
          (oldTile.tileKey == tile.tileKey) ? tile: oldTile;
        }).toList();
      }
      print("oldTiles:- $updatedTiles");
      var currBees = state.beesInHive - gameTiles.length;
      print("currBees $currBees");
      state = state.copyWith(
          tiles: updatedTiles, beesInHive: currBees);
    }
  }

  void showTileDetails()
  {
    var gameTiles = state.tiles;

    for(int i=0;i<gameTiles.length;i++)
    {
      print("isAntPresent: ${gameTiles[i].isAntPresent}, antImagePath: ${gameTiles[i].antImagePath}, Bees: ${gameTiles[i].noOfBees}, isBeePresent: ${gameTiles[i].isBeePresent}");
    }
  }

  void beeStingAnt() {
    print("Bee sting Ant...");
    var gameTiles = state.tiles;
    for (int i = 0; i < gameTiles.length; i++) {
      if (gameTiles[i].isAntPresent==true && gameTiles[i].isBeePresent == true )
      {
        print("Ant reduceHealth ${gameTiles[i].ant}");
        gameTiles[i].ant!.reduceAntHealth();

        if(gameTiles[i].ant!.health<=0) {
          gameTiles[i].antImagePath = null;
        }
      }
      else{
        print("isAntPresent ${gameTiles[i].isAntPresent} isBeePresent ${gameTiles[i].isBeePresent} tileKey ${gameTiles[i].tileKey} Bees: ${gameTiles[i].bees}");
      }
      state = state.copyWith(tiles: gameTiles);
    }

  }

  Tile? nearestBee(Tile tile) {
    int currDis = 0;
    int lowerBound = tile.ant!.lower;
    int upperBound = tile.ant!.upper;
    Tile? currentTile = tile;

    while (currentTile != null && (lowerBound <= currDis && currDis <= upperBound)) {
      if (currentTile.isBeePresent) {
        return currentTile;
      }
      if (currentTile.nextTile != null) {
        currentTile = currentTile.nextTile;
        currDis++;
      } else {
        break;
      }
    }
    return null;
  }




  void antAttack(Tile tile)
  {
    var gameTiles = state.tiles;
    Tile? currTile = nearestBee(tile);

    print("Ant attacking... tiles= ${gameTiles.length}");
    if (currTile!=null && currTile.tileKey==tile.tileKey) {
        Bee bee = currTile.bees!.last;
        bee.reduceBeeHealth();
        if(bee.health<=0) {
          print("Removing bee");
          currTile.bees!.remove(bee);
        } else {
          currTile.bees!.last = bee;
        }
        gameTiles = gameTiles.map((t) {
          if (t.tileKey == currTile.tileKey) {
            return currTile;
          }
          return t;
        }).toList();

        print("Bee health: ${bee.health}");
        // currTile.copyWith(bees: currTile.bees);
        state = state.copyWith(tiles: gameTiles);

    }


  }
  void selectAnt(String imagePath)
  {
    print("Selected Ant:- $imagePath");
    state = state.copyWith(selectedAntUrl: imagePath);
  }

  void addImgToTile(Tile addAntToTile)
  {
    var gameTiles = state.tiles;
    print("addAntToTile:- $addAntToTile");
    var imgPath = state.selectedAntUrl;
    for(int i=0; i< gameTiles.length;i++)
      {
        print("tile ${gameTiles[i].tileKey} img ${gameTiles[i].antImagePath}");
        if(gameTiles[i].tileKey == addAntToTile.tileKey &&gameTiles[i].isAntPresent==false && state.foodAvailable>0)
        {

          gameTiles[i] = gameTiles[i].copyWith(antImagePath: imgPath);
          print("Ant food:- ${gameTiles[i].ant!.food}");
          var currFoodAvailable = state.foodAvailable- gameTiles[i].ant!.food;
          if(currFoodAvailable>0) {
          state = state.copyWith(foodAvailable: currFoodAvailable);
          print("Img added ${gameTiles[i].antImagePath}");
        }
          else{
            print("Insufficient food");
          }
      }
      }

    state = state.copyWith(tiles: gameTiles);

  }










}




