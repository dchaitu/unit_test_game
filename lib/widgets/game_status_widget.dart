import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:unit_test_game/providers/game_state_provider.dart';
import 'package:unit_test_game/widgets/alert_widget.dart';

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
    return const Center(
      child: AlertWidget(result: "Bees Won", bgColor: Colors.redAccent,)
    );
  } else if (ref.read(gameStateProvider).gameStatus.antsWon &&
      ref.watch(gameStateProvider).beesInHive <= 0 &&
      isBeesPresentInTheTunnels(ref)) {
    return const Center(
        child: AlertWidget(result: "Ants Won",bgColor: Colors.lightGreen,)
    );
  }
  return const SizedBox();
}
