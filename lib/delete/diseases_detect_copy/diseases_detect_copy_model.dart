import '/flutter_flow/flutter_flow_util.dart';
import 'diseases_detect_copy_widget.dart' show DiseasesDetectCopyWidget;
import 'package:flutter/material.dart';

class DiseasesDetectCopyModel
    extends FlutterFlowModel<DiseasesDetectCopyWidget> {
  ///  Local state fields for this page.

  FFUploadedFile? localUploadImage;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
