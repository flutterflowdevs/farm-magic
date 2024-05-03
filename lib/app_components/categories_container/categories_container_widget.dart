import '/delete/heading_container/heading_container_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'categories_container_model.dart';
export 'categories_container_model.dart';

class CategoriesContainerWidget extends StatefulWidget {
  const CategoriesContainerWidget({super.key});

  @override
  State<CategoriesContainerWidget> createState() =>
      _CategoriesContainerWidgetState();
}

class _CategoriesContainerWidgetState extends State<CategoriesContainerWidget> {
  late CategoriesContainerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoriesContainerModel());
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
              child: const HeadingContainerWidget(
                heading: 'Categories',
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
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/sideCheck.png',
                                      width: 40.0,
                                      height: 35.0,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                Transform.rotate(
                                  angle: 270.0 * (math.pi / 180),
                                  origin: const Offset(-3.0, 3.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Container(
                                      width: 50.0,
                                      decoration: const BoxDecoration(),
                                      alignment: const AlignmentDirectional(0.0, 1.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '0dfwxmrk' /* Crop Practice */,
                                        ),
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: _model.selectedCat == 0
                                                  ? const Color(0xFF87965A)
                                                  : FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: _model.selectedCat == 0
                                                  ? 12.0
                                                  : 10.0,
                                              letterSpacing: 0.0,
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
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/sideCheck.png',
                                      width: 40.0,
                                      height: 35.0,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                Transform.rotate(
                                  angle: 270.0 * (math.pi / 180),
                                  child: Container(
                                    width: 60.0,
                                    decoration: const BoxDecoration(),
                                    alignment: const AlignmentDirectional(0.0, 1.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'gut4px3q' /* Machinary */,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: _model.selectedCat == 1
                                                ? const Color(0xFF87965A)
                                                : FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            fontSize: _model.selectedCat == 1
                                                ? 12.0
                                                : 10.0,
                                            letterSpacing: 0.0,
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
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/sideCheck.png',
                                      width: 40.0,
                                      height: 40.0,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                Transform.rotate(
                                  angle: 270.0 * (math.pi / 180),
                                  child: Container(
                                    width: 60.0,
                                    decoration: const BoxDecoration(),
                                    alignment: const AlignmentDirectional(0.0, 1.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'ilspg6wd' /* Machinary */,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: _model.selectedCat == 2
                                                ? const Color(0xFF87965A)
                                                : FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            fontSize: _model.selectedCat == 2
                                                ? 12.0
                                                : 10.0,
                                            letterSpacing: 0.0,
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
                            context.pushNamed('DiseaseDetection');
                          },
                          child: Material(
                            color: Colors.transparent,
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Container(
                              width: 200.0,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Material(
                                      color: Colors.transparent,
                                      elevation: 4.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Container(
                                        height: 130.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          child: Image.network(
                                            'https://picsum.photos/seed/742/600',
                                            width: 300.0,
                                            height: 200.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'lfubb9ab' /* CROP PRACTICE */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: const Color(0xFF87965A),
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 2.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '3325x5jo' /* It is a long established fact ... */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: const Color(0xFF8F8E8B),
                                                    fontSize: 10.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: Icon(
                                              Icons.favorite_border,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: Icon(
                                              Icons.send_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
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
