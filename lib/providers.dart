import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unit_test_game/bee_widget.dart';

import 'constants/image_assets.dart';
import 'tile.dart';

final gameCompletedProvider = StateNotifierProvider<GameNotifier, bool>((ref) {
  return GameNotifier(value: false);
});

final timerStateProvider = StateNotifierProvider<TimerNotifier, int>((ref) {
  return TimerNotifier(countdown: 15);
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
          noOfBees: 0,
        ),
        Tile(
          tileKey: "tileKey_2",
          antImagePath: ImageAssets.antThrower,
          groundTileImgUrl: ImageAssets.groundTile1,
          skyTileImgUrl: ImageAssets.sky1,
          noOfBees: 0,
        ),
        Tile(
          tileKey: "tileKey_3",
          antImagePath: ImageAssets.antThrower,
          groundTileImgUrl: ImageAssets.groundTile1,
          skyTileImgUrl: ImageAssets.sky1,
          noOfBees: 0,
        ),
        Tile(
          tileKey: "tileKey_4",
          antImagePath: null,
          groundTileImgUrl: ImageAssets.groundTile1,
          skyTileImgUrl: ImageAssets.sky1,
          noOfBees: 1,
        ),
        Tile(
          tileKey: "tileKey_5",
          antImagePath: null,
          groundTileImgUrl: ImageAssets.groundTile1,
          skyTileImgUrl: ImageAssets.sky1,
          noOfBees: 2,
        )


      ]

  );

});



class TimerNotifier extends StateNotifier<int> {
  TimerNotifier({countdown}) : super(countdown);
  late Timer timer;
  void runCountdown() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      state -= 1;
      if (state <= 0) timer.cancel();
    });
  }
  void stopTimer()
  {
    timer.cancel();
  }
}

class GameNotifier extends StateNotifier<bool> {
  GameNotifier({value}): super(value);

  void updateGameState()
  {
    state = true;
  }
}


class TilesNotifier extends StateNotifier<List<Tile>> {
  TilesNotifier({tiles}): super(tiles);


  // FIXME: Update state of each tile after a Duration of 2 seconds
  void moveBeeForward()
  {
    final List<Tile> updatedTiles = [];
    print("Bee moving forward");
    for (int i = state.length - 1; i > 0; i--)
    {
      Future.delayed(Duration(seconds: (state.length - i)*2), () {

        while(state[i].isBeePresent) {
          state[i].noOfBees -=1;
          state[i-1].noOfBees +=1;
          updatedTiles.add(state[i]);
          updatedTiles.add(state[i-1]);
          print("Updating state...");
          state = [...state];
        }
        print("Present Tile $i");
      });

    }

  }

  void nearestBee()
  {
    for(int i=0;i<state.length;i++)
    {
      if(state[i].isBeePresent==true)
      {
        print("Nearest Bee is ${state[i].tileKey}");
        break;
      }
    }

  }

  bool antSpecialAttack() {
    int distance = 1;
    for (int i = 0; i < state.length; i++) {
      if (state[i].isAntPresent == true) {
        for (int j = 0; j <= distance; j++) {
          if (state[i + j].isBeePresent == true) {
            print("Attacking bee at ${state[i+j].tileKey}");
            return true;
          }
        }
      }
    }
    return false;
  }

  void antAttack()
  {

    print("Ant attacking... tiles= ${state.length}");
    state = [
      for(int i=0;i< state.length;i++)

        if(state[i].isAntPresent==true && state[i].isBeePresent == true )

          state[i].copyWith(noOfBees: state[i].noOfBees-1)
        else
          state[i]

    ];
  }
  void showTileDetails()
  {
    for(int i=0;i<state.length;i++)
    {
      print("isAntPresent: ${state[i].isAntPresent}, antImagePath: ${state[i].antImagePath} , Bees: ${state[i].bees}, isBeePresent: ${state[i].isBeePresent}");
    }
  }

  void beeStingAnt() {
    print("Bee sting Ant...");

    for (int i = 0; i < state.length; i++) {
      if (state[i].isAntPresent==true && state[i].isBeePresent == true )
      {

        state[i].antImagePath= null;
      }
      else
        state[i];
    }

    state = [...state];
  }
  void gameCompleted()
  {

  }

}