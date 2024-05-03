import '/components/text_for_terms_and_privacy_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'terms_and_conditions_model.dart';
export 'terms_and_conditions_model.dart';

class TermsAndConditionsWidget extends StatefulWidget {
  const TermsAndConditionsWidget({super.key});

  @override
  State<TermsAndConditionsWidget> createState() =>
      _TermsAndConditionsWidgetState();
}

class _TermsAndConditionsWidgetState extends State<TermsAndConditionsWidget> {
  late TermsAndConditionsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsAndConditionsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).appBG2,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 0.0, 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.safePop();
                      },
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Container(
                          width: 35.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: const Color(0xCCEBE8C1),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.safePop();
                            },
                            child: Icon(
                              Icons.arrow_back_ios_rounded,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 22.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'y1izfs2v' /* Terms And Conditions */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 21.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1.0,
                indent: 10.0,
                endIndent: 10.0,
                color: FlutterFlowTheme.of(context).accent2,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 30.0, 12.0, 20.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'z8ypllso' /* Welcome to FarmersMagic! These... */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 20.0, 12.0, 0.0),
                        child: wrapWithModel(
                          model: _model.textForTermsAndPrivacyModel1,
                          updateCallback: () => setState(() {}),
                          child: TextForTermsAndPrivacyWidget(
                            title: FFLocalizations.of(context).getText(
                              'pigo9fqp' /* 1. Acceptance of Terms */,
                            ),
                            text: FFLocalizations.of(context).getText(
                              'tr65c0jj' /* By accessing or using the App,... */,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 20.0, 12.0, 0.0),
                        child: wrapWithModel(
                          model: _model.textForTermsAndPrivacyModel2,
                          updateCallback: () => setState(() {}),
                          child: TextForTermsAndPrivacyWidget(
                            title: FFLocalizations.of(context).getText(
                              '6e5ousa1' /* 2. Services */,
                            ),
                            text: FFLocalizations.of(context).getText(
                              '0j6jxr9x' /* Our App provides various servi... */,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 20.0, 12.0, 0.0),
                        child: wrapWithModel(
                          model: _model.textForTermsAndPrivacyModel3,
                          updateCallback: () => setState(() {}),
                          child: TextForTermsAndPrivacyWidget(
                            title: FFLocalizations.of(context).getText(
                              'sqos998x' /* 3. User Conduct */,
                            ),
                            text: FFLocalizations.of(context).getText(
                              'uv1kqfl2' /* You agree to use the App in co... */,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 20.0, 12.0, 0.0),
                        child: wrapWithModel(
                          model: _model.textForTermsAndPrivacyModel4,
                          updateCallback: () => setState(() {}),
                          child: TextForTermsAndPrivacyWidget(
                            title: FFLocalizations.of(context).getText(
                              'p3lsfyva' /* 4. Privacy Policy */,
                            ),
                            text: FFLocalizations.of(context).getText(
                              'jmwsokit' /* Your privacy is important to u... */,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 20.0, 12.0, 0.0),
                        child: wrapWithModel(
                          model: _model.textForTermsAndPrivacyModel5,
                          updateCallback: () => setState(() {}),
                          child: TextForTermsAndPrivacyWidget(
                            title: FFLocalizations.of(context).getText(
                              'oapkzluj' /* 5. Intellectual Property */,
                            ),
                            text: FFLocalizations.of(context).getText(
                              '4nh4zyf6' /* All content, trademarks, logos... */,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 20.0, 12.0, 0.0),
                        child: wrapWithModel(
                          model: _model.textForTermsAndPrivacyModel6,
                          updateCallback: () => setState(() {}),
                          child: TextForTermsAndPrivacyWidget(
                            title: FFLocalizations.of(context).getText(
                              'gtpyrzqm' /* 6. Disclaimer of Warranties */,
                            ),
                            text: FFLocalizations.of(context).getText(
                              'vcoxohub' /* The App and its services are p... */,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 20.0, 12.0, 0.0),
                        child: wrapWithModel(
                          model: _model.textForTermsAndPrivacyModel7,
                          updateCallback: () => setState(() {}),
                          child: TextForTermsAndPrivacyWidget(
                            title: FFLocalizations.of(context).getText(
                              'kn2akgjm' /* 7. Limitation of Liability */,
                            ),
                            text: FFLocalizations.of(context).getText(
                              'wi8me3ac' /* In no event shall we be liable... */,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 20.0, 12.0, 0.0),
                        child: wrapWithModel(
                          model: _model.textForTermsAndPrivacyModel8,
                          updateCallback: () => setState(() {}),
                          child: TextForTermsAndPrivacyWidget(
                            title: FFLocalizations.of(context).getText(
                              'vagod26l' /* 8. Governing Law */,
                            ),
                            text: FFLocalizations.of(context).getText(
                              'l6czqexq' /* These Terms shall be governed ... */,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 20.0, 12.0, 0.0),
                        child: wrapWithModel(
                          model: _model.textForTermsAndPrivacyModel9,
                          updateCallback: () => setState(() {}),
                          child: TextForTermsAndPrivacyWidget(
                            title: FFLocalizations.of(context).getText(
                              '3vagjl2p' /* 9. Changes to Terms */,
                            ),
                            text: FFLocalizations.of(context).getText(
                              'usq9fi6m' /* We reserve the right to modify... */,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 20.0, 12.0, 0.0),
                        child: wrapWithModel(
                          model: _model.textForTermsAndPrivacyModel10,
                          updateCallback: () => setState(() {}),
                          child: TextForTermsAndPrivacyWidget(
                            title: FFLocalizations.of(context).getText(
                              'hwfh5blt' /* 10. Contact Us */,
                            ),
                            text: FFLocalizations.of(context).getText(
                              'xvark6qh' /* If you have any questions or c... */,
                            ),
                          ),
                        ),
                      ),
                    ].addToEnd(const SizedBox(height: 20.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
