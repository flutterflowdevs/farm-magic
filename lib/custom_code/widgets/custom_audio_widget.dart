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

import 'custom_flutter_flow_audio_player.dart';
import 'index.dart'; // Imports other custom widgets

class CustomAudioWidget extends StatefulWidget {
  const CustomAudioWidget({
    super.key,
    this.width,
    this.height,
    required this.audioUrl,
    required this.backgroundColor,
  });

  final double? width;
  final double? height;
  final String audioUrl;
  final Color backgroundColor;

  @override
  State<CustomAudioWidget> createState() => _CustomAudioWidgetState();
}

class _CustomAudioWidgetState extends State<CustomAudioWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomFlutterFlowAudioPlayer(
      audio: Audio.network(
        widget.audioUrl,
        metas: Metas(
          id: 'sample3.mp3-577d9b83',
        ),
      ),
      titleTextStyle: FlutterFlowTheme.of(context).titleLarge.override(
            fontFamily: 'Outfit',
            fontSize: 12.0,
            letterSpacing: 0.0,
          ),
      playbackDurationTextStyle:
          FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: 'Readex Pro',
                letterSpacing: 0.0,
              ),
      fillColor: widget.backgroundColor,
      playbackButtonColor: FlutterFlowTheme.of(context).primary,
      activeTrackColor: FlutterFlowTheme.of(context).alternate,
      elevation: 0,
      playInBackground: PlayInBackground.disabledRestoreOnForeground,
    );
  }
}
