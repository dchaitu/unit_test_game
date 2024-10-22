
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'constants/image_assets.dart';
import 'main.dart';

class AntWidget extends ConsumerWidget {
  final String antImagePath;
  final int damage;
  final VoidCallback onThrow;
  // final VoidCallback onDeath;
  final int health;
  final int lower;
  final int upper;



  // void attack(List<BeeWidget> bees) {
  //   bees.removeWhere((bee) {
  //     bee.health -= damage;
  //     return bee.health <= 0;
  //   });
  // }


  const AntWidget({super.key,
    this.antImagePath= ImageAssets.antThrower,
    this.damage = 1,
    this.health = 2,
    this.lower= 0,
    this.upper=99,
    required this.onThrow,

    // required this.onDeath
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onThrow,
      child: Image.asset(
        antImagePath,
        width: 45,
        height: 45,
      ),
    );
  }
}
