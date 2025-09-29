import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pudding/common/components/button/elevated_button.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';

class PuddingStopWatch extends StatefulWidget {
  final void Function(int seconds)? onTick;

  const PuddingStopWatch({
    Key? key,
    this.onTick,
  }) : super(key: key);

  @override
  State<PuddingStopWatch> createState() => _PuddingStopWatchState();
}

class _PuddingStopWatchState extends State<PuddingStopWatch> {
  bool isRunning = false;
  int _seconds = 0;
  Timer? _timer;

  void _start() {
    setState(() => isRunning = true);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() => _seconds++);
      widget.onTick?.call(_seconds);
    });
  }

  void _stop() {
    setState(() => isRunning = false);
    _timer?.cancel();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final buttonText = isRunning ? '공부 중단하기' : '공부 시작하기';

    return PuddingElevatedButton(
      backgroundColor: PuddingColor.brown,
      onPressed: isRunning ? _stop : _start,
      child: Text(
        buttonText,
        style: PuddingTextStyle.body1.copyWith(color: PuddingColor.background),
      ),
    );
  }
}
