import '/flutter_flow/flutter_flow_util.dart';
import 'diagnoses_list_widget.dart' show DiagnosesListWidget;
import 'package:flutter/material.dart';

class DiagnosesListModel extends FlutterFlowModel<DiagnosesListWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
