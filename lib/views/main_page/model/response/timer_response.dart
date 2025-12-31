class TimerResponse {
  final int elapsedTime;
  final int timerId;

  TimerResponse({required this.elapsedTime, required this.timerId});

  factory TimerResponse.fromJson(Map<String,dynamic>json){
    return TimerResponse(elapsedTime: json['elapsedTime'], timerId: json['timerId']);
  }
}