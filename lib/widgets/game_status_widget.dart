import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:unit_test_game/providers/game_state_provider.dart';

import '../models/freezed_models/tile/tile.dart';

bool isBeesPresentInTheTunnels(WidgetRef ref) {
  List<Tile> tiles = ref.read(gameStateProvider).tiles;
  for (Tile tile in tiles) {
    if (tile.isBeePresent) {
      return false;
    }
  }

  return true;
}

Widget gameStatusWidget(WidgetRef ref) {
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
        ),
      ),
    );
  } else if (ref.read(gameStateProvider).gameStatus.antsWon &&
      ref.watch(gameStateProvider).beesInHive <= 0 &&
      isBeesPresentInTheTunnels(ref)) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 200,
      width: 200,
      color: Colors.green,
      child: const Center(
        child: Text(
          "Game Completed Ants Won",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
  return const SizedBox();
}
