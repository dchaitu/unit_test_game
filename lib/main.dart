import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unit_test_game/game_state_provider.dart';
import 'package:unit_test_game/tunnel_widget.dart';

import 'tile.dart';


void main() {
  runApp(const ProviderScope(child:MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}



class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});
  static bool _timesUpCalled = false;
  static bool _isAntsWon = false;
  static bool _isBeesWon = false;



  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
        body: Column(
          children: [
            displayTime(ref),
            createGameView(ref),
            InkWell(
              onTap: () => ref.read(gameStateProvider.notifier).showTileDetails(),
              child: const Text("Show Details"),
            ),
            gameStatusWidget(ref)
          ],
        ),
    );
  }

  Widget gameStatusWidget(WidgetRef ref)
  {
    var gameStatus = ref.read(gameStateProvider).gameStatus;
    print("Time state:- ${gameStatus.timeCompleted}");
    print("Game status gameCompleted ${ref.read(gameStateProvider).gameStatus.gameCompleted}");
    print("beesWon:- ${ref.read(gameStateProvider).gameStatus.beesWon} antsWon:- ${ref.read(gameStateProvider).gameStatus.antsWon} timeCompleted:- ${ref.read(gameStateProvider).gameStatus.timeCompleted} ");
      if (ref.read(gameStateProvider).gameStatus.beesWon) {
        return Container(
          padding: const EdgeInsets.all(10),
          height: 200,
          width: 200,
          color: Colors.redAccent,
          child: const Center(
              child: Text(
            "Game Completed Bees Won ",
            style: TextStyle(color: Colors.white, fontSize: 24),
          )),
        );
      } else if (ref.read(gameStateProvider).gameStatus.antsWon) {

        return Container(
          padding: const EdgeInsets.all(10),
          height: 200,
          width: 200,
          color: Colors.green,
          child: const Center(
              child: Text(
            "Game Completed Ants Won",
            style: TextStyle(color: Colors.white, fontSize: 24),
          )),
        );
      } else if (ref.read(gameStateProvider).gameStatus.timeCompleted) {

        return Container(
          padding: const EdgeInsets.all(10),
          height: 200,
          width: 200,
          color: Colors.blue,
          child: const Center(
              child: Text(
            "Times Up",
            style: TextStyle(color: Colors.white, fontSize: 24),
          )),
        );
      }

    return const SizedBox();
  }

  bool checkBeesPresent(WidgetRef ref)
  {
    var gameState = ref.watch(gameStateProvider);
    for(int i=0;i< gameState.tiles.length;i++) {
      if(gameState.tiles[i].isBeePresent) {
        return true;
      }
    }
    return false;
  }

  Widget displayTime(WidgetRef ref)
  {

    var countDownTimer = ref.watch(gameStateProvider).countDown;
    if(countDownTimer!=0) {
      ref.read(gameStateProvider.notifier).runCountdown();
    }

    print("Count DownTimer ${countDownTimer}");

    if(countDownTimer==0&& !_timesUpCalled)
    {print("_timesUpCalled:- $_timesUpCalled");
      Future.delayed(const Duration(seconds: 1), () {
        ref.read(gameStateProvider.notifier).timesUpGameState();
        _timesUpCalled = true;

      });
    }

    return countDownTimer>0?Text(countDownTimer.toString(),style: TextStyle(fontSize: 48)): SizedBox();
  }



  TunnelWidget createGameView(WidgetRef ref) {
    var tiles = ref.watch(gameStateProvider).tiles;
    var isBeeReachedLast = ref.read(gameStateProvider.notifier);
    var isGameCompleted = ref.watch(gameStateProvider).gameStatus.gameCompleted;

    print("*****************************************");
    var tunnel = TunnelWidget(tiles: tiles);
    print("tiles: ${tunnel.tiles}");

    print("isGameCompleted:- $isGameCompleted");
    if(isGameCompleted==false) {
      Timer? timer = Timer.periodic(Duration(seconds: 4), (timer) {
        isGameCompleted = ref.read(gameStateProvider).gameStatus.gameCompleted;
        ref.read(gameStateProvider.notifier).moveBeeForward();
        ref.read(gameStateProvider.notifier).beeStingAnt();
        for(Tile tile in tiles)
          {
            if(tile.isAntPresent)
              {
                ref.read(gameStateProvider.notifier).antAttack(tile);
              }
          }

        if (isGameCompleted == true) {
          timer.cancel();
        }
      });
      if(tiles[0].isBeePresent || isGameCompleted == true)
      {
        print("Bees stopped");
        timer.cancel();
      }
    }



    // Bee reached at end in Game Bees Won
    if(tiles[0].isBeePresent==true && !_isBeesWon) {
      Future.delayed(const Duration(seconds: 1), () {
        isBeeReachedLast.beesWonGameState();
        print("Last cell state updated");
        _isBeesWon = true;
      });
    }

    // Bee not present in Game Ants Won
    if(checkBeesPresent(ref)==false && !_isAntsWon)
    {
      Future.delayed(const Duration(seconds: 1), () {
        isBeeReachedLast.antsWonGameState();
        print("Ants Won");
        _isAntsWon = true;

      });

    }


    return tunnel;
  }
}


