import '/components/heading_container_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'categories_container1_model.dart';
export 'categories_container1_model.dart';

class CategoriesContainer1Widget extends StatefulWidget {
  const CategoriesContainer1Widget({super.key});

  @override
  State<CategoriesContainer1Widget> createState() =>
      _CategoriesContainer1WidgetState();
}

class _CategoriesContainer1WidgetState
    extends State<CategoriesContainer1Widget> {
  late CategoriesContainer1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoriesContainer1Model());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            wrapWithModel(
              model: _model.headingContainerModel,
              updateCallback: () => setState(() {}),
              child: HeadingContainerWidget(
                heading: FFLocalizations.of(context).getText(
                  'aj26bz4k' /* Services */,
                ),
                shownSeeAll: true,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
              child: Container(
                width: double.infinity,
                height: 210.0,
                decoration: const BoxDecoration(
                  color: Color(0x00FFFFFF),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            setState(() {
                              _model.selectedCat = 0;
                            });
                          },
                          child: Container(
                            width: 100.0,
                            height: 50.0,
                            decoration: const BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (_model.selectedCat == 0)
                                  Image.asset(
                                    'assets/images/sideCheck-removebg-preview.png',
                                    width: 42.0,
                                    height: 40.0,
                                    fit: BoxFit.fill,
                                  ),
                                Expanded(
                                  child: Align(
                                    alignment: const AlignmentDirectional(1.0, 0.0),
                                    child: Transform.rotate(
                                      angle: 270.0 * (math.pi / 180),
                                      origin: const Offset(-3.0, 3.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: Container(
                                          width: 50.0,
                                          decoration: const BoxDecoration(),
                                          alignment:
                                              const AlignmentDirectional(0.0, 1.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'w8vkn1kp' /* Identify Disease */,
                                            ),
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: _model.selectedCat == 0
                                                      ? const Color(0xFF87965A)
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  fontSize:
                                                      _model.selectedCat == 0
                                                          ? 12.0
                                                          : 10.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            setState(() {
                              _model.selectedCat = 1;
                            });
                          },
                          child: Container(
                            width: 100.0,
                            height: 50.0,
                            decoration: const BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (_model.selectedCat == 1)
                                  Image.asset(
                                    'assets/images/sideCheck-removebg-preview.png',
                                    width: 42.0,
                                    height: 40.0,
                                    fit: BoxFit.fill,
                                  ),
                                Expanded(
                                  child: Align(
                                    alignment: const AlignmentDirectional(1.0, 0.0),
                                    child: Transform.rotate(
                                      angle: 270.0 * (math.pi / 180),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 6.0),
                                        child: Container(
                                          width: 60.0,
                                          decoration: const BoxDecoration(),
                                          alignment:
                                              const AlignmentDirectional(0.0, 1.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'l8imtss0' /* Farming Tutorial  */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: _model.selectedCat == 1
                                                      ? const Color(0xFF87965A)
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  fontSize:
                                                      _model.selectedCat == 1
                                                          ? 12.0
                                                          : 10.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            setState(() {
                              _model.selectedCat = 2;
                            });
                          },
                          child: Container(
                            width: 100.0,
                            height: 50.0,
                            decoration: const BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (_model.selectedCat == 2)
                                  Image.asset(
                                    'assets/images/sideCheck-removebg-preview.png',
                                    width: 42.0,
                                    height: 40.0,
                                    fit: BoxFit.fill,
                                  ),
                                Expanded(
                                  child: Align(
                                    alignment: const AlignmentDirectional(1.0, 0.0),
                                    child: Transform.rotate(
                                      angle: 270.0 * (math.pi / 180),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 6.0),
                                        child: Container(
                                          width: 60.0,
                                          decoration: const BoxDecoration(),
                                          alignment:
                                              const AlignmentDirectional(0.0, 1.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '7nc4qll9' /* Virtual Assistant */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: _model.selectedCat == 2
                                                      ? const Color(0xFF87965A)
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  fontSize:
                                                      _model.selectedCat == 2
                                                          ? 12.0
                                                          : 10.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (_model.selectedCat == 0) {
                              context.pushNamed('DiseaseDetection');

                              return;
                            } else if (_model.selectedCat == 1) {
                              context.pushNamed('VideoPromptPage');

                              return;
                            } else {
                              context.pushNamed('ChatPage');

                              return;
                            }
                          },
                          child: Material(
                            color: Colors.transparent,
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Container(
                              width: 150.0,
                              height: 250.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 5.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          () {
                                            if (_model.selectedCat == 0) {
                                              return 'Identify Disease';
                                            } else if (_model.selectedCat ==
                                                1) {
                                              return 'Farming Tutorial';
                                            } else {
                                              return 'Virtual Assistant';
                                            }
                                          }(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        if (_model.selectedCat == 1)
                                          Lottie.asset(
                                            'assets/lottie_animations/Animation_-_1714285464259.json',
                                            width: 187.0,
                                            height: 178.0,
                                            fit: BoxFit.cover,
                                            animate: true,
                                          ),
                                        if (_model.selectedCat == 0)
                                          Lottie.asset(
                                            'assets/lottie_animations/flRXlh2Vaa.json',
                                            width: 250.0,
                                            height: 180.0,
                                            fit: BoxFit.contain,
                                            animate: true,
                                          ),
                                        if (_model.selectedCat == 2)
                                          Lottie.asset(
                                            'assets/lottie_animations/7LdAnUmeqI.json',
                                            width: 204.0,
                                            height: 178.0,
                                            fit: BoxFit.cover,
                                            repeat: false,
                                            animate: true,
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
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
    );
  }
}
