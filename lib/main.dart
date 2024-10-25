import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unit_test_game/constants/image_assets.dart';
import 'package:unit_test_game/providers/game_state_provider.dart';
import 'package:unit_test_game/providers/providers.dart';
import 'package:unit_test_game/widgets/tunnel_widget.dart';

import 'widgets/available_ants_widget.dart';
import 'widgets/game_status_widget.dart';
import 'widgets/hive_widget.dart';
import 'models/tile.dart';

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
    var endTiles = ref.watch(tileEntranceForBeesProvider);
    var foodAvailable = ref.watch(gameStateProvider).foodAvailable.toString();
    final double height = MediaQuery
        .of(context)
        .size
        .height;
    final double width = MediaQuery
        .of(context)
        .size
        .width;

    print("endTiles:- $endTiles ");
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageAssets.swirlPatternBg),
            repeat: ImageRepeat.repeat,
          ),
        ),
        child: Container(
          width: width * 0.7,
          height: height * 0.8,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageAssets.gameBg),
              fit: BoxFit.contain,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      mainAxisSize:MainAxisSize.max,
                      children: [
                        Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.red,),
                            margin:  const EdgeInsets.all(8),
                            padding: const EdgeInsets.all(8),
                            child: RichText(
                                text: TextSpan(
                              children: [
                                const TextSpan(text: "Timer:  ", style:  const TextStyle(color: Colors.white)),
                                TextSpan(text: displayTime(ref).toString(), style:  const TextStyle(fontWeight: FontWeight.bold, color: Colors.white))
                              ]

                            )
                            )
                        ),
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.yellowAccent),
                          padding: const EdgeInsets.all(8),
                          margin:  const EdgeInsets.all(8),
                          child: Text(
                            "Food: $foodAvailable",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const AvailableAntsWidget(
                      antImgUrls: [
                        ImageAssets.antLongthrower,
                        ImageAssets.antThrower,
                        ImageAssets.antShortthrower
                      ],
                    ),

                    Row(
                      children: [
                        Expanded(child: createGameView(ref)),
                      ],
                    ),
                    InkWell(
                      onTap: () =>
                          ref.read(gameStateProvider.notifier).showTileDetails(),
                      child: const Text("Show Details"),
                    ),
                    gameStatusWidget(ref),
                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                         ref.read(gameStateProvider.notifier).addBeeToEnd(endTiles);
                      },
                      child: const HiveWidget(),
                                  ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }


  bool checkBeesPresent(WidgetRef ref) {
    var gameState = ref.watch(gameStateProvider);
    bool beesInGame = true;
    for (int i = 0; i < gameState.tiles.length; i++) {
      if (gameState.tiles[i].isBeePresent) {
        beesInGame = true;
      }
      else
        {
          beesInGame = false;
        }

    }
    if(beesInGame==false && ref.watch(gameStateProvider).beesInHive>0) {
      return true;
    }

    return false;
  }

  int displayTime(WidgetRef ref) {
    var countDownTimer = ref.watch(gameStateProvider).countDown;
    if (countDownTimer != 0) {
      ref.read(gameStateProvider.notifier).runCountdown();
    }

    print("Count DownTimer $countDownTimer");

    if (countDownTimer == 0 && !_timesUpCalled) {
      print("_timesUpCalled:- $_timesUpCalled");
      Future.delayed(const Duration(seconds: 1), () {
        ref.read(gameStateProvider.notifier).timesUpGameState();
        _timesUpCalled = true;
      });
    }

    return countDownTimer;


  }

  Widget createGameView(WidgetRef ref) {
    var tiles = ref.watch(gameStateProvider).tiles;
    var isBeeReachedLast = ref.read(gameStateProvider.notifier);
    var isGameCompleted = ref.watch(gameStateProvider).gameStatus.gameCompleted;
    var exitTiles = ref.watch(tilesExitProvider);
    Map<int, List<Tile>> tunnels =
        ref.read(gameStateProvider.notifier).groupTilesByTunnel(tiles);

    var tunnelGrid = Column(
      children: tunnels.entries
          .map((tiles) => Container(
              padding: const EdgeInsets.all(8),
              child: TunnelWidget(tiles: tiles.value)))
          .toList(),
    );


    print("isGameCompleted:- $isGameCompleted");
    if (isGameCompleted == false) {
      Timer? timer = Timer.periodic(Duration(seconds: 4), (timer) {
        isGameCompleted = ref.read(gameStateProvider).gameStatus.gameCompleted;
        Future.delayed(Duration(seconds: 5), () {});
        ref.read(gameStateProvider.notifier).moveBeeForward();
        ref.read(gameStateProvider.notifier).beeStingAnt();
        for (Tile tile in ref.watch(tilesWithAntsProvider)) {
          if (tile.isAntPresent) {
            ref.read(gameStateProvider.notifier).antAttack(tile);
          }
        }

        if (isGameCompleted == true) {
          timer.cancel();
        }
      });
      if (tiles[0].isBeePresent || isGameCompleted == true) {
        timer.cancel();
      }
    }

    // Bee reached at end in Game Bees Won
    for (Tile tile in exitTiles) {
      if (tile.isBeePresent == true && !_isBeesWon) {
        Future.delayed(const Duration(seconds: 1), () {
          isBeeReachedLast.beesWonGameState();
          _isBeesWon = true;
        });
      }
    }

    // Bee not present in Game Ants Won
    if (checkBeesPresent(ref) == false && !_isAntsWon) {
      Future.delayed(const Duration(seconds: 1), () {
        isBeeReachedLast.antsWonGameState();
        print("Ants Won");
        _isAntsWon = true;
      });
    }

    return tunnelGrid;
  }
}


