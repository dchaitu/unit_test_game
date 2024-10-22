import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unit_test_game/providers.dart';
import 'package:unit_test_game/tunnel_widget.dart';


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


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isGameCompleted = ref.watch(gameCompletedProvider);
    // var countDownTimer = ref.watch(timerStateProvider);
    // ref.read(timerStateProvider.notifier).runCountdown();

    print("isGameCompleted:- $isGameCompleted");
    return Scaffold(
        body: Column(
          children: [
            createGameView(ref),
            InkWell(
              onTap: () => ref.read(tilesProvider.notifier).showTileDetails(),
              child: const Text("Show Details"),
            ),
            (isGameCompleted)?
            Container(
              height: 200,
              width: 200,
              color: Colors.green,
              child: const Text("Game Completed",style: TextStyle(color: Colors.white,fontSize: 24),),
            ):const SizedBox()
          ],
        ),
    );
  }



  TunnelWidget createGameView(WidgetRef ref) {
    var tiles = ref.watch(tilesProvider);
    var isBeeReachedLast = ref.read(gameCompletedProvider.notifier);

    // int noOfTiles = 4;
    // int totalNoOfTiles = 4;
    // print("noOfTiles:- $noOfTiles");
    // print("totalNoOfTiles:- $totalNoOfTiles");
    print("*****************************************");
    // var tunnel = [TunnelWidget(tiles: tiles.sublist(0,2)),TunnelWidget(tiles: tiles.sublist(2))];
    var tunnel = TunnelWidget(tiles: tiles);
    // print("tiles: ${tunnel.tiles}");

    Future.delayed(const Duration(seconds: 3), () {
      if(tiles[0].isBeePresent==true) {
        isBeeReachedLast.updateGameState();
        print("Last cell state updated");
      }
    });

    return tunnel;
  }
}


