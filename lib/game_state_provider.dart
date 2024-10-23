
import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'constants/image_assets.dart';
import 'tile.dart';
import 'ant.dart';
import 'bee.dart';

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

  GameState({required this.tiles, required this.gameStatus, required this.countDown});


  GameState copyWith({
    List<Tile>? tiles,
    GameStatus? gameStatus,
    int? countDown,

  })
  {
    return GameState(
        tiles: tiles ?? this.tiles,
        gameStatus: gameStatus?? this.gameStatus,
        countDown: countDown ?? this.countDown
    );
  }


}


final gameStateProvider = StateNotifierProvider<GameStateNotifier, GameState>((ref)
{
return GameStateNotifier(
  gameState: GameState(
      tiles:[
    Tile(
      tileKey: "tileKey_1",
      antImagePath: ImageAssets.antThrower,
      groundTileImgUrl: ImageAssets.groundTile1,
      skyTileImgUrl: ImageAssets.sky1,
      bees: [],
      ant: Ant(),
    ),
    Tile(
      tileKey: "tileKey_2",
      antImagePath: ImageAssets.antThrower,
      groundTileImgUrl: ImageAssets.groundTile1,
      skyTileImgUrl: ImageAssets.sky1,
      bees: [],
      ant: Ant(),

    ),
    Tile(
      tileKey: "tileKey_3",
      antImagePath: ImageAssets.antThrower,
      groundTileImgUrl: ImageAssets.groundTile1,
      skyTileImgUrl: ImageAssets.sky1,
      bees: [Bee()],
      ant: Ant(),

    ),
    Tile(
      tileKey: "tileKey_4",
      antImagePath: null,
      groundTileImgUrl: ImageAssets.groundTile1,
      skyTileImgUrl: ImageAssets.sky1,
      bees: [Bee(),Bee(),Bee(),Bee()],
      ant: null,
    ),
    Tile(
      tileKey: "tileKey_5",
      antImagePath: null,
      groundTileImgUrl: ImageAssets.groundTile1,
      skyTileImgUrl: ImageAssets.sky1,
      bees: [Bee(), Bee(),Bee(),Bee(),Bee()],
      ant: null,
    )


  ], gameStatus:GameStatus(), countDown:15)
);

});


class GameStateNotifier extends StateNotifier<GameState> {
  GameStateNotifier({gameState}): super(gameState);
  Timer? _timer;
  void runCountdown() {
    if (_timer != null && _timer!.isActive) return;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if(state.countDown>0) {
        state = state.copyWith(countDown: state.countDown-1);
      }
      else {
        print("Timer stopped");
        _timer?.cancel();
      }
    });
  }

  void beesWonGameState() => state = state.copyWith(gameStatus: state.gameStatus.copyWith(beesWon: true, ));
  void antsWonGameState() => state = state.copyWith(gameStatus: state.gameStatus.copyWith(antsWon: true, ));
  void timesUpGameState() => state = state.copyWith(gameStatus: state.gameStatus.copyWith(timeCompleted: true));


  void moveBeeForward()
  {
    print("Bees moving forward");
    var gameTiles = state.tiles;
    for (int i = gameTiles.length - 1; i > 0; i--)
    {
      Future.delayed(Duration(seconds: (gameTiles.length - i)*2), () {

        if(gameTiles[i].isBeePresent) {
          Bee bee = gameTiles[i].bees!.last;
          gameTiles[i].bees!.remove(bee);
          gameTiles[i-1].bees!.add(bee);
          state = state.copyWith(tiles: gameTiles);
        }
      });


    }

  }

  void showTileDetails()
  {
    var gameTiles = state.tiles;

    for(int i=0;i<gameTiles.length;i++)
    {
      print("isAntPresent: ${gameTiles[i].isAntPresent}, antImagePath: ${gameTiles[i].antImagePath}, ant: ${gameTiles[i].ant} , Bees: ${gameTiles[i].bees}, isBeePresent: ${gameTiles[i].isBeePresent}");
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
          gameTiles[i].ant = null;
        }
      }
      else{
        print("isAntPresent ${gameTiles[i].isAntPresent} isBeePresent ${gameTiles[i].isBeePresent} tileKey ${gameTiles[i].tileKey} Bees: ${gameTiles[i].bees}");
      }
      state = state.copyWith(tiles: gameTiles);
    }

  }

  Tile? nearestBee(Tile tile)
  {
    int currDis = 0;
    int lowerBound = tile.ant!.lower;
    int upperBound = tile.ant!.upper;

    while(lowerBound<=currDis && currDis<=upperBound)
    {
      print("curr tile ${tile.tileKey}");
      if(tile.isBeePresent) {
        return tile;
      }
      else if(tile.nextTile !=null)
      {
        currDis++;
        print("currDis:- ${currDis}");
        tile = tile.nextTile!;
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

        print("Bee health: ${bee.health}");
        currTile.copyWith(bees: currTile.bees);
        state = state.copyWith(tiles: gameTiles);

    }


  }








}




