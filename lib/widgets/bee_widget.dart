import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/bee.dart';

class BeeWidget extends ConsumerWidget {
  final Bee bee;

  const BeeWidget({super.key, required this.bee});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Image.asset(
      bee.imagePath,
      width: 50,
      height: 50,
    );
  }

}
