import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unit_test_game/providers/game_state_provider.dart';

class AlertWidget extends ConsumerWidget {
  final String result;
  final Color bgColor;
  const AlertWidget({super.key, required this.bgColor, required this.result});
  // TODO: Update alert widget box size
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return AlertDialog(
      backgroundColor: bgColor,
      insetPadding:const EdgeInsets.all(100),
      title: Center(child: const Text('Game Completed',style: TextStyle(color: Colors.white),)),
      content: SizedBox(
          width: width*0.5,
          height: height*0.2,
          child: Text(result,style: TextStyle(color: Colors.white))),
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
