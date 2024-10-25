import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/game_state_provider.dart';

Widget gameStatusWidget(WidgetRef ref) {
  var gameStatus = ref.read(gameStateProvider).gameStatus;
  print("Time state:- ${gameStatus.timeCompleted}");
  print(
      "Game status gameCompleted ${ref.read(gameStateProvider).gameStatus.gameCompleted}");
  print(
      "beesWon:- ${ref.read(gameStateProvider).gameStatus.beesWon} antsWon:- ${ref.read(gameStateProvider).gameStatus.antsWon} timeCompleted:- ${ref.read(gameStateProvider).gameStatus.timeCompleted} ");
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
      ref.watch(gameStateProvider).beesInHive <= 0) {
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
