import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AntWidget extends ConsumerWidget {
  final String antImagePath;

  const AntWidget({
    super.key,
    required this.antImagePath,

  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Image.asset(
      antImagePath,
      width: 45,
      height: 45,
    );
  }
}
