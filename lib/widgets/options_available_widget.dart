import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unit_test_game/providers/game_state_provider.dart';
import 'package:unit_test_game/providers/providers.dart';

class OptionsAvailableWidget extends ConsumerWidget {
  const OptionsAvailableWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var foodAvailable = ref.watch(gameStateProvider).foodAvailable.toString();

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.orange),
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(8),
            child: const Text(
              "Exit GUI",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.red,
          ),
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(8),
          child: StreamBuilder<Object>(
            stream: ref.watch(customTimerProvider).timeStream,
            initialData: 0,
            builder: (context, snapshot) {
              return RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                        text: "Timer:  ", style: TextStyle(color: Colors.white)),
                    TextSpan(
                        text: snapshot.data.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white))
                  ],
                ),
              );
            }
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.orange),
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
          child: Text(
            "Food: $foodAvailable",
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
