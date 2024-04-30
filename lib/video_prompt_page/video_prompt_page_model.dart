import '/backend/api_requests/api_calls.dart';
import '/components/prompt_to_video_loader_widget.dart';
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

  int parallalApiCount = 2;

  bool isLiveAudio = false;

  String? audioFile;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Action Block - GenerateImageFromGenId] action in Button widget.
  dynamic dimageJson1;
  // Stores action output result for [Action Block - GenerateImageFromGenId] action in Button widget.
  dynamic dimageJson2;
  // Stores action output result for [Custom Action - addVideos] action in Button widget.
  String? finalStaticVideoLiveAudio;
  // Stores action output result for [Custom Action - addVideos] action in Button widget.
  String? finalStaticVideo;
  // Stores action output result for [Gemini - Generate Text] action in Button widget.
  String? imgGenPrompt;
  // Stores action output result for [Action Block - GenerateGenId] action in Button widget.
  String? genImage1;
  // Stores action output result for [Action Block - GenerateGenId] action in Button widget.
  String? genImage2;
  // Stores action output result for [Action Block - GenerateImageFromGenId] action in Button widget.
  dynamic imageJson1;
  // Stores action output result for [Action Block - GenerateImageFromGenId] action in Button widget.
  dynamic imageJson2;
  // Stores action output result for [Custom Action - addVideos] action in Button widget.
  String? finalVideoLiveAudio;
  // Stores action output result for [Custom Action - addVideos] action in Button widget.
  String? finalVideo;
  // Model for PromptToVideoLoader component.
  late PromptToVideoLoaderModel promptToVideoLoaderModel;

  @override
  void initState(BuildContext context) {
    promptToVideoLoaderModel =
        createModel(context, () => PromptToVideoLoaderModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    promptToVideoLoaderModel.dispose();
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

    await showDialog(
      context: context,
      builder: (alertDialogContext) {
        return AlertDialog(
          title: const Text('Value'),
          content: Text(genId!),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(alertDialogContext),
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
    while (!imageMutex[index!]) {
      getImageResult = await LeonardoAPIsGroup.getImageCall.call(
        genId: genId,
      );
      if ((getImageResult.succeeded ?? true) &&
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
    dynamic dmotionJson1;
    dynamic dmotionJson2;
    ApiCallResponse? genMotion1Internal;
    ApiCallResponse? genMotion2Internal;
    dynamic motionJson1Internal;
    dynamic motionJson2Internal;

    isImageGenerating = false;
    isLoading = true;
    jsonData = FFAppState().emptyJson;
    imageMutex = functions.resetMutex(parallalApiCount).toList().cast<bool>();
    if (isHardCodedValue) {
      jsonData = functions.newJsonValue(
          jsonData!, '0', '465a92d2-3a88-4a2c-b38d-7a57ad044abf');
      jsonData = functions.newJsonValue(
          jsonData!, '1', 'e8585135-d9c3-436e-bee6-299d6d74c0a2');
      hits = 0;
      await Future.wait([
        Future(() async {
          dmotionJson1 = await generateImageFromGenId(
            context,
            genId: functions.getJsonValue(jsonData!, '0'),
            index: 0,
          );
          if (dmotionJson1 == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  dmotionJson1!.toString(),
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
                duration: const Duration(milliseconds: 2000),
                backgroundColor: FlutterFlowTheme.of(context).secondary,
              ),
            );
            return;
          } else {
            addToVideoPath(getJsonField(
              dmotionJson1,
              r'''$.motionMP4URL''',
            ).toString());
            hits = hits + 1;
          }
        }),
        Future(() async {
          dmotionJson2 = await generateImageFromGenId(
            context,
            genId: functions.getJsonValue(jsonData!, '1'),
            index: 1,
          );
          if (dmotionJson2 == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  dmotionJson2!.toString(),
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
              dmotionJson2,
              r'''$.motionMP4URL''',
            ).toString());
            hits = hits + 1;
          }
        }),
      ]);
      if (hits == parallalApiCount) {
        isImageGenerating = false;
        addToImageURLList('END');
        isLoading = false;
        return;
      } else {
        return;
      }
    } else {
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
      ]);
      if (hits == parallalApiCount) {
        isImageGenerating = false;
        addToImageURLList('END');
        isLoading = false;
        return;
      } else {
        return;
      }
    }
  }
}
