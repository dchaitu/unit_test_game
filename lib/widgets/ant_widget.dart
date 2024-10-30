import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unit_test_game/models/ant.dart';

class AntWidget extends ConsumerWidget {
  final Ant ant;

  const AntWidget({
    super.key,
    required this.ant,

  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Text(ant.currHealth.toString()),
        Image.asset(
          ant.antImagePath,
          width: 45,
          height: 45,
        ),
      ],
    );
  }
}
