import '/app_components/categories_container/categories_container_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/delete/categories_container1/categories_container1_widget.dart';
import '/delete/search_text_field/search_text_field_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page_copy_model.dart';
export 'home_page_copy_model.dart';

class HomePageCopyWidget extends StatefulWidget {
  const HomePageCopyWidget({super.key});

  @override
  State<HomePageCopyWidget> createState() => _HomePageCopyWidgetState();
}

class _HomePageCopyWidgetState extends State<HomePageCopyWidget>
    with TickerProviderStateMixin {
  late HomePageCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageCopyModel());

    animationsMap.addAll({
      'containerOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 68.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 600.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 128.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).appBG2,
          floatingActionButton: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 14.0, 14.0),
            child: FloatingActionButton(
              onPressed: () async {
                if (_model.isAnimationOn == false) {
                  await Future.wait([
                    Future(() async {
                      if (animationsMap['containerOnActionTriggerAnimation1'] !=
                          null) {
                        await animationsMap[
                                'containerOnActionTriggerAnimation1']!
                            .controller
                            .forward(from: 0.0);
                      }
                    }),
                    Future(() async {
                      if (animationsMap['containerOnActionTriggerAnimation2'] !=
                          null) {
                        await animationsMap[
                                'containerOnActionTriggerAnimation2']!
                            .controller
                            .forward(from: 0.0);
                      }
                    }),
                  ]);
                  setState(() {
                    _model.isAnimationOn = true;
                  });
                } else {
                  await Future.wait([
                    Future(() async {
                      if (animationsMap['containerOnActionTriggerAnimation2'] !=
                          null) {
                        animationsMap['containerOnActionTriggerAnimation2']!
                            .controller
                            .stop();
                      }
                    }),
                    Future(() async {
                      if (animationsMap['containerOnActionTriggerAnimation2'] !=
                          null) {
                        animationsMap['containerOnActionTriggerAnimation2']!
                            .controller
                            .stop();
                      }
                    }),
                  ]);
                  setState(() {
                    _model.isAnimationOn = false;
                  });
                }
              },
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              elevation: 8.0,
              child: Icon(
                Icons.add,
                color: FlutterFlowTheme.of(context).info,
                size: 24.0,
              ),
            ),
          ),
          body: SafeArea(
            top: true,
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).appBG2,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 70.0, 0.0, 0.0),
                                child: RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '465kh3x8' /* Hi,  */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 28.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                      TextSpan(
                                        text: currentUserDisplayName,
                                        style: GoogleFonts.getFont(
                                          'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 28.0,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'oxujtuvg' /* ! */,
                                        ),
                                        style: GoogleFonts.getFont(
                                          'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 28.0,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'pfw2shqe' /* 
Explore Help */
                                          ,
                                        ),
                                        style: GoogleFonts.getFont(
                                          'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 36.0,
                                        ),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                              if (false)
                                wrapWithModel(
                                  model: _model.searchTextFieldModel,
                                  updateCallback: () => setState(() {}),
                                  child: const SearchTextFieldWidget(),
                                ),
                              if (false &&
                                  responsiveVisibility(
                                    context: context,
                                    phone: false,
                                    tablet: false,
                                  ))
                                wrapWithModel(
                                  model: _model.categoriesContainerModel,
                                  updateCallback: () => setState(() {}),
                                  child: const CategoriesContainerWidget(),
                                ),
                              wrapWithModel(
                                model: _model.categoriesContainer1Model,
                                updateCallback: () => setState(() {}),
                                child: const CategoriesContainer1Widget(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ].divide(const SizedBox(height: 10.0)),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.83, 0.79),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.goNamed(
                        'DiseasesDetectCopy',
                        queryParameters: {
                          'isCamera': serializeParam(
                            false,
                            ParamType.bool,
                          ),
                        }.withoutNulls,
                      );
                    },
                    child: Material(
                      color: Colors.transparent,
                      elevation: 8.0,
                      shape: const CircleBorder(),
                      child: Container(
                        width: 54.0,
                        height: 54.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          shape: BoxShape.circle,
                        ),
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Icon(
                          Icons.abc,
                          color: FlutterFlowTheme.of(context).info,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ).animateOnActionTrigger(
                    animationsMap['containerOnActionTriggerAnimation1']!,
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.84, 0.65),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.goNamed(
                        'DiseasesDetectCopy',
                        queryParameters: {
                          'isCamera': serializeParam(
                            true,
                            ParamType.bool,
                          ),
                        }.withoutNulls,
                      );
                    },
                    child: Material(
                      color: Colors.transparent,
                      elevation: 8.0,
                      shape: const CircleBorder(),
                      child: Container(
                        width: 54.0,
                        height: 54.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          shape: BoxShape.circle,
                        ),
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: FlutterFlowTheme.of(context).info,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ).animateOnActionTrigger(
                    animationsMap['containerOnActionTriggerAnimation2']!,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
