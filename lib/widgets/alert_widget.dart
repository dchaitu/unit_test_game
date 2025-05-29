import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unit_test_game/providers/game_state_provider.dart';

class AlertWidget extends ConsumerWidget {
  final String result;
  final String comment;
  final Color bgColor;
  const AlertWidget(
      {super.key,
      required this.bgColor,
      required this.result,
      required this.comment});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final bool isSmallScreen = width < 600;

    return Dialog(
      backgroundColor: bgColor.withValues(alpha: 1.0), // Ensure full opacity
      insetPadding: EdgeInsets.symmetric(
        horizontal: isSmallScreen ? 16 : width * 0.1,
        vertical: isSmallScreen ? 24 : height * 0.1,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: isSmallScreen ? width * 0.9 : 500,
          maxHeight: height * 0.7,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Game Completed',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  result,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 14),
                Text(
                  comment,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    ref.read(gameStateProvider.notifier).resetGameState();
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 3,
                  ),
                  child: const Text(
                    'Restart',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
