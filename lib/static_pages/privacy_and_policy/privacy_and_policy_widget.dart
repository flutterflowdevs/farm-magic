import '/delete/text_for_terms_and_privacy/text_for_terms_and_privacy_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'privacy_and_policy_model.dart';
export 'privacy_and_policy_model.dart';

class PrivacyAndPolicyWidget extends StatefulWidget {
  const PrivacyAndPolicyWidget({super.key});

  @override
  State<PrivacyAndPolicyWidget> createState() => _PrivacyAndPolicyWidgetState();
}

class _PrivacyAndPolicyWidgetState extends State<PrivacyAndPolicyWidget> {
  late PrivacyAndPolicyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrivacyAndPolicyModel());
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
                                  'jffi62ux' /* Privacy Policy */,
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
                                  'bufhn50m' /* At Farm Help, we value the pri... */,
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
                              'fsye8mee' /* 1. Information We Collect: */,
                            ),
                            text: FFLocalizations.of(context).getText(
                              '05natrgr' /* i) Personal Information: When ... */,
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
                              'fv7ynkr1' /* 2. How We Use Your Information... */,
                            ),
                            text: FFLocalizations.of(context).getText(
                              'n1snpnqh' /* i) Personalization: We use you... */,
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
                              'kl2msotj' /* 3. Information Sharing: */,
                            ),
                            text: FFLocalizations.of(context).getText(
                              'bv8zhplh' /* i) Third-Party Service Provide... */,
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
                              'zdmejttk' /* 4. Data Security: */,
                            ),
                            text: FFLocalizations.of(context).getText(
                              '9myv36dr' /* i) We employ industry-standard... */,
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
                              'rs4cp7vf' /* 5. Your Choices: */,
                            ),
                            text: FFLocalizations.of(context).getText(
                              'q9rtvb5l' /* i) Account Settings: You can r... */,
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
                              '8ukg0unv' /* 6. Children's Privacy: */,
                            ),
                            text: FFLocalizations.of(context).getText(
                              'e8tc87q0' /* Our app is not intended for in... */,
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
                              'ys7czstm' /* 7. Updates to this Policy: */,
                            ),
                            text: FFLocalizations.of(context).getText(
                              '5rjme14h' /* We may update this Privacy Pol... */,
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
                              '1uo0odbw' /* 8. Governing Law */,
                            ),
                            text: FFLocalizations.of(context).getText(
                              '69a1l9v3' /* These Terms shall be governed ... */,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 30.0, 12.0, 20.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'yu4uslo6' /* If you have any questions or c... */,
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
