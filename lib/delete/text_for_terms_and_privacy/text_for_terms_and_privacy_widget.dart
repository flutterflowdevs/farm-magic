import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'text_for_terms_and_privacy_model.dart';
export 'text_for_terms_and_privacy_model.dart';

class TextForTermsAndPrivacyWidget extends StatefulWidget {
  const TextForTermsAndPrivacyWidget({
    super.key,
    required this.title,
    required this.text,
  });

  final String? title;
  final String? text;

  @override
  State<TextForTermsAndPrivacyWidget> createState() =>
      _TextForTermsAndPrivacyWidgetState();
}

class _TextForTermsAndPrivacyWidgetState
    extends State<TextForTermsAndPrivacyWidget> {
  late TextForTermsAndPrivacyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TextForTermsAndPrivacyModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                valueOrDefault<String>(
                  widget.title,
                  'abc',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Text(
                valueOrDefault<String>(
                  widget.text,
                  'abc',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
