import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'ant.dart';

class AntWidget extends ConsumerWidget {
  final Ant ant;
  final VoidCallback onThrow;

  const AntWidget({
    super.key,
    required this.ant,
    required this.onThrow,

    // required this.onDeath
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onThrow,
      child: Image.asset(
        ant.antImagePath,
        width: 45,
        height: 45,
      ),
    );
  }
}
