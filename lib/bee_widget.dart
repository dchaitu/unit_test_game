import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'ant.dart';
import 'bee.dart';
import 'providers.dart';


class BeeWidget extends ConsumerWidget {
  final Bee bee;



  const BeeWidget({
    super.key,
    required this.bee

  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var tiles = ref.watch(tilesProvider);

    return GestureDetector(
      onTap : () {
        Future.delayed(const Duration(seconds: 1), () {
          print('sting after 1 seconds!');
          ref.read(tilesProvider.notifier).beeStingAnt();
        });
      },
      onSecondaryTap: (){
        Timer? timer = Timer.periodic(Duration(seconds: 2), (timer) {
            if(tiles[0].isBeePresent)
            {
              print("Bees stopped");
              timer.cancel();
            }
            ref.read(tilesProvider.notifier).moveBeeForward();
          });
      },  // Call the action when tapped
      child: Image.asset(
        bee.imagePath,
        width: 50,
        height: 50,
      ),
    );
  }

  void sting(Ant ant) {
    // ant.reduceHealth(damage);
    print("Bee stung the ant, ant's health is now ${ant.health}");
    if(ant.health<=0)
    {
      // communicate remove insect from tile
      print("Insect removed from tile");
    }
  }
}



