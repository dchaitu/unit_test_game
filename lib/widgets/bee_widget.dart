import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unit_test_game/models/freezed_models/bee/bee.dart';

class BeeWidget extends ConsumerWidget {
  final Bee bee;

  const BeeWidget({super.key, required this.bee});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Text(bee.currHealth.toString()),
        Image.asset(
          Bee.imagePath,
          width: 50,
          height: 50,
        ),
      ],
    );
  }

}
