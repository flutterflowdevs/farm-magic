import '/flutter_flow/flutter_flow_util.dart';
import 'tutorial_detail_page_widget.dart' show TutorialDetailPageWidget;
import 'package:flutter/material.dart';

class TutorialDetailPageModel
    extends FlutterFlowModel<TutorialDetailPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
