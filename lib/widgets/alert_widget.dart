import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unit_test_game/providers/game_state_provider.dart';

class AlertWidget extends ConsumerWidget {
  final String result;
  const AlertWidget({super.key, required this.result});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      insetPadding:const EdgeInsets.all(100),
      title: const Text('Game Completed'),
      content: Text(result),
      actions: <Widget>[
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            ref.read(gameStateProvider.notifier).resetGameState();
            Navigator.of(context).pop();

          },
        ),
      ],
    );
  }
}
