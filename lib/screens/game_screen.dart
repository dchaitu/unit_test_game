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
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: BackgroundWidget(
        mainWidget: Stack(
          children: [
            Positioned(
              top: 0,
              left: width*(0.04),
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: const OptionsAvailableWidget()),
                  SizedBox(
                    height: height*(0.2 ),
                    child: const FittedBox(
                      fit: BoxFit.contain,
                      child: AvailableAntsWidget(
                        antImgUrls: [
                          ImageAssets.antLongthrower,
                          ImageAssets.antThrower,
                          ImageAssets.antShortthrower,
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(child: createGameView(ref)),
                    ],
                  ),

                ],
              ),
            ),

            Positioned(
              right: 0,
              top: height*(0.3),
              bottom: 0,
              child: HiveWidget(),
            ),
            Positioned(
                top: height*(0.1),
                left: width*(0.2),
                right: width*(0.2),
                child: gameStatusWidget(ref)),
          ],
        ), gameScreenWidth: width,
        gameScreenHeight: height,
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
