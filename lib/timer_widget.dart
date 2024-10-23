import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'game_state_provider.dart';

class TimerPage extends ConsumerWidget {
  const TimerPage({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var countDownTimer = ref.watch(gameStateProvider).countDown;
    ref.read(gameStateProvider.notifier).runCountdown();

    print("Count DownTimer ${countDownTimer}");

    if(countDownTimer==0)
      {
        ref.read(gameStateProvider.notifier).timesUpGameState();
      }

    return Center(
        child:Text(
          countDownTimer.toString(),
          style: TextStyle(fontSize: 48),
        ),
    );
  }
}
