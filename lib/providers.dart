import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'ant.dart';
import 'bee.dart';
import 'constants/image_assets.dart';
import 'tile.dart';

final gameCompletedProvider = StateNotifierProvider<GameNotifier, GameCompleted>((ref) {
  return GameNotifier(gameStates: GameCompleted());
});

final timerStateProvider = StateNotifierProvider<TimerNotifier, int>((ref) {
  return TimerNotifier(countdown: 5);
});

final tilesProvider = StateNotifierProvider<TilesNotifier, List<Tile>>((ref)
{
  return TilesNotifier(
      tiles: [
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
          bees: [],
          ant: Ant(),

        ),
        Tile(
          tileKey: "tileKey_4",
          antImagePath: null,
          groundTileImgUrl: ImageAssets.groundTile1,
          skyTileImgUrl: ImageAssets.sky1,
          bees: [Bee()],
          ant: null,
        ),
        Tile(
          tileKey: "tileKey_5",
          antImagePath: null,
          groundTileImgUrl: ImageAssets.groundTile1,
          skyTileImgUrl: ImageAssets.sky1,
          bees: [Bee(), Bee()],
          ant: null,
        )


      ]

  );

});



class TimerNotifier extends StateNotifier<int> {
  TimerNotifier({countdown}) : super(countdown);
  Timer? _timer;
  void runCountdown() {
    if (_timer != null && _timer!.isActive) return;


    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
    if(state>0) {
        state = state - 1;
      }
      else {
        print("Timer stopped");
        timer.cancel();
      }
    });
  }

  @override
  void dispose()
  {
    _timer?.cancel();
    super.dispose();
  }
}

class GameCompleted {
  bool beesWon = false;
  bool antsWon = false;
  bool timeCompleted = false;

  GameCompleted({this.beesWon = false, this.antsWon = false, this.timeCompleted = false});

  GameCompleted copyWith({bool? beesWon, bool? antsWon, bool? timeCompleted}) {
    return GameCompleted(
      beesWon: beesWon ?? this.beesWon,
      antsWon: antsWon ?? this.antsWon,
      timeCompleted: timeCompleted ?? this.timeCompleted,
    );
  }
}

class GameNotifier extends StateNotifier<GameCompleted> {
  GameNotifier({gameStates}): super(gameStates);

  void beesWonGameState() {
    state = state.copyWith(beesWon: true);
  }
  void antsWonGameState() => state = state.copyWith(antsWon: true);

  void timesUpGameState() {
    state = state.copyWith(timeCompleted: true);
  }
}


class TilesNotifier extends StateNotifier<List<Tile>> {
  TilesNotifier({tiles}): super(tiles);


  // FIXME: Update state of each tile after a Duration of 2 seconds
  void moveBeeForward()
  {
    print("Bee moving forward");
    for (int i = state.length - 1; i > 0; i--)
    {
      Future.delayed(Duration(seconds: (state.length - i)*2), () {

        if(state[i].isBeePresent) {
          Bee bee = state[i].bees!.last;
          state[i].bees!.remove(bee);
          state[i-1].bees!.add(bee);
          print("Updating state...");
          state = [...state];
        }

        print("Present Tile $i");
      });


    }

  }



  Tile? nearestBee(Tile tile)
  {
    int distance = 3;
    int currDis = 0;


    while(currDis<distance)
      {
        print("curr tile ${tile.tileKey}");
        if(tile.isBeePresent) {
          antAttack(tile);
        return tile;
        }
        else if(tile.nextTile !=null)
          {
            currDis++;
            print("currDis:- ${currDis}");
            tile= tile.nextTile!;
          }
      }
      return null;


  }



  void antAttack(Tile tile)
  {
    print("Ant attacking... tiles= ${state.length}");
    for(int i=0;i< state.length;i++) {
      if (state[i].tileKey==tile.tileKey) {
        {
          Bee bee = state[i].bees!.last;
          bee.reduceBeeHealth();
          if(bee.health<=0) {
            print("Removing bee");
            state[i].bees!.remove(bee);
          } else {
            state[i].bees!.last = bee;
          }

          print("Bee health: ${bee.health}");
          state[i].copyWith(bees: state[i].bees);
        state = [...state];
        }
      }
    }

  }
  void showTileDetails()
  {
    for(int i=0;i<state.length;i++)
    {
      print("isAntPresent: ${state[i].isAntPresent}, antImagePath: ${state[i].antImagePath}, ant: ${state[i].ant} , Bees: ${state[i].bees}, isBeePresent: ${state[i].isBeePresent}");
    }
  }

  void beeStingAnt() {
    print("Bee sting Ant...");

    for (int i = 0; i < state.length; i++) {
      if (state[i].isAntPresent==true && state[i].isBeePresent == true )
      {
        print("Ant reduceHealth ${state[i].ant}");
        state[i].ant!.reduceAntHealth();

        if(state[i].ant!.health<=0) {
          state[i].antImagePath = null;
          state[i].ant = null;
        }
      }
      else{
        print("isAntPresent ${state[i].isAntPresent} isBeePresent ${state[i].isBeePresent} tileKey ${state[i].tileKey} Bees: ${state[i].bees}");
      }
      state = [...state];
    }

  }

}