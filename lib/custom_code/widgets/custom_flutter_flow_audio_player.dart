// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

//import '/flutter_flow/flutter_flow_util.dart';

import 'dart:math' as math;
import 'package:assets_audio_player/assets_audio_player.dart';

import '/flutter_flow/flutter_flow_util.dart' show routeObserver;

export 'package:assets_audio_player/assets_audio_player.dart';

class CustomFlutterFlowAudioPlayer extends StatefulWidget {
  const CustomFlutterFlowAudioPlayer({
    super.key,
    this.width,
    this.height,
    required this.audio,
    required this.titleTextStyle,
    required this.playbackDurationTextStyle,
    required this.fillColor,
    required this.playbackButtonColor,
    required this.activeTrackColor,
    this.inactiveTrackColor,
    required this.elevation,
    this.pauseOnNavigate = true,
    required this.playInBackground,
  });

  final Audio audio;
  final TextStyle titleTextStyle;
  final TextStyle playbackDurationTextStyle;
  final Color fillColor;
  final Color playbackButtonColor;
  final Color activeTrackColor;
  final Color? inactiveTrackColor;
  final double elevation;
  final bool pauseOnNavigate;
  final PlayInBackground playInBackground;

  final double? width;
  final double? height;

  @override
  State<CustomFlutterFlowAudioPlayer> createState() =>
      _CustomFlutterFlowAudioPlayerState();
}

