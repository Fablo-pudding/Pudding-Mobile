class TimerResponse {
  final int totalTime;

  TimerResponse({required this.totalTime});

  factory TimerResponse.fromJson(Map<String, dynamic> json) {
    return TimerResponse(totalTime: json['totalTime']);
  }

  Map<String, dynamic> toJson() {
    return {'totalTime' : totalTime};
  }
}