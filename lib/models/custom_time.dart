import 'dart:async';

class CustomTimer {
  final StreamController<int> _controller = StreamController<int>();
  Timer? _timer;
  int _currentTime = 0;

  /// Starts the timer, emitting the current time every second.
  void startTimer() {
    // If the timer is already running, do nothing
    if (_timer != null && _timer!.isActive) return;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _currentTime++;
      _controller.add(_currentTime); // Emit the current time
    });
  }

  /// Stops the timer. The current time remains unchanged.
  void stopTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null; // Clear the timer
    }
  }

  /// Returns a stream of the current time.
  Stream<int> get timeStream => _controller.stream;

  /// Clean up resources when done.
  void dispose() {
    stopTimer();
    _controller.close();
  }
}