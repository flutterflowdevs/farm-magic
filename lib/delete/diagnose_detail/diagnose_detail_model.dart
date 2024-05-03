import '/flutter_flow/flutter_flow_util.dart';
import 'diagnose_detail_widget.dart' show DiagnoseDetailWidget;
import 'package:flutter/material.dart';

class DiagnoseDetailModel extends FlutterFlowModel<DiagnoseDetailWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
