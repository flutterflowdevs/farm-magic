import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_page_widget.dart' show ChatPageWidget;
import 'package:flutter/material.dart';

class ChatPageModel extends FlutterFlowModel<ChatPageWidget> {
  ///  Local state fields for this page.

  bool isTextFieldEmpty = true;

  bool sendingMessage = false;

  bool voiceToTextLoader = false;

  bool awaitingResponse = false;

  String? userQuery;

  String? responseAudio;

  String? geminiResponse;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for chatInput widget.
  FocusNode? chatInputFocusNode;
  TextEditingController? chatInputTextController;
  String? Function(BuildContext, String?)? chatInputTextControllerValidator;
  // Stores action output result for [Custom Action - getTextFromSpeech] action in Container widget.
  String? sttOutput;
  // Stores action output result for [Gemini - Generate Text] action in Container widget.
  String? geminiTranslatedResponse;
  // Stores action output result for [Backend Call - API (Text to Audio)] action in Container widget.
  ApiCallResponse? audioOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    chatInputFocusNode?.dispose();
    chatInputTextController?.dispose();
  }
}
