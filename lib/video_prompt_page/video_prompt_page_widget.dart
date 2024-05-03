import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/gemini/gemini.dart';
import '/components/prompt_to_video_loader_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'video_prompt_page_model.dart';
export 'video_prompt_page_model.dart';

class VideoPromptPageWidget extends StatefulWidget {
  const VideoPromptPageWidget({super.key});

  @override
  State<VideoPromptPageWidget> createState() => _VideoPromptPageWidgetState();
}

class _VideoPromptPageWidgetState extends State<VideoPromptPageWidget> {
  late VideoPromptPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoPromptPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.imagePath = [];
        _model.imgId = [];
        _model.isHardCodedValue = false;
      });
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'apzt2bqo' /* Video Prompt Page */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            setState(() {
                              _model.textController?.text =
                                  'I want to grow wheat in my 2-acre land. Can you suggest me some good tips. We are going to get good monsoon this year. ';
                            });
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xFFB1B1B1),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 6.0, 0.0, 6.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '5p1hxm0o' /* I want to grow wheat in my 2-a... */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                              ),
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
                              _model.textController?.text =
                                  'Natural ways to protect my field from insects.';
                            });
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xFFB1B1B1),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 6.0, 0.0, 6.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'ttkyenwa' /* Natural ways to protect my fie... */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                              ),
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
                              _model.textController?.text =
                                  'How to use cow dung in my organic farming';
                            });
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xFFB1B1B1),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 6.0, 0.0, 6.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'zqonng1d' /* How to use cow dung in my orga... */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ].divide(const SizedBox(height: 8.0)),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        TextFormField(
                          controller: _model.textController,
                          focusNode: _model.textFieldFocusNode,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                            hintText: FFLocalizations.of(context).getText(
                              'rqf0rdcw' /* Write down your question... */,
                            ),
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).secondary,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                          textAlign: TextAlign.start,
                          maxLines: 4,
                          minLines: 4,
                          validator: _model.textControllerValidator
                              .asValidator(context),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 4,
                              child: FFButtonWidget(
                                onPressed: () async {
                                  var shouldSetState = false;
                                  if (functions.isTextFieldEmpty(
                                      _model.textController.text)) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Please enter some prompt',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: const Duration(milliseconds: 3000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                  } else {
                                    setState(() {
                                      _model.imagePath = [];
                                      _model.videoPath = [];
                                      _model.generationId = [];
                                      _model.isImageGenerating = true;
                                      _model.isLoading = true;
                                      _model.jsonData = FFAppState().emptyJson;
                                      _model.hits = 0;
                                    });
                                    showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      isDismissible: false,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () => _model
                                                  .unfocusNode.canRequestFocus
                                              ? FocusScope.of(context)
                                                  .requestFocus(
                                                      _model.unfocusNode)
                                              : FocusScope.of(context)
                                                  .unfocus(),
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: SizedBox(
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  1.0,
                                              child: PromptToVideoLoaderWidget(
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                        .height,
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                        .width,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));

                                    await geminiGenerateText(
                                      context,
                                      'Action to Do:   ${_model.textController.text}. write me ${_model.parallalApiCount.toString()} Image Generation Prompts in a single line separated with \"|\" to Help Complete the Action in order:',
                                    ).then((generatedText) {
                                      safeSetState(() =>
                                          _model.imgGenPrompt = generatedText);
                                    });

                                    shouldSetState = true;
                                    await Future.wait([
                                      Future(() async {
                                        _model.genImage1 =
                                            await _model.generateGenId(
                                          context,
                                          prompt: valueOrDefault<String>(
                                            functions.getPrompt(
                                                _model.imgGenPrompt!, 0),
                                            'NA',
                                          ),
                                        );
                                        shouldSetState = true;
                                        if (!(_model.genImage1 == null ||
                                            _model.genImage1 == '')) {
                                          setState(() {
                                            _model.jsonData =
                                                functions.newJsonValue(
                                                    _model.jsonData!,
                                                    '0',
                                                    _model.genImage1!);
                                          });
                                        }
                                        _model.hits = _model.hits + 1;
                                      }),
                                      Future(() async {
                                        _model.genImage2 =
                                            await _model.generateGenId(
                                          context,
                                          prompt: functions.getPrompt(
                                              _model.imgGenPrompt!, 1),
                                        );
                                        shouldSetState = true;
                                        if (!(_model.genImage2 == null ||
                                            _model.genImage2 == '')) {
                                          setState(() {
                                            _model.jsonData =
                                                functions.newJsonValue(
                                                    _model.jsonData!,
                                                    '1',
                                                    _model.genImage2!);
                                          });
                                        }
                                        _model.hits = _model.hits + 1;
                                      }),
                                      Future(() async {
                                        _model.genImage3 =
                                            await _model.generateGenId(
                                          context,
                                          prompt: functions.getPrompt(
                                              _model.imgGenPrompt!, 2),
                                        );
                                        shouldSetState = true;
                                        if (!(_model.genImage3 == null ||
                                            _model.genImage3 == '')) {
                                          setState(() {
                                            _model.jsonData =
                                                functions.newJsonValue(
                                                    _model.jsonData!,
                                                    '2',
                                                    _model.genImage3!);
                                          });
                                        }
                                        _model.hits = _model.hits + 1;
                                      }),
                                      Future(() async {
                                        _model.genImage4 =
                                            await _model.generateGenId(
                                          context,
                                          prompt: functions.getPrompt(
                                              _model.imgGenPrompt!, 3),
                                        );
                                        shouldSetState = true;
                                        if (!(_model.genImage4 == null ||
                                            _model.genImage4 == '')) {
                                          setState(() {
                                            _model.jsonData =
                                                functions.newJsonValue(
                                                    _model.jsonData!,
                                                    '3',
                                                    _model.genImage4!);
                                          });
                                        }
                                        _model.hits = _model.hits + 1;
                                      }),
                                      Future(() async {
                                        _model.genImage5 =
                                            await _model.generateGenId(
                                          context,
                                          prompt: functions.getPrompt(
                                              _model.imgGenPrompt!, 4),
                                        );
                                        shouldSetState = true;
                                        if (!(_model.genImage5 == null ||
                                            _model.genImage5 == '')) {
                                          setState(() {
                                            _model.jsonData =
                                                functions.newJsonValue(
                                                    _model.jsonData!,
                                                    '4',
                                                    _model.genImage5!);
                                          });
                                        }
                                        _model.hits = _model.hits + 1;
                                      }),
                                    ]);
                                    if (_model.hits ==
                                        _model.parallalApiCount) {
                                      setState(() {
                                        _model.hits = 0;
                                      });
                                      await Future.wait([
                                        Future(() async {
                                          _model.imageJson1 = await _model
                                              .generateImageFromGenId(
                                            context,
                                            genId: functions.getJsonValue(
                                                _model.jsonData!, '0'),
                                            index: 0,
                                          );
                                          shouldSetState = true;
                                          if (_model.imageJson1 == null) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  _model.imageJson1!.toString(),
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: const Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            );
                                            if (shouldSetState) {
                                              setState(() {});
                                            }
                                            return;
                                          } else {
                                            setState(() {
                                              _model
                                                  .addToImagePath(getJsonField(
                                                _model.imageJson1,
                                                r'''$.url''',
                                              ).toString());
                                              _model.addToImgId(getJsonField(
                                                _model.imageJson1,
                                                r'''$.id''',
                                              ).toString());
                                            });
                                            setState(() {
                                              _model.hits = _model.hits + 1;
                                            });
                                          }
                                        }),
                                        Future(() async {
                                          _model.imageJson2 = await _model
                                              .generateImageFromGenId(
                                            context,
                                            genId: functions.getJsonValue(
                                                _model.jsonData!, '1'),
                                            index: 1,
                                          );
                                          shouldSetState = true;
                                          if (_model.imageJson2 == null) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  _model.imageJson2!.toString(),
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: const Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            );
                                            if (shouldSetState) {
                                              setState(() {});
                                            }
                                            return;
                                          } else {
                                            setState(() {
                                              _model
                                                  .addToImagePath(getJsonField(
                                                _model.imageJson2,
                                                r'''$.url''',
                                              ).toString());
                                              _model.addToImgId(getJsonField(
                                                _model.imageJson2,
                                                r'''$.id''',
                                              ).toString());
                                            });
                                            setState(() {
                                              _model.hits = _model.hits + 1;
                                            });
                                          }
                                        }),
                                        Future(() async {
                                          await _model
                                              .audioGenerationAction(context);
                                          setState(() {});
                                          setState(() {
                                            _model.hits = _model.hits + 1;
                                          });
                                        }),
                                        Future(() async {
                                          _model.imageJson3 = await _model
                                              .generateImageFromGenId(
                                            context,
                                            genId: functions.getJsonValue(
                                                _model.jsonData!, '2'),
                                            index: 2,
                                          );
                                          shouldSetState = true;
                                          if (_model.imageJson3 == null) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  _model.imageJson3!.toString(),
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: const Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            );
                                            if (shouldSetState) {
                                              setState(() {});
                                            }
                                            return;
                                          } else {
                                            setState(() {
                                              _model
                                                  .addToImagePath(getJsonField(
                                                _model.imageJson3,
                                                r'''$.url''',
                                              ).toString());
                                              _model.addToImgId(getJsonField(
                                                _model.imageJson3,
                                                r'''$.id''',
                                              ).toString());
                                            });
                                            setState(() {
                                              _model.hits = _model.hits + 1;
                                            });
                                          }
                                        }),
                                        Future(() async {
                                          _model.imageJson4 = await _model
                                              .generateImageFromGenId(
                                            context,
                                            genId: functions.getJsonValue(
                                                _model.jsonData!, '3'),
                                            index: 3,
                                          );
                                          shouldSetState = true;
                                          if (_model.imageJson4 == null) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  _model.imageJson4!.toString(),
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: const Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            );
                                            if (shouldSetState) {
                                              setState(() {});
                                            }
                                            return;
                                          } else {
                                            setState(() {
                                              _model
                                                  .addToImagePath(getJsonField(
                                                _model.imageJson4,
                                                r'''$.url''',
                                              ).toString());
                                              _model.addToImgId(getJsonField(
                                                _model.imageJson4,
                                                r'''$.id''',
                                              ).toString());
                                            });
                                            setState(() {
                                              _model.hits = _model.hits + 1;
                                            });
                                          }
                                        }),
                                        Future(() async {
                                          _model.imageJson5 = await _model
                                              .generateImageFromGenId(
                                            context,
                                            genId: functions.getJsonValue(
                                                _model.jsonData!, '4'),
                                            index: 4,
                                          );
                                          shouldSetState = true;
                                          if (_model.imageJson5!) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  _model.imageJson5!.toString(),
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: const Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            );
                                            if (shouldSetState) {
                                              setState(() {});
                                            }
                                            return;
                                          } else {
                                            setState(() {
                                              _model
                                                  .addToImagePath(getJsonField(
                                                _model.imageJson5,
                                                r'''$.url''',
                                              ).toString());
                                              _model.addToImgId(getJsonField(
                                                _model.imageJson5,
                                                r'''$.id''',
                                              ).toString());
                                            });
                                            setState(() {
                                              _model.hits = _model.hits + 1;
                                            });
                                          }
                                        }),
                                      ]);
                                      if (_model.hits ==
                                          (_model.parallalApiCount + 1)) {
                                        setState(() {
                                          _model.addToImageURLList('END');
                                        });
                                        await _model
                                            .videoGeneratorAction(context);
                                        setState(() {});
                                        if (_model.isLiveAudio) {
                                          _model.finalVideoLiveAudio =
                                              await actions.addVideos(
                                            _model.videoPath.toList(),
                                            _model.audioFile,
                                          );
                                          shouldSetState = true;
                                          setState(() {
                                            _model.isImageGenerating = false;
                                            _model.isLoading = false;
                                          });

                                          var videosRecordReference1 =
                                              VideosRecord.collection.doc();
                                          await videosRecordReference1
                                              .set(createVideosRecordData(
                                            userRef: currentUserReference,
                                            prompt: _model.textController.text,
                                            videoUrl:
                                                _model.finalVideoLiveAudio,
                                            videoDescription:
                                                _model.videoDescription,
                                            timeStamp: getCurrentTimestamp,
                                            isPublic: false,
                                          ));
                                          _model.videoDocLive =
                                              VideosRecord.getDocumentFromData(
                                                  createVideosRecordData(
                                                    userRef:
                                                        currentUserReference,
                                                    prompt: _model
                                                        .textController.text,
                                                    videoUrl: _model
                                                        .finalVideoLiveAudio,
                                                    videoDescription:
                                                        _model.videoDescription,
                                                    timeStamp:
                                                        getCurrentTimestamp,
                                                    isPublic: false,
                                                  ),
                                                  videosRecordReference1);
                                          shouldSetState = true;
                                          setState(() {
                                            _model.textController?.clear();
                                          });
                                          Navigator.pop(context);

                                          context.pushNamed(
                                            'GeneratedVideoPage',
                                            queryParameters: {
                                              'videoDoc': serializeParam(
                                                _model.videoDocLive,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'videoDoc': _model.videoDocLive,
                                            },
                                          );

                                          if (shouldSetState) setState(() {});
                                          return;
                                        } else {
                                          _model.finalVideo =
                                              await actions.addVideos(
                                            _model.videoPath.toList(),
                                            null,
                                          );
                                          shouldSetState = true;
                                          setState(() {
                                            _model.isImageGenerating = false;
                                            _model.isLoading = false;
                                          });

                                          var videosRecordReference2 =
                                              VideosRecord.collection.doc();
                                          await videosRecordReference2
                                              .set(createVideosRecordData(
                                            userRef: currentUserReference,
                                            prompt: _model.textController.text,
                                            videoUrl: _model.finalVideo,
                                            videoDescription:
                                                _model.videoDescription,
                                            timeStamp: getCurrentTimestamp,
                                            isPublic: false,
                                          ));
                                          _model.videoDoc =
                                              VideosRecord.getDocumentFromData(
                                                  createVideosRecordData(
                                                    userRef:
                                                        currentUserReference,
                                                    prompt: _model
                                                        .textController.text,
                                                    videoUrl: _model.finalVideo,
                                                    videoDescription:
                                                        _model.videoDescription,
                                                    timeStamp:
                                                        getCurrentTimestamp,
                                                    isPublic: false,
                                                  ),
                                                  videosRecordReference2);
                                          shouldSetState = true;
                                          setState(() {
                                            _model.textController?.clear();
                                          });
                                          Navigator.pop(context);

                                          context.pushNamed(
                                            'GeneratedVideoPage',
                                            queryParameters: {
                                              'videoDoc': serializeParam(
                                                _model.videoDoc,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'videoDoc': _model.videoDoc,
                                            },
                                          );

                                          if (shouldSetState) setState(() {});
                                          return;
                                        }
                                      } else {
                                        if (shouldSetState) setState(() {});
                                        return;
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Hit count:- ${_model.hits.toString()}',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              const Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      );
                                      if (shouldSetState) setState(() {});
                                      return;
                                    }
                                  }

                                  if (shouldSetState) setState(() {});
                                },
                                text: FFLocalizations.of(context).getText(
                                  'm016gkdc' /* Go */,
                                ),
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 45.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w300,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ].divide(const SizedBox(width: 6.0)),
                        ),
                      ]
                          .divide(const SizedBox(height: 8.0))
                          .addToEnd(const SizedBox(height: 18.0)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
