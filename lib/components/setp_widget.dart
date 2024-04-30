import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'setp_model.dart';
export 'setp_model.dart';

class SetpWidget extends StatefulWidget {
  const SetpWidget({
    super.key,
    required this.showConnectingLine,
    required this.index,
    required this.currentIndex,
  });

  final bool? showConnectingLine;
  final int? index;
  final int? currentIndex;

  @override
  State<SetpWidget> createState() => _SetpWidgetState();
}

class _SetpWidgetState extends State<SetpWidget> {
  late SetpModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SetpModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.index! > widget.currentIndex!)
              Icon(
                Icons.radio_button_off,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 24.0,
              ),
            if (widget.index == widget.currentIndex)
              Icon(
                Icons.radio_button_checked,
                color: FlutterFlowTheme.of(context).setpColor,
                size: 24.0,
              ),
            if (widget.index! < widget.currentIndex!)
              Icon(
                Icons.check_circle_rounded,
                color: FlutterFlowTheme.of(context).setpColor,
                size: 24.0,
              ),
          ],
        ),
        if (widget.showConnectingLine ?? true)
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Divider(
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).accent4,
                ),
              ],
            ),
          ),
      ],
    );
  }
}
