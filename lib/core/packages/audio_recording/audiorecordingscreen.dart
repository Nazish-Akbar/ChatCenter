import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home/message_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:just_audio/just_audio.dart' as ap;

import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:record/record.dart';
import '../../constants/colors.dart';
import './audio_player.dart';

const primaryColor = Colors.black;

class AudioRecorder extends StatefulWidget {
  final void Function(String path) onStop;

  const AudioRecorder({required this.onStop});

  @override
  _AudioRecorderState createState() => _AudioRecorderState();
}

class _AudioRecorderState extends State<AudioRecorder> {
  bool _isRecording = false;
  bool _isPaused = false;
  int _recordDuration = 0;
  Timer? _timer;
  Timer? _ampTimer;
  final _audioRecorder = Record();
  Amplitude? _amplitude;

  late Directory appDirectory;
  String? path;

  void _getDir() async {
    appDirectory = await getApplicationDocumentsDirectory();
    // _preparePlayers();
    path = "${appDirectory.path}/voice.m4a";
  }

  @override
  void initState() {
    _getDir();
    _isRecording = false;
    super.initState();
  }

  @override
  void dispose() {
    print("*********Audio Recorder Disposed*********");
    _timer?.cancel();
    _ampTimer?.cancel();
    _audioRecorder.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(
        //   body:
        Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildRecordStopControl(),
            // SizedBox(width: 20.w),
            _buildPauseResumeControl(),
            // SizedBox(width: 20.w),
            _buildText(),
          ],
        ),
        // if (_amplitude != null) ...[
        //   SizedBox(height: 30.h),
        //   Text('Current: ${_amplitude?.current ?? 0.0}'),
        //   Text('Max: ${_amplitude?.max ?? 0.0}'),
        // ],
      ],
      // ),
    );
  }

  Widget _buildRecordStopControl() {
    late Icon icon;
    late Color color;

    if (_isRecording || _isPaused) {
      icon = Icon(
        Icons.stop,
        color: Colors.red,
        size: 30.r,
      );
      color = Colors.red.withOpacity(0.1);
    } else {
      final theme = Theme.of(context);
      icon = Icon(
        Icons.mic,
        color: primaryColor,
        size: 40.r,
      );
      color = primaryColor.withOpacity(0.1);
    }

    return ClipOval(
      child: Material(
        color: color,
        child: InkWell(
          child: SizedBox(
            width: 65.w,
            height: 65.h,
            child: icon,
          ),
          onTap: () {
            _isRecording ? _stop() : _start();
          },
        ),
      ),
    );
  }

  Widget _buildPauseResumeControl() {
    if (!_isRecording && !_isPaused) {
      return const SizedBox.shrink();
    }

    late Icon icon;
    late Color color;

    if (!_isPaused) {
      icon = Icon(
        Icons.pause,
        color: Colors.red,
        size: 30.r,
      );
      color = Colors.red.withOpacity(0.1);
    } else {
      final theme = Theme.of(context);
      icon = Icon(
        Icons.play_arrow,
        color: Colors.red,
        size: 30.r,
      );
      color = primaryColor.withOpacity(0.1);
    }

    return Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: ClipOval(
        child: Material(
          color: color,
          child: InkWell(
            child: SizedBox(
              width: 65.w,
              height: 65.h,
              child: icon,
            ),
            onTap: () {
              _isPaused ? _resume() : _pause();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildText() {
    if (_isRecording || _isPaused) {
      return _buildTimer();
    }
    return Text("");

    // return Text(
    //   "Waiting to record",
    //   style: TextStyle(
    //     fontSize: 12.sp,
    //   ),
    // );
  }

  Widget _buildTimer() {
    final String minutes = _formatNumber(_recordDuration ~/ 60);
    final String seconds = _formatNumber(_recordDuration % 60);

    return Text(
      '   $minutes : $seconds',
      style: TextStyle(
        color: Colors.red,
        fontSize: 20.sp,
      ),
    );
  }

  String _formatNumber(int number) {
    String numberStr = number.toString();
    if (number < 10) {
      numberStr = '0' + numberStr;
    }

    return numberStr;
  }

  Future<void> _start() async {
    try {
      if (await _audioRecorder.hasPermission()) {
        await _audioRecorder.start(
          encoder: AudioEncoder.aacLc,
          path: path,
        );

        bool isRecording = await _audioRecorder.isRecording();
        setState(() {
          _isRecording = isRecording;
          _recordDuration = 0;
        });

        _startTimer();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _stop() async {
    _timer?.cancel();
    _ampTimer?.cancel();
    path = await _audioRecorder.stop();
    print("*********Audio Recorder Stopped*********");
    print("PATH AFTER STOPPED: $path");
    final finalPath = "file://" + path!;
    print("Final Path = $finalPath");
    // widget.onStop("file://${path!}");
    widget.onStop(finalPath);

    setState(() => _isRecording = false);
  }

  Future<void> _pause() async {
    _timer?.cancel();
    _ampTimer?.cancel();
    await _audioRecorder.pause();

    setState(() => _isPaused = true);
  }

  Future<void> _resume() async {
    _startTimer();
    await _audioRecorder.resume();

    setState(() => _isPaused = false);
  }

  void _startTimer() {
    _timer?.cancel();
    _ampTimer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() => _recordDuration++);
    });

    _ampTimer =
        Timer.periodic(const Duration(milliseconds: 200), (Timer t) async {
      _amplitude = await _audioRecorder.getAmplitude();
      setState(() {});
    });
  }
}

/////
///
///
///
///
///
///
///
///

class AudioRecordingScreen extends StatefulWidget {
  bool showPlayer;
  String audioFilePath;
  ap.AudioSource? audioSource;
  // final void Function(String path) onDoneRecording;
  AudioRecordingScreen({
    this.audioFilePath = "",
    this.showPlayer = false,
    this.audioSource,
  });

  @override
  _AudioRecordingScreenState createState() => _AudioRecordingScreenState();
}

class _AudioRecordingScreenState extends State<AudioRecordingScreen> {
  // ap.AudioSource? audioSource;

  @override
  void initState() {
    // widget.showPlayer = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MessageProvider _messageProvider = Provider.of<MessageProvider>(context);
    return Center(
      child: widget.showPlayer
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: AudioPlayer(
                  audioFilePath: widget.audioFilePath,
                  source: widget.audioSource!,
                  onDelete: () {
                    setState(
                      () {
                        widget.showPlayer = false;
                        _messageProvider.clearAudioPath();
                        widget.audioFilePath = "";
                        widget.showPlayer = false;
                        widget.audioSource = null;
                      },
                    );
                  }
                  // onDoneRecording: onDoneRecording,
                  ),
            )
          : AudioRecorder(
              onStop: (path) {
                setState(
                  () {
                    print("path = $path");
                    widget.audioSource = ap.AudioSource.uri(Uri.parse(path));
                    widget.showPlayer = true;
                    widget.audioFilePath = path;
                  },
                );
                _messageProvider.setAudioPath(widget.audioFilePath);
              },
            ),
    );
  }
}
