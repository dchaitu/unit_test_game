import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unit_test_game/providers.dart';
import 'package:unit_test_game/tunnel_widget.dart';

import 'timer_widget.dart';


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

    return Scaffold(
        body: Column(
          children: [
            TimerPage(),
            createGameView(ref),
            InkWell(
              onTap: () => ref.read(tilesProvider.notifier).showTileDetails(),
              child: const Text("Show Details"),
            ),
            gameStatusWidget(ref)
          ],
        ),
    );
  }

  Widget gameStatusWidget(WidgetRef ref)
  {
    var isGameCompleted = ref.watch(gameCompletedProvider);
    print("Time state:- ${isGameCompleted.timeCompleted}");

    if(isGameCompleted.beesWon)
      {
        return  Container(
          height: 200,
          width: 200,
          color: Colors.redAccent,
          child: const Center(child: Text("Game Completed Bees Won ",style: TextStyle(color: Colors.white,fontSize: 24),)),
        );
      }
    else if(isGameCompleted.antsWon)
      {
        return  Container(
          height: 200,
          width: 200,
          color: Colors.green,
          child: const Center(child: Text("Game Completed Ants Won",style: TextStyle(color: Colors.white,fontSize: 24),)),
        );
      }
    else if(isGameCompleted.timeCompleted)
      { print("Widget time");
        return  Container(
          height: 200,
          width: 200,
          color: Colors.blue,
          child: const Center(child: Text("Times Up",style: TextStyle(color: Colors.white,fontSize: 24),)),
        );
      }

    return SizedBox();
  }

  bool checkBeesPresent(WidgetRef ref)
  {
    var tiles = ref.watch(tilesProvider);
    for(int i=0;i<tiles.length;i++) {
      if(tiles[i].isBeePresent) {
        return true;
      }
    }
    return false;
  }



  TunnelWidget createGameView(WidgetRef ref) {
    var tiles = ref.watch(tilesProvider);
    var isBeeReachedLast = ref.read(gameCompletedProvider.notifier);

    print("*****************************************");
    var tunnel = TunnelWidget(tiles: tiles);
    print("tiles: ${tunnel.tiles}");




    Future.delayed(const Duration(seconds: 15), () {
      if(tiles[0].isBeePresent==true) {
        isBeeReachedLast.beesWonGameState();
        print("Last cell state updated");
      }
    });
    if(checkBeesPresent(ref)==false)
    {
      // isBeeReachedLast.antsWonGameState();
      print("Ants Won");
    }


    return tunnel;
  }
}


