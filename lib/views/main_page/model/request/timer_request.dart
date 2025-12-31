class TimerRequest {
  final int elapsedTime;

  TimerRequest({
    required this.elapsedTime,
  });

  TimerRequest toJson() {
    return TimerRequest(elapsedTime: elapsedTime);
  }
}
