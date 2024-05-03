import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'heading_container_model.dart';
export 'heading_container_model.dart';

class HeadingContainerWidget extends StatefulWidget {
  const HeadingContainerWidget({
    super.key,
    this.heading,
    this.shownSeeAll,
  });

  final String? heading;
  final bool? shownSeeAll;

  @override
  State<HeadingContainerWidget> createState() => _HeadingContainerWidgetState();
}

class _HeadingContainerWidgetState extends State<HeadingContainerWidget> {
  late HeadingContainerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeadingContainerModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            valueOrDefault<String>(
              widget.heading,
              'Categories',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  color: FlutterFlowTheme.of(context).secondaryText,
                  fontSize: 17.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          if (false)
            Text(
              'See All >',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 12.0,
                    letterSpacing: 0.0,
                  ),
            ),
        ],
      ),
    );
  }
}
