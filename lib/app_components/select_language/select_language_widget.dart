import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'select_language_model.dart';
export 'select_language_model.dart';

class SelectLanguageWidget extends StatefulWidget {
  const SelectLanguageWidget({super.key});

  @override
  State<SelectLanguageWidget> createState() => _SelectLanguageWidgetState();
}

class _SelectLanguageWidgetState extends State<SelectLanguageWidget> {
  late SelectLanguageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectLanguageModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
        child: Builder(
          builder: (context) {
            final langItem = FFAppState().LanguageList.map((e) => e).toList();
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(langItem.length, (langItemIndex) {
                final langItemItem = langItem[langItemIndex];
                return InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    setState(() {
                      FFAppState().selectedLanguageCode = langItemItem.langCode;
                    });
                    setAppLanguage(context, FFAppState().selectedLanguageCode);
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 18.0,
                        height: 18.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 1.5,
                          ),
                        ),
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Visibility(
                          visible: langItemItem.langCode ==
                              FFAppState().selectedLanguageCode,
                          child: Container(
                            width: 10.0,
                            height: 10.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        langItemItem.langName,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ].divide(const SizedBox(width: 8.0)),
                  ),
                );
              })
                  .divide(const SizedBox(height: 6.0))
                  .addToStart(const SizedBox(height: 12.0))
                  .addToEnd(const SizedBox(height: 12.0)),
            );
          },
        ),
      ),
    );
  }
}
