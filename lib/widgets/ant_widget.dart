import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unit_test_game/constants/get_ants.dart';
import 'package:unit_test_game/models/ant.dart';

class AntWidget extends ConsumerWidget {
  final Ant ant;
  final double? size;

  const AntWidget({
    super.key,
    required this.ant,
    this.size,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Use the provided size or calculate based on screen size
    final double antSize = size ?? MediaQuery.of(context).size.shortestSide * 0.08;
    String antImagePath = getStringFromAnt(ant);
    
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          ant.currHealth.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 2),
        SizedBox(
          width: antSize,
          height: antSize,
          child: Image.asset(
            antImagePath,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
