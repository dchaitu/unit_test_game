import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unit_test_game/models/tile.dart';

import '../providers/game_state_provider.dart';


bool isBeesPresentInTheTunnels(WidgetRef ref)
{
  var tiles = ref.read(gameStateProvider).tiles;
  for(Tile tile in tiles)
    {
      if(tile.isBeePresent) {
        return false;
      }
    }

  return true;
}

Widget gameStatusWidget(WidgetRef ref) {
  print(
      "Game status gameCompleted ${ref.read(gameStateProvider).gameStatus.gameCompleted}");
  print(
      "beesWon:- ${ref.read(gameStateProvider).gameStatus.beesWon} antsWon:- ${ref.read(gameStateProvider).gameStatus.antsWon} ");
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
  } else if (ref.read(gameStateProvider).gameStatus.antsWon &&
      ref.watch(gameStateProvider).beesInHive <= 0 &&isBeesPresentInTheTunnels(ref)) {
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
  }
  return const SizedBox();
}
