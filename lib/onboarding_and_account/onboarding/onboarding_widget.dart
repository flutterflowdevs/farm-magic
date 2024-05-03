import '/app_components/onboarding_flow/onboarding_flow_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'onboarding_model.dart';
export 'onboarding_model.dart';

class OnboardingWidget extends StatefulWidget {
  const OnboardingWidget({super.key});

  @override
  State<OnboardingWidget> createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget> {
  late OnboardingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingModel());
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
          child: Material(
            color: Colors.transparent,
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).appBG2,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 2.0,
                    color: Color(0x33000000),
                    offset: Offset(
                      1.0,
                      1.0,
                    ),
                    spreadRadius: 1.0,
                  )
                ],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      height: 500.0,
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                        child: PageView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: _model.pageViewController ??=
                              PageController(
                                  initialPage: max(
                                      0,
                                      min(
                                          valueOrDefault<int>(
                                            _model.pageIndex,
                                            0,
                                          ),
                                          3))),
                          scrollDirection: Axis.horizontal,
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 5.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.onboardingFlowModel1,
                                      updateCallback: () => setState(() {}),
                                      child: OnboardingFlowWidget(
                                        placeholder:
                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/farmers-help-rb0ek4/assets/hmvxze2yopdn/Farmer-amico.png',
                                        title:
                                            FFLocalizations.of(context).getText(
                                          'raiejvye' /* Farmers */,
                                        ),
                                        description:
                                            FFLocalizations.of(context).getText(
                                          'co9cuclt' /* A farmer is a person engaged i... */,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 5.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.onboardingFlowModel2,
                                      updateCallback: () => setState(() {}),
                                      child: OnboardingFlowWidget(
                                        placeholder:
                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/farmers-help-rb0ek4/assets/l7rb9ou5426n/Laboratory-cuate.png',
                                        title:
                                            FFLocalizations.of(context).getText(
                                          'b9lp1kl9' /* Agri Experts */,
                                        ),
                                        description:
                                            FFLocalizations.of(context).getText(
                                          'juf07jfx' /* Agricultural Scientist is the ... */,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 5.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.onboardingFlowModel3,
                                      updateCallback: () => setState(() {}),
                                      child: OnboardingFlowWidget(
                                        placeholder:
                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/farmers-help-rb0ek4/assets/qwkwskiqranm/Thesis-amico.png',
                                        title:
                                            FFLocalizations.of(context).getText(
                                          '8ek3xt24' /* Agri Study */,
                                        ),
                                        description:
                                            FFLocalizations.of(context).getText(
                                          'hfmhkcy5' /* Agriculture course is an acade... */,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 5.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.onboardingFlowModel4,
                                      updateCallback: () => setState(() {}),
                                      child: OnboardingFlowWidget(
                                        placeholder:
                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/farmers-help-rb0ek4/assets/4p48omhg8n4k/Marketplace-amico.png',
                                        title:
                                            FFLocalizations.of(context).getText(
                                          'm2fwl0gn' /* Agri Store */,
                                        ),
                                        description:
                                            FFLocalizations.of(context).getText(
                                          'm5dsgxsj' /* A supermarket is a self-servic... */,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 45.0,
                    child: Stack(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 9.0,
                                          height: 9.0,
                                          decoration: BoxDecoration(
                                            color: _model.pageIndex == 0
                                                ? FlutterFlowTheme.of(context)
                                                    .tertiary
                                                : const Color(0x00000000),
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              width: 1.0,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 9.0,
                                          height: 9.0,
                                          decoration: BoxDecoration(
                                            color: _model.pageIndex == 1
                                                ? FlutterFlowTheme.of(context)
                                                    .tertiary
                                                : const Color(0x00000000),
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              width: 1.0,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 9.0,
                                          height: 9.0,
                                          decoration: BoxDecoration(
                                            color: _model.pageIndex == 2
                                                ? FlutterFlowTheme.of(context)
                                                    .tertiary
                                                : const Color(0x00000000),
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              width: 1.0,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 9.0,
                                          height: 9.0,
                                          decoration: BoxDecoration(
                                            color: _model.pageIndex == 3
                                                ? FlutterFlowTheme.of(context)
                                                    .tertiary
                                                : const Color(0x00000000),
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              width: 1.0,
                                            ),
                                          ),
                                        ),
                                      ].divide(const SizedBox(width: 5.5)),
                                    ),
                                  ),
                                  if (_model.pageIndex <= 2)
                                    Align(
                                      alignment: const AlignmentDirectional(1.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 30.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            setState(() {
                                              _model.pageIndex =
                                                  _model.pageIndex + 1;
                                            });
                                            unawaited(
                                              () async {
                                                await _model.pageViewController
                                                    ?.nextPage(
                                                  duration: const Duration(
                                                      milliseconds: 300),
                                                  curve: Curves.ease,
                                                );
                                              }(),
                                            );
                                          },
                                          child: const Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: Color(0xCB000000),
                                            size: 20.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        if (_model.pageIndex == 3)
                          Align(
                            alignment: const AlignmentDirectional(1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 20.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  context.goNamed('Login');
                                },
                                text: FFLocalizations.of(context).getText(
                                  'kzywycrm' /*  Next  */,
                                ),
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 3.0,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 30.0,
                    decoration: const BoxDecoration(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
