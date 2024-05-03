import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/gemini/gemini.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'video_prompt_page_widget.dart' show VideoPromptPageWidget;
import 'package:flutter/material.dart';

class VideoPromptPageModel extends FlutterFlowModel<VideoPromptPageWidget> {
  ///  Local state fields for this page.

  bool isLoading = false;

  bool isImageGenerating = false;

  List<String> generationId = [];
  void addToGenerationId(String item) => generationId.add(item);
  void removeFromGenerationId(String item) => generationId.remove(item);
  void removeAtIndexFromGenerationId(int index) => generationId.removeAt(index);
  void insertAtIndexInGenerationId(int index, String item) =>
      generationId.insert(index, item);
  void updateGenerationIdAtIndex(int index, Function(String) updateFn) =>
      generationId[index] = updateFn(generationId[index]);

  List<String> imagePath = [];
  void addToImagePath(String item) => imagePath.add(item);
  void removeFromImagePath(String item) => imagePath.remove(item);
  void removeAtIndexFromImagePath(int index) => imagePath.removeAt(index);
  void insertAtIndexInImagePath(int index, String item) =>
      imagePath.insert(index, item);
  void updateImagePathAtIndex(int index, Function(String) updateFn) =>
      imagePath[index] = updateFn(imagePath[index]);

  List<String> videoPath = [];
  void addToVideoPath(String item) => videoPath.add(item);
  void removeFromVideoPath(String item) => videoPath.remove(item);
  void removeAtIndexFromVideoPath(int index) => videoPath.removeAt(index);
  void insertAtIndexInVideoPath(int index, String item) =>
      videoPath.insert(index, item);
  void updateVideoPathAtIndex(int index, Function(String) updateFn) =>
      videoPath[index] = updateFn(videoPath[index]);

  List<String> imgId = [];
  void addToImgId(String item) => imgId.add(item);
  void removeFromImgId(String item) => imgId.remove(item);
  void removeAtIndexFromImgId(int index) => imgId.removeAt(index);
  void insertAtIndexInImgId(int index, String item) =>
      imgId.insert(index, item);
  void updateImgIdAtIndex(int index, Function(String) updateFn) =>
      imgId[index] = updateFn(imgId[index]);

  List<String> vidId = [];
  void addToVidId(String item) => vidId.add(item);
  void removeFromVidId(String item) => vidId.remove(item);
  void removeAtIndexFromVidId(int index) => vidId.removeAt(index);
  void insertAtIndexInVidId(int index, String item) =>
      vidId.insert(index, item);
  void updateVidIdAtIndex(int index, Function(String) updateFn) =>
      vidId[index] = updateFn(vidId[index]);

  int hits = 0;

  dynamic jsonData;

  List<bool> imageMutex = [false, false, false, false, false];
  void addToImageMutex(bool item) => imageMutex.add(item);
  void removeFromImageMutex(bool item) => imageMutex.remove(item);
  void removeAtIndexFromImageMutex(int index) => imageMutex.removeAt(index);
  void insertAtIndexInImageMutex(int index, bool item) =>
      imageMutex.insert(index, item);
  void updateImageMutexAtIndex(int index, Function(bool) updateFn) =>
      imageMutex[index] = updateFn(imageMutex[index]);

  List<String> imageURLList = [];
  void addToImageURLList(String item) => imageURLList.add(item);
  void removeFromImageURLList(String item) => imageURLList.remove(item);
  void removeAtIndexFromImageURLList(int index) => imageURLList.removeAt(index);
  void insertAtIndexInImageURLList(int index, String item) =>
      imageURLList.insert(index, item);
  void updateImageURLListAtIndex(int index, Function(String) updateFn) =>
      imageURLList[index] = updateFn(imageURLList[index]);

  bool isHardCodedValue = false;

  int parallalApiCount = 5;

  bool isLiveAudio = true;

  String? audioFile;

  String? videoDescription = 'static default value';

