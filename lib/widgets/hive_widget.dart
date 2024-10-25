import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/bee.dart';
import 'bee_widget.dart';
import '../providers/game_state_provider.dart';

class HiveWidget extends ConsumerWidget {
  const HiveWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int numBees = ref.watch(gameStateProvider).beesInHive;
    return GridView.count(
      crossAxisCount: 5,
      children: generateBees(numBees),
    );
  }
}

List<Widget> generateBees(beeNo) {
  return List.generate(beeNo, (index) {
    return FittedBox(fit: BoxFit.scaleDown, child: BeeWidget(bee: Bee()));
  });
}
