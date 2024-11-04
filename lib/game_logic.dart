import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unit_test_game/models/tile.dart';
import 'package:unit_test_game/providers/game_state_provider.dart';
import 'package:unit_test_game/providers/providers.dart';

bool checkBeesPresentInTheGame(WidgetRef ref) {
  var gameState = ref.watch(gameStateProvider);
  bool beesInGame = false;
  for (int i = 0; i < gameState.tiles.length; i++) {
    if (gameState.tiles[i].isBeePresent || gameState.beesInHive > 0) {
      beesInGame = true;
      break;
    }
  }

  return beesInGame;
}

int displayTime(WidgetRef ref) {
  var gameCompleted = ref.watch(gameStateProvider).gameStatus.gameCompleted;

  var countDownTimer = ref.watch(gameStateProvider).countDown;
  if (!gameCompleted) {
    ref.read(gameStateProvider.notifier).runCountdown();
  }

  return countDownTimer;

}


void startGameTimer(WidgetRef ref, Timer? gameTimer) {
  if (gameTimer != null && gameTimer.isActive) return;

  gameTimer = Timer.periodic(Duration(seconds: 7), (timer)  async {
    await gameStateLogic(ref,gameTimer,timer);
  });


}


 gameStateLogic(WidgetRef ref,Timer? gameTimer, Timer timer) async {
  bool isAntsWon = false;
  bool isBeesWon = false;
  var isBeeReachedLast = ref.read(gameStateProvider.notifier);
  var isGameCompleted = ref.read(gameStateProvider).gameStatus.gameCompleted;
  var exitTiles = ref.read(tilesExitProvider);

    if (isGameCompleted) {
      timer.cancel();
      gameTimer = null;  // Clear the global timer reference
      print("Game timer has been successfully canceled.");
      return;
    }

      final id = DateTime.now().millisecondsSinceEpoch;
      print("Game Iteration $id: ${DateTime.now()}");
      isGameCompleted = ref.read(gameStateProvider).gameStatus.gameCompleted;

      await Future.delayed(const Duration(seconds: 2));
      if (ref.read(gameStateProvider).beesInHive > 0) {
        print("Add Bee to End $id: ${DateTime.now()}");
        ref.read(gameStateProvider.notifier).addBeeToEnd(ref);
      }

      await Future.delayed(const Duration(seconds: 2));
      print("Move bees Forward $id: ${DateTime.now()}");
      ref.read(gameStateProvider.notifier).moveBeeForward(ref);

      await Future.delayed(const Duration(seconds: 2));
      ref.read(gameStateProvider.notifier).beeStingAnt();
      print("Ant Attack $id: ${DateTime.now()}");
      var tilesWithAnts = ref.watch(tilesWithAntsProvider);

      for (Tile tile in tilesWithAnts) {
        if (tile.isAntPresent) {
          print("Ant attacking ${tile.ant!.currHealth}");
          ref.read(gameStateProvider.notifier).antAttack(tile);
        }
      }

      exitTiles = ref.read(tilesExitProvider);
      for (Tile tile in exitTiles) {
        if (tile.isBeePresent == true && !isBeesWon) {
            isBeeReachedLast.beesWonGameState();
            print("Bees Won");
            isBeesWon = true;
            break;
        }
      }

      // Bee not present in Game Ants Won
      if (!checkBeesPresentInTheGame(ref) && !isAntsWon) {
          isBeeReachedLast.antsWonGameState();
          isAntsWon = true;
          isGameCompleted = ref.read(gameStateProvider).gameStatus.gameCompleted;

      }

  isGameCompleted = ref.read(gameStateProvider).gameStatus.gameCompleted;
  if (isGameCompleted) {
    timer.cancel();
    gameTimer = null;
    print("Game timer has been successfully canceled.");
  }


}
