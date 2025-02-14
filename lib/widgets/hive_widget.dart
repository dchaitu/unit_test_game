import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unit_test_game/models/freezed_models/bee/bee.dart';

import 'bee_widget.dart';
import '../providers/game_state_provider.dart';

class HiveWidget extends ConsumerWidget {
  const HiveWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double width = MediaQuery.of(context).size.width;

    int numBees = ref.watch(gameStateProvider).beesInHive;
    return Container(
      // color: Colors.blue,
      width:width*0.5 ,
      child: GridView.count(
        crossAxisCount: 5,
        children: generateBees(numBees),
      ),
    );
  }
}

List<Widget> generateBees(beeNo) {
  return List.generate(beeNo, (index) {
    return const FittedBox(fit: BoxFit.scaleDown, child: BeeWidget(bee: Bee()));
  });
}
