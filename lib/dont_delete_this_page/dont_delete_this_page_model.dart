import '/flutter_flow/flutter_flow_util.dart';
import 'dont_delete_this_page_widget.dart' show DontDeleteThisPageWidget;
import 'package:flutter/material.dart';

class DontDeleteThisPageModel
    extends FlutterFlowModel<DontDeleteThisPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
