import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unit_test_game/providers/game_state_provider.dart';

class OptionsAvailableWidget extends ConsumerWidget {
  const OptionsAvailableWidget({super.key});



  int displayTime(WidgetRef ref) {
    var countDownTimer = ref.watch(gameStateProvider).countDown;
      ref.read(gameStateProvider.notifier).runCountdown();
    var gameCompleted = ref.watch(gameStateProvider).gameStatus.gameCompleted;

    if (!gameCompleted) {
      ref.read(gameStateProvider.notifier).runCountdown();
    }


    return countDownTimer;


  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var foodAvailable = ref.watch(gameStateProvider).foodAvailable.toString();

    return Row(
      mainAxisSize:MainAxisSize.max,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.yellowAccent),
            padding: const EdgeInsets.all(8),
            margin:  const EdgeInsets.all(8),
            child: const Text(
              "Exit GUI",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),

        Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.red,),
            margin:  const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            child: RichText(
                text: TextSpan(
                    children: [
                      const TextSpan(text: "Timer:  ", style:  const TextStyle(color: Colors.white)),
                      TextSpan(text: displayTime(ref).toString(), style:  const TextStyle(fontWeight: FontWeight.bold, color: Colors.white))
                    ]

                )
            )
        ),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.yellowAccent),
          padding: const EdgeInsets.all(8),
          margin:  const EdgeInsets.all(8),
          child: Text(
            "Food: $foodAvailable",
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
