import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unit_test_game/models/freezed_models/bee/bee.dart';

class BeeWidget extends ConsumerWidget {
  final Bee bee;

  const BeeWidget({super.key, required this.bee});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Text(bee.currHealth.toString()),
        Image.asset(
          Bee.imagePath,
          height: height*0.1,
          width: width*0.1,
        ),
      ],
    );
  }

}
