import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'prompt_to_video_loader_model.dart';
export 'prompt_to_video_loader_model.dart';

class PromptToVideoLoaderWidget extends StatefulWidget {
  const PromptToVideoLoaderWidget({
    super.key,
    required this.height,
    required this.width,
  });

  final double? height;
  final double? width;

  @override
  State<PromptToVideoLoaderWidget> createState() =>
      _PromptToVideoLoaderWidgetState();
}

class _PromptToVideoLoaderWidgetState extends State<PromptToVideoLoaderWidget> {
  late PromptToVideoLoaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PromptToVideoLoaderModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/lottie_animations/Animation_-_1714209062580_(1).json',
            width: MediaQuery.sizeOf(context).width * 0.75,
            height: MediaQuery.sizeOf(context).height * 0.75,
            fit: BoxFit.contain,
            frameRate: FrameRate(60.0),
            animate: true,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 22.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                'mednax8d' /* Hold for couple of minutes, wh... */,
              ),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    fontSize: 18.0,
                    letterSpacing: 0.0,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
