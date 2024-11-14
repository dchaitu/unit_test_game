import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unit_test_game/models/thrower_ant.dart';
import 'package:unit_test_game/providers/game_state_provider.dart';

import '../models/ant.dart';
import '../constants/get_ants.dart';

class AvailableAntsWidget extends ConsumerWidget {

  final List<String> antImgUrls;

  const AvailableAntsWidget({super.key, required this.antImgUrls});



  addAnt(Ant ant, WidgetRef ref)
  {
    String antName;
    int foodCost;
    String? antImg = getStringFromAnt(ant);
    if (antImg == ShortThrowerAnt.antImagePath) {
      antName = ShortThrowerAnt.name;
      foodCost = ShortThrowerAnt.food;
    } else if (antImg == LongThrowerAnt.antImagePath) {
      antName = LongThrowerAnt.name;
      foodCost = LongThrowerAnt.food;

    } else {
      antName = Ant.name;
      foodCost = Ant.food;
    }


    return InkWell(
      onTap: () => ref.read(gameStateProvider.notifier).selectAnt(antImg),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(antImg, height: 50, width: 50),
            Text(antName),
            const Divider(thickness: 12, height: 2, color: Colors.black),
            Text(foodCost.toString()),
          ],
        ),
      ),
    );
  }


  Widget getAllAnts(WidgetRef ref)
  {
    List<Widget> allAnts = [];
    for(String antImg in antImgUrls)
    {
      Ant? ant = getAntFromImage(antImg);
      allAnts.add(addAnt(ant!, ref));
    }
    return Row(children: allAnts);

  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),
        padding: const EdgeInsets.all(8),
        child: getAllAnts(ref),
    );
  }
}
