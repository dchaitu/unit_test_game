import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unit_test_game/constants/image_assets.dart';
import 'package:unit_test_game/game_logic.dart';
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
                  onTap: () =>
                      ref.read(gameStateProvider.notifier).showTileDetails(),
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
    ),
    );
  }

  Widget createGameView(WidgetRef ref) {
    Timer? gameTimer;


    Map<int, List<Tile>> tunnels = ref.read(tunnelFromTilesProvider);
    startGameTimer(ref, gameTimer);

    var tunnelGrid = Column(
      children: tunnels.entries
          .map((tiles) => Container(
              padding: const EdgeInsets.all(8),
              child: TunnelWidget(tiles: tiles.value)))
          .toList(),
    );

    return tunnelGrid;
  }
}
