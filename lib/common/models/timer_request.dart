class TimerRequest {
  final int elapsedTime;

  TimerRequest({
    required this.elapsedTime,
  });

  TimerRequest toJson() {
    return TimerRequest(elapsedTime: elapsedTime);
  }
  factory TimerRequest.fromJson(Map<String, dynamic>json){
    return TimerRequest(elapsedTime: json['elapsedTime']);
  }
}
