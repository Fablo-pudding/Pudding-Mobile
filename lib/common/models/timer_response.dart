class TimerResponse {
  final int elapsedTime;

  TimerResponse({required this.elapsedTime});

  factory TimerResponse.fromJson(Map<String, dynamic> json) {
    return TimerResponse(elapsedTime: json['elapsedTime']);
  }
}
