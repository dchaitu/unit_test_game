import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unit_test_game/constants/image_assets.dart';
import 'package:unit_test_game/game_logic.dart';
import 'package:unit_test_game/providers/count_down_provider.dart';
import 'package:unit_test_game/providers/game_state_provider.dart';
import 'package:unit_test_game/widgets/available_ants_widget.dart';
import 'package:unit_test_game/widgets/background_widget.dart';
import 'package:unit_test_game/widgets/game_status_widget.dart';
import 'package:unit_test_game/widgets/hive_widget.dart';
import 'package:unit_test_game/widgets/options_available_widget.dart';
import 'package:unit_test_game/widgets/tile_widget.dart';

import '../models/freezed_models/tile/tile.dart';

class GameScreen extends ConsumerStatefulWidget {
  const GameScreen({super.key});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends ConsumerState<GameScreen> {
  late Widget createGame;
  late Map<int, List<Tile>> tunnels;

  @override
  void initState() {
    super.initState();
    ref.read(countdownProvider.notifier).startCountdown();
    tunnels =ref.read(gameStateProvider.notifier).updateTilesAndTunnel();
    gameCoreLogic(ref);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(gameStateProvider).tiles;

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
                  ElevatedButton(
                    onPressed: () =>
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
    tunnels = ref.read(gameStateProvider.notifier).updateTilesAndTunnel();

    var tunnelGrid = Column(
      children: tunnels.entries
          .map(
            (tiles) => Container(
              padding: const EdgeInsets.all(8),
              child: createTunnel(tiles.value),
            ),
          )
          .toList(),
    );
    return tunnelGrid;
  }

  Widget createTunnel(List<Tile> tiles)
  {
    List<TileWidget> tileWidgets = tiles
        .map((tile) => TileWidget(tile: tile)).toList();
    return Row(
      children: tileWidgets,
    );
  }

}
