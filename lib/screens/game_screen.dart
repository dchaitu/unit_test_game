import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unit_test_game/constants/image_assets.dart';
import 'package:unit_test_game/game_logic.dart';
import 'package:unit_test_game/providers/game_state_provider.dart';
import 'package:unit_test_game/providers/providers.dart';
import 'package:unit_test_game/widgets/available_ants_widget.dart';
import 'package:unit_test_game/widgets/background_widget.dart';
import 'package:unit_test_game/widgets/game_status_widget.dart';
import 'package:unit_test_game/widgets/hive_widget.dart';
import 'package:unit_test_game/widgets/options_available_widget.dart';
import 'package:unit_test_game/widgets/tile_widget.dart';

import 'package:unit_test_game/models/freezed_models/tile/tile.dart';


/// In GameScreen we build types of ants Available,  
/// Closing the UI, Timer, Food Available   
/// Tunnels with tiles
/// Hive with Ants
/// In the state initialization we are calling gameLogic only once
/// A button Show Details to print current state

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
    // ref.read(countdownProvider.notifier).startCountdown();
    ref.read(customTimerProvider).startTimer();
    tunnels =ref.read(gameStateProvider).tunnels;
    runGame(ref);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

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
    /// Building tunnel taken from Map into a Widget 
    
    var tunnelEntries = ref.watch(gameStateProvider).tunnels.entries;
    var tunnelGrid = Column(
      children: tunnelEntries
          .map(
            (tunnel) => Container(
              padding: const EdgeInsets.all(8),
              child: createTunnel(tunnel.value),
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