class _CustomFlutterFlowAudioPlayerState
    extends State<CustomFlutterFlowAudioPlayer> with RouteAware {
  AssetsAudioPlayer? _assetsAudioPlayer;
  bool _subscribedRoute = false;

  @override
  void initState() {
    super.initState();
    openPlayer();
  }

  Future openPlayer() async {
    _assetsAudioPlayer ??=
        AssetsAudioPlayer.withId(generateRandomAlphaNumericString());
    if (_assetsAudioPlayer?.playlist != null) {
      _assetsAudioPlayer!.playlist!.replaceAt(0, (oldAudio) => widget.audio);
    } else {
      await _assetsAudioPlayer!.open(
        Playlist(audios: [widget.audio]),
        autoStart: false,
        playInBackground: widget.playInBackground,
      );
    }
  }

  @override
  void dispose() {
    if (_subscribedRoute) {
      routeObserver.unsubscribe(this);
    }
    _assetsAudioPlayer?.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(CustomFlutterFlowAudioPlayer old) {
    super.didUpdateWidget(old);
    final changed = old.audio.path != widget.audio.path ||
        old.audio.audioType != widget.audio.audioType;
    final isPlaying = _assetsAudioPlayer?.isPlaying.value ?? false;
    if (changed && !isPlaying) {
      openPlayer();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.pauseOnNavigate && ModalRoute.of(context) is PageRoute) {
      _subscribedRoute = true;
      routeObserver.subscribe(this, ModalRoute.of(context)!);
    }
  }

  @override
  void didPushNext() {
    if (widget.pauseOnNavigate) {
      _assetsAudioPlayer?.pause();
    }
  }

  Duration currentPosition(RealtimePlayingInfos infos) =>
      infos.currentPosition.ensureFinite;
  Duration duration(RealtimePlayingInfos infos) => infos.duration.ensureFinite;

  String playbackStateText(RealtimePlayingInfos infos) {
    final currentPositionString = durationToString(currentPosition(infos));
    final durationString = durationToString(duration(infos));
    return '$currentPositionString/$durationString';
  }

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _assetsAudioPlayer!.builderRealtimePlayingInfos(
              builder: (context, infos) => PlayerBuilder.isPlaying(
                  player: _assetsAudioPlayer!,
                  builder: (context, isPlaying) {
                    final childWidget = Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: BoxDecoration(
                        color: widget.fillColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(34),
                                child: Material(
                                  color: Colors.transparent,
                                  child: IconButton(
                                    onPressed: _assetsAudioPlayer!.playOrPause,
                                    icon: Icon(
                                      (isPlaying)
                                          ? Icons.pause_circle
                                          : Icons.play_circle,
                                      color: widget.playbackButtonColor,
                                      size: 26,
                                    ),
                                    iconSize: 24,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: PositionSeekWidget(
                                  currentPosition: currentPosition(infos),
                                  duration: duration(infos),
                                  seekTo: (to) {
                                    _assetsAudioPlayer!.seek(to);
                                  },
                                  activeTrackColor: widget.activeTrackColor,
                                  inactiveTrackColor: widget.inactiveTrackColor,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    end: 8, bottom: 8),
                                child: Text(
                                  playbackStateText(infos),
                                  style: widget.playbackDurationTextStyle,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                    return Material(
                        color: Colors.transparent,
                        elevation: widget.elevation,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: childWidget);
                  }))
        ],
      );
}

class PositionSeekWidget extends StatefulWidget {
  const PositionSeekWidget({
    required this.currentPosition,
    required this.duration,
    required this.seekTo,
    required this.activeTrackColor,
    this.inactiveTrackColor,
  });

  final Duration currentPosition;
  final Duration duration;
  final Function(Duration) seekTo;
  final Color activeTrackColor;
  final Color? inactiveTrackColor;

  @override
  _PositionSeekWidgetState createState() => _PositionSeekWidgetState();
}

class _PositionSeekWidgetState extends State<PositionSeekWidget> {
  late Duration _visibleValue;
  bool listenOnlyUserInteraction = false;
  double get percent => widget.duration.inMilliseconds == 0
      ? 0
      : _visibleValue.inMilliseconds / widget.duration.inMilliseconds;

  @override
  void initState() {
    super.initState();
    _visibleValue = widget.currentPosition;
  }

  @override
  void didUpdateWidget(PositionSeekWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!listenOnlyUserInteraction) {
      _visibleValue = widget.currentPosition;
    }
  }

  @override
  Widget build(BuildContext context) => SliderTheme(
        data: SliderTheme.of(context).copyWith(
          activeTrackColor: widget.activeTrackColor,
          inactiveTrackColor:
              widget.inactiveTrackColor ?? const Color(0xFFC9D0D5),
          trackHeight: 6.0,
          thumbShape: SliderComponentShape.noThumb,
          overlayColor: const Color(0xFF57636C).withAlpha(32),
          overlayShape: const RoundSliderOverlayShape(overlayRadius: 12.0),
        ),
        child: Slider(
          min: 0,
          max: widget.duration.inMilliseconds.toDouble(),
          value: math.min(1.0, percent) *
              widget.duration.inMilliseconds.toDouble(),
          onChangeEnd: (newValue) => setState(() {
            listenOnlyUserInteraction = false;
            widget.seekTo(_visibleValue);
          }),
          onChangeStart: (_) =>
              setState(() => listenOnlyUserInteraction = true),
          onChanged: (newValue) => setState(
              () => _visibleValue = Duration(milliseconds: newValue.floor())),
        ),
      );
}

String durationToString(Duration duration) {
  String twoDigits(int n) => (n >= 10) ? '$n' : '0$n';

  final twoDigitMinutes =
      twoDigits(duration.inMinutes.remainder(Duration.minutesPerHour).toInt());
  final twoDigitSeconds = twoDigits(
      duration.inSeconds.remainder(Duration.secondsPerMinute).toInt());
  return '$twoDigitMinutes:$twoDigitSeconds';
}

String generateRandomAlphaNumericString() {
  const chars = 'abcdefghijklmnopqrstuvwxyz1234567890';
  return String.fromCharCodes(Iterable.generate(
      8, (_) => chars.codeUnits[math.Random().nextInt(chars.length)]));
}

extension _AudioPlayerDurationExtensions on Duration {
  Duration get ensureFinite => inMicroseconds.isFinite ? this : Duration.zero;
}
