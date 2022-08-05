import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/colors.dart';
import 'package:flutter_application_1/screens/home/message_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:helpal/ui/screens/plumber_screens/hire_plumber_screen/hire_plumber_provider.dart';
import 'package:just_audio/just_audio.dart' as ap;
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';

// import '../../constants/colors.dart';

// const redColor = Colors.black;
class AudioPlayer extends StatefulWidget {
  /// Path from where to play recorded audio

  final ap.AudioSource source;
  final String audioFilePath;

  /// Callback when audio file should be removed
  /// Setting this to null hides the delete button
  final VoidCallback onDelete;
  bool showDone;
  bool showDeleteButton;
  AudioPlayer({
    required this.source,
    required this.onDelete,
    required this.audioFilePath,
    this.showDone = true,
    this.showDeleteButton = true,
  });

  @override
  AudioPlayerState createState() => AudioPlayerState();
}

class AudioPlayerState extends State<AudioPlayer> {
  final _audioPlayer = ap.AudioPlayer();
  late StreamSubscription<ap.PlayerState> _playerStateChangedSubscription;
  late StreamSubscription<Duration?> _durationChangedSubscription;
  late StreamSubscription<Duration> _positionChangedSubscription;

  @override
  void initState() {
    _playerStateChangedSubscription =
        _audioPlayer.playerStateStream.listen((state) async {
      if (state.processingState == ap.ProcessingState.completed) {
        await stop();
      }
      setState(() {});
    });
    _positionChangedSubscription =
        _audioPlayer.positionStream.listen((position) => setState(() {}));
    _durationChangedSubscription =
        _audioPlayer.durationStream.listen((duration) => setState(() {}));
    _init();

    super.initState();
  }

  Future<void> _init() async {
    await _audioPlayer.setAudioSource(widget.source);
  }

  @override
  void dispose() {
    _playerStateChangedSubscription.cancel();
    _positionChangedSubscription.cancel();
    _durationChangedSubscription.cancel();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var provider = Provider;
    var _messageProvider = Provider.of<MessageProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildControl(),
            Expanded(child: _buildSlider()),
            !widget.showDeleteButton
                ? SizedBox()
                : IconButton(
                    iconSize: 35.sp,
                    icon: Icon(
                      Icons.delete,

                      color: const Color(0xFF73748D),
                      // size: _deleteBtnSize,
                    ),
                    onPressed: () {
                      _audioPlayer.stop().then(
                            (value) => widget.onDelete(),
                          );
                    },
                  ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        !widget.showDone
            ? SizedBox()
            : TextButton(
                style: TextButton.styleFrom(
                  // primary: Colors.purple,

                  backgroundColor: redColor,
                  // textStyle: TextStyle(
                  //   color: Colors.white,
                  // ),
                  // color: Colors.white,
                ),
                onPressed: () async {


                 // await model.databaseStorageServices.uploadAudioToStorage(voiceNote!);
                   await _messageProvider.setAudioPath(widget.audioFilePath);
                  setState(() {});
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    'Done',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
              ),
      ],
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return
  //   LayoutBuilder(
  //     builder: (context, constraints) {
  //       return

  //       Row(
  //         mainAxisSize: MainAxisSize.max,
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: <Widget>[
  //           _buildControl(),
  //           _buildSlider(constraints.maxWidth),
  //           IconButton(
  //             icon: Icon(Icons.delete,
  //                 color: const Color(0xFF73748D), size: _deleteBtnSize),
  //             onPressed: () {
  //               _audioPlayer.stop().then((value) => widget.onDelete());
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  Widget _buildControl() {
    Icon icon;
    Color color;
    final theme = Theme.of(context);
    if (_audioPlayer.playerState.playing) {
      icon = Icon(
        Icons.pause,
        // color: Colors.red,
        color: redColor,
        // size: 30.r,
      );
      // color = Colors.red.withOpacity(0.1);
      color = redColor.withOpacity(0.1);
    } else {
      // final theme = Theme.of(context);
      icon = Icon(
        Icons.play_arrow,
        color: redColor,
        // size: 40.r,
      );
      color = redColor.withOpacity(0.1);
    }

    return

        // IconButton(
        //   onPressed: () {
        //     if (_audioPlayer.playerState.playing) {
        //       pause();
        //     } else {
        //       play();
        //     }
        //   },
        //   icon: icon,
        // );

        Material(
      color: color,
      clipBehavior: Clip.hardEdge,
      shape: CircleBorder(),
      child: IconButton(
        iconSize: 40.sp,
        // child: SizedBox(
        //   child: icon,
        // ),
        icon: icon,
        onPressed: () {
          if (_audioPlayer.playerState.playing) {
            pause();
          } else {
            play();
          }
        },
      ),
    );
  }

  Widget _buildSlider() {
    final position = _audioPlayer.position;
    final duration = _audioPlayer.duration;
    bool canSetValue = false;
    if (duration != null) {
      canSetValue = position.inMilliseconds > 0;
      canSetValue &= position.inMilliseconds < duration.inMilliseconds;
    }

    return SizedBox(
      child: Slider(
        activeColor: redColor.withOpacity(0.9),
        inactiveColor: redColor.withOpacity(0.5),
        onChanged: (v) {
          if (duration != null) {
            final position = v * duration.inMilliseconds;
            _audioPlayer.seek(Duration(milliseconds: position.round()));
          }
        },
        value: canSetValue && duration != null
            ? position.inMilliseconds / duration.inMilliseconds
            : 0.0,
      ),
    );
  }

  Future<void> play() {
    return _audioPlayer.play();
  }

  Future<void> pause() {
    return _audioPlayer.pause();
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
    return _audioPlayer.seek(const Duration(milliseconds: 0));
  }
}
