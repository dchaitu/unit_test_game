import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unit_test_game/providers.dart';

class TimerPage extends ConsumerWidget {
  const TimerPage({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var countDownTimer = ref.watch(timerStateProvider);
    ref.read(timerStateProvider.notifier).runCountdown();

    print("Count DownTimer ${countDownTimer}");

    if(countDownTimer==0)
      {
        ref.read(gameCompletedProvider.notifier).timesUpGameState();
      }

    return Center(
        child:Text(
          countDownTimer.toString(),
          style: TextStyle(fontSize: 48),
        ),
    );
  }
}
