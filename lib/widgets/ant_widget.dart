import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unit_test_game/constants/get_ants.dart';
import 'package:unit_test_game/models/ant.dart';

class AntWidget extends ConsumerWidget {
  final Ant ant;

  const AntWidget({
    super.key,
    required this.ant,

  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    String antImagePath = getStringFromAnt(ant);
    return Column(
      children: [
        Text(ant.currHealth.toString()),
        Image.asset(
          antImagePath,
          height: height*0.1,
          width: width*0.1,
        ),
      ],
    );
  }
}
