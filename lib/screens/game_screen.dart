import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unit_test_game/constants/image_assets.dart';
import 'package:unit_test_game/models/tile.dart';
import 'package:unit_test_game/providers/game_state_provider.dart';
import 'package:unit_test_game/providers/providers.dart';
import 'package:unit_test_game/widgets/available_ants_widget.dart';
import 'package:unit_test_game/widgets/background_widget.dart';
import 'package:unit_test_game/widgets/game_status_widget.dart';
import 'package:unit_test_game/widgets/hive_widget.dart';
import 'package:unit_test_game/widgets/options_available_widget.dart';
import 'package:unit_test_game/widgets/tunnel_widget.dart';





class GameScreen extends ConsumerWidget {
  const GameScreen({super.key});
  static bool _isAntsWon = false;
  static bool _isBeesWon = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    return Scaffold(
      body: BackgroundWidget(
        mainWidget: Stack(
          children: [
            Positioned(
              top: 0,
              left: 300,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const OptionsAvailableWidget(),
                  const FittedBox(
                    fit: BoxFit.contain,
                    child: AvailableAntsWidget(
                      antImgUrls: [
                        ImageAssets.antLongthrower,
                        ImageAssets.antThrower,
                        ImageAssets.antShortthrower,
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(child: createGameView(ref)),
                    ],
                  ),
                  InkWell(
                    onTap: () => ref.read(gameStateProvider.notifier).showTileDetails(),
                    child: const Text("Show Details"),
                  ),
                  gameStatusWidget(ref),
                ],
              ),
            ),

            const Positioned(
              right: 200,
              top: 200,
              bottom: 0,
              child: Align(
                alignment: Alignment.centerLeft,
                child: HiveWidget(),
              ),
            ),
          ],
        ),
      )
    );
  }


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



  Widget createGameView(WidgetRef ref) {
    var tiles = ref.watch(gameStateProvider).tiles;
    var isBeeReachedLast = ref.read(gameStateProvider.notifier);
    var isGameCompleted = ref.watch(gameStateProvider).gameStatus.gameCompleted;
    var exitTiles = ref.watch(tilesExitProvider);
    Map<int, List<Tile>> tunnels =
    ref.read(gameStateProvider.notifier).groupTilesByTunnel(tiles);
    var endTiles = ref.watch(tileEntranceForBeesProvider);


    var tunnelGrid = Column(
      children: tunnels.entries
          .map((tiles) => Container(
          padding: const EdgeInsets.all(8),
          child: TunnelWidget(tiles: tiles.value)
      )
      ).toList(),
    );


    print("isGameCompleted:- $isGameCompleted");
    if (isGameCompleted == false) {
      Timer? timer = Timer.periodic(const Duration(seconds: 4), (timer) {
        isGameCompleted = ref.read(gameStateProvider).gameStatus.gameCompleted;

        Future.delayed(const Duration(seconds: 3), () {
          ref.read(gameStateProvider.notifier).addBeeToEnd(endTiles);
          ref.read(gameStateProvider.notifier).moveBeeForward();

        });
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
    if (checkBeesPresentInTheGame(ref) == false && !_isAntsWon) {
      print("checkBeesPresentInTheGame(ref):- ${checkBeesPresentInTheGame(ref)}");
      Future.delayed(const Duration(seconds: 1), () {
        isBeeReachedLast.antsWonGameState();
        print("Ants Won");
        _isAntsWon = true;
      });
    }

    return tunnelGrid;
  }
}
