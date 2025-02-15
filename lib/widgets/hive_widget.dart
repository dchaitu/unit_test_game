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
    return SizedBox(
      width:width*0.4 ,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
        crossAxisSpacing: 0
        ),
        itemCount: numBees,
        itemBuilder: (BuildContext context, int index) {
          return generateBee();
        },

      ),
    );
  }
}

Widget generateBee() {
    return const FittedBox(fit: BoxFit.scaleDown, child: BeeWidget(bee: Bee()));
}
