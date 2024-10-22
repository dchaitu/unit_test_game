import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unit_test_game/ant_widget.dart';
import 'constants/image_assets.dart';
import 'main.dart';
import 'providers.dart';


class BeeWidget extends ConsumerWidget {
  final String imagePath;
  final int health;
  final int damage;
  final VoidCallback onMove;
  final VoidCallback onSting;

  const BeeWidget({
    super.key,
    this.imagePath = ImageAssets.bee,
    this.health = 2,
    this.damage = 1,
    required this.onMove,
    required this.onSting,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onSecondaryTap: () {
        Future.delayed(const Duration(seconds: 2), () {
          print('sting after 2 seconds!');
          ref.read(tilesProvider.notifier).beeStingAnt();
        });
      },
      onTap: (){
        Future.delayed(const Duration(seconds: 3), () {
          print('move forward after 3 seconds!');
          ref.read(tilesProvider.notifier).moveBeeForward();
        });
      },  // Call the action when tapped
      child: Image.asset(
        imagePath,
        width: 50,
        height: 50,
      ),
    );
  }

  void sting(AntWidget ant) {
    // ant.reduceHealth(damage);
    print("Bee stung the ant, ant's health is now ${ant.health}");
    if(ant.health<=0)
    {
      // communicate remove insect from tile
      print("Insect removed from tile");
    }
  }
}



