import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pudding/common/components/button/elevated_button.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';
import 'package:pudding/common/data/service/timer.dart';
import 'package:pudding/common/data/service/timer_check.dart';

class PuddingStopWatch extends ConsumerStatefulWidget {
  final void Function(int seconds)? onTick;

  const PuddingStopWatch({
    super.key,
    this.onTick,
  });

  @override
  ConsumerState<PuddingStopWatch> createState() => _PuddingStopWatchState();
}

class _PuddingStopWatchState extends ConsumerState<PuddingStopWatch> {
  bool isRunning = false;
  int _seconds = 0;
  Timer? _timer;
  bool isLoading = false;
  final TimerService _timerService = TimerService();
  final TimerCheck _timerCheck = TimerCheck();

  @override
  void initState() {
    super.initState();
    _syncServer();
  }

  Future<void> _syncServer() async {
    try {
      final timer = await _timerCheck.timerCheck();

      setState(() {
        _seconds = timer.totalTime;
        isRunning = false;
      });
    } catch (e) {
      print('에러 $e');
    }
  }

  void _start() async {
    if (isLoading) return;

    _timer?.cancel();
    setState(() => isLoading = true);

    try {
      await _timerService.timerCreate(elapsedTime: 0);

      setState(() {
        isRunning = true;
        _seconds = 0;
      });

      _timer = Timer.periodic(const Duration(seconds: 1), (_) {
        setState(() => _seconds++);
        print('$_seconds초');
        widget.onTick?.call(_seconds);
      });
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  void _stop() async {
    if (isLoading) return;
    _timer?.cancel();
    _timer = null;
    setState(() {
      debugPrint('중단 시 totalTime: $_seconds 초');
      isLoading = true;
      isRunning = false;
    });

    try {
      await _timerCheck.timerCheck();
    } catch (err) {
      print(err.toString());
    } finally {
      setState(() {
        isLoading = false;
      });
    }
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