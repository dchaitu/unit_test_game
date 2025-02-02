import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final countdownProvider = StateNotifierProvider<CountdownNotifier, int>((ref) {
  return CountdownNotifier();
});

class CountdownNotifier extends StateNotifier<int> {
  Timer? _timer;

  CountdownNotifier() : super(0);

  void startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      state += 1;
    });
  }

  void stopCountdown() {
    if (_timer != null) {
      _timer?.cancel();
      _timer = null;
    }
  }

  @override
  void dispose() {
    stopCountdown();
    super.dispose();
  }
}