  bool buttonActive = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Gemini - Generate Text] action in Button widget.
  String? imgGenPrompt;
  // Stores action output result for [Action Block - GenerateGenId] action in Button widget.
  String? genImage1;
  // Stores action output result for [Action Block - GenerateGenId] action in Button widget.
  String? genImage2;
  // Stores action output result for [Action Block - GenerateGenId] action in Button widget.
  String? genImage3;
  // Stores action output result for [Action Block - GenerateGenId] action in Button widget.
  String? genImage4;
  // Stores action output result for [Action Block - GenerateGenId] action in Button widget.
  String? genImage5;
  // Stores action output result for [Action Block - GenerateImageFromGenId] action in Button widget.
  dynamic imageJson1;
  // Stores action output result for [Action Block - GenerateImageFromGenId] action in Button widget.
  dynamic imageJson2;
  // Stores action output result for [Action Block - GenerateImageFromGenId] action in Button widget.
  dynamic imageJson3;
  // Stores action output result for [Action Block - GenerateImageFromGenId] action in Button widget.
  dynamic imageJson4;
  // Stores action output result for [Action Block - GenerateImageFromGenId] action in Button widget.
  dynamic imageJson5;
  // Stores action output result for [Custom Action - addVideos] action in Button widget.
  String? finalVideoLiveAudio;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  VideosRecord? videoDocLive;
  // Stores action output result for [Custom Action - addVideos] action in Button widget.
  String? finalVideo;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  VideosRecord? videoDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks.
  Future<String?> generateGenId(
    BuildContext context, {
    String? prompt,
  }) async {
    ApiCallResponse? genImage1;

    genImage1 = await LeonardoAPIsGroup.generateImageCall.call(
      width: 720.0,
      height: 1280.0,
      textPrompt: prompt,
    );
    if ((genImage1.succeeded ?? true)) {
      return LeonardoAPIsGroup.generateImageCall.genId(
        (genImage1.jsonBody ?? ''),
      );
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          (genImage1.jsonBody ?? '').toString(),
          style: TextStyle(
            color: FlutterFlowTheme.of(context).primaryText,
          ),
        ),
        duration: const Duration(milliseconds: 2000),
        backgroundColor: FlutterFlowTheme.of(context).secondary,
      ),
    );
    return null;
  }

  Future<dynamic> generateImageFromGenId(
    BuildContext context, {
    String? genId,
    int? index,
  }) async {
    ApiCallResponse? getImageResult;

    while (!imageMutex[index!]) {
      getImageResult = await LeonardoAPIsGroup.getImageCall.call(
        genId: genId,
      );
      if ((getImageResult.succeeded ?? true) &&
          (getJsonField(
                (getImageResult.jsonBody ?? ''),
                r'''$.generations_by_pk''',
              ) !=
              null) &&
          (LeonardoAPIsGroup.getImageCall.imageUrls(
                    (getImageResult.jsonBody ?? ''),
                  ) !=
                  null &&
              (LeonardoAPIsGroup.getImageCall.imageUrls(
                (getImageResult.jsonBody ?? ''),
              ))!
                  .isNotEmpty)) {
        updateImageMutexAtIndex(
          index,
          (_) => true,
        );
      } else {
        await Future.delayed(const Duration(milliseconds: 4000));
      }
    }
    return LeonardoAPIsGroup.getImageCall.firstJsonRes(
      (getImageResult?.jsonBody ?? ''),
    );
  }

  Future videoGeneratorAction(BuildContext context) async {
    ApiCallResponse? genMotion1Internal;
    ApiCallResponse? genMotion2Internal;
    ApiCallResponse? genMotion3Internal;
    ApiCallResponse? genMotion4Internal;
    ApiCallResponse? genMotion5Internal;
    dynamic motionJson1Internal;
    dynamic motionJson2Internal;
    dynamic motionJson3Internal;
    dynamic motionJson4Internal;
    dynamic motionJson5Internal;

    isImageGenerating = false;
    isLoading = true;
    jsonData = FFAppState().emptyJson;
    imageMutex = functions.resetMutex(parallalApiCount).toList().cast<bool>();
    await Future.wait([
      Future(() async {
        genMotion1Internal = await LeonardoAPIsGroup.generateMotionCall.call(
          imageId: (List<String> var1, int var2) {
            return var1[var2];
          }(imgId.toList(), 0),
        );
        if ((genMotion1Internal?.succeeded ?? true)) {
          jsonData = functions.newJsonValue(
              jsonData!,
              '0',
              LeonardoAPIsGroup.generateMotionCall.motionGenId(
                (genMotion1Internal?.jsonBody ?? ''),
              )!);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                (genMotion1Internal?.jsonBody ?? '').toString(),
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: const Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).secondary,
            ),
          );
        }
      }),
      Future(() async {
        genMotion2Internal = await LeonardoAPIsGroup.generateMotionCall.call(
          imageId: (List<String> var1, int var2) {
            return var1[var2];
          }(imgId.toList(), 1),
        );
        if ((genMotion2Internal?.succeeded ?? true)) {
          jsonData = functions.newJsonValue(
              jsonData!,
              '1',
              LeonardoAPIsGroup.generateMotionCall.motionGenId(
                (genMotion2Internal?.jsonBody ?? ''),
              )!);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                (genMotion2Internal?.jsonBody ?? '').toString(),
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: const Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).secondary,
            ),
          );
        }
      }),
      Future(() async {
        genMotion3Internal = await LeonardoAPIsGroup.generateMotionCall.call(
          imageId: (List<String> var1, int var2) {
            return var1[var2];
          }(imgId.toList(), 2),
        );
        if ((genMotion3Internal?.succeeded ?? true)) {
          jsonData = functions.newJsonValue(
              jsonData!,
              '2',
              LeonardoAPIsGroup.generateMotionCall.motionGenId(
                (genMotion3Internal?.jsonBody ?? ''),
              )!);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                (genMotion3Internal?.jsonBody ?? '').toString(),
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: const Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).secondary,
            ),
          );
        }
      }),
      Future(() async {
        genMotion4Internal = await LeonardoAPIsGroup.generateMotionCall.call(
          imageId: (List<String> var1, int var2) {
            return var1[var2];
          }(imgId.toList(), 3),
        );
        if ((genMotion4Internal?.succeeded ?? true)) {
          jsonData = functions.newJsonValue(
              jsonData!,
              '3',
              LeonardoAPIsGroup.generateMotionCall.motionGenId(
                (genMotion4Internal?.jsonBody ?? ''),
              )!);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                (genMotion4Internal?.jsonBody ?? '').toString(),
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: const Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).secondary,
            ),
          );
        }
      }),
      Future(() async {
        genMotion5Internal = await LeonardoAPIsGroup.generateMotionCall.call(
          imageId: (List<String> var1, int var2) {
            return var1[var2];
          }(imgId.toList(), 4),
        );
        if ((genMotion5Internal?.succeeded ?? true)) {
          jsonData = functions.newJsonValue(
              jsonData!,
              '4',
              LeonardoAPIsGroup.generateMotionCall.motionGenId(
                (genMotion5Internal?.jsonBody ?? ''),
              )!);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                (genMotion5Internal?.jsonBody ?? '').toString(),
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: const Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).secondary,
            ),
          );
        }
      }),
    ]);
    hits = 0;
    await Future.wait([
      Future(() async {
        motionJson1Internal = await generateImageFromGenId(
          context,
          genId: functions.getJsonValue(jsonData!, '0'),
          index: 0,
        );
        if (motionJson1Internal == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Image 1 URL Images',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: const Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).secondary,
            ),
          );
          return;
        } else {
          addToVideoPath(getJsonField(
            motionJson1Internal,
            r'''$.motionMP4URL''',
          ).toString());
          hits = hits + 1;
        }
      }),
      Future(() async {
        motionJson2Internal = await generateImageFromGenId(
          context,
          genId: functions.getJsonValue(jsonData!, '1'),
          index: 1,
        );
        if (motionJson2Internal == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Image 2 URL Images',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: const Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).secondary,
            ),
          );
          return;
        } else {
          addToVideoPath(getJsonField(
            motionJson2Internal,
            r'''$.motionMP4URL''',
          ).toString());
          hits = hits + 1;
        }
      }),
      Future(() async {
        motionJson3Internal = await generateImageFromGenId(
          context,
          genId: functions.getJsonValue(jsonData!, '2'),
          index: 2,
        );
        if (motionJson3Internal == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Image 3 URL Images',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: const Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).secondary,
            ),
          );
          return;
        } else {
          addToVideoPath(getJsonField(
            motionJson3Internal,
            r'''$.motionMP4URL''',
          ).toString());
          hits = hits + 1;
        }
      }),
      Future(() async {
        motionJson4Internal = await generateImageFromGenId(
          context,
          genId: functions.getJsonValue(jsonData!, '3'),
          index: 3,
        );
        if (motionJson4Internal == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Image 4 URL Images',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: const Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).secondary,
            ),
          );
          return;
        } else {
          addToVideoPath(getJsonField(
            motionJson4Internal,
            r'''$.motionMP4URL''',
          ).toString());
          hits = hits + 1;
        }
      }),
      Future(() async {
        motionJson5Internal = await generateImageFromGenId(
          context,
          genId: functions.getJsonValue(jsonData!, '4'),
          index: 4,
        );
        if (motionJson5Internal == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Image 5 URL Images',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: const Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).secondary,
            ),
          );
          return;
        } else {
          addToVideoPath(getJsonField(
            motionJson5Internal,
            r'''$.motionMP4URL''',
          ).toString());
          hits = hits + 1;
        }
      }),
    ]);
    if (hits == parallalApiCount) {
      addToImageURLList('END');
      return;
    } else {
      return;
    }
  }

  Future audioGenerationAction(BuildContext context) async {
    String? videoDescriptionText;
    ApiCallResponse? ttsOutput;

    await geminiGenerateText(
      context,
      'give me answer for the question \"${textController.text}\", under 300 character',
    ).then((generatedText) {
      videoDescriptionText = generatedText;
    });

    videoDescription = videoDescriptionText;
    ttsOutput = await BuildshipAPIsGroup.textToAudioCall.call(
      text: functions.getNewText(videoDescriptionText!),
    );
    if ((ttsOutput.succeeded ?? true)) {
      audioFile = BuildshipAPIsGroup.textToAudioCall.audioPath(
        (ttsOutput.jsonBody ?? ''),
      );
      return;
    } else {
      return;
    }
  }
}
