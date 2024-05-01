import '/flutter_flow/flutter_flow_util.dart';
import 'farm_tutorial_history_list_widget.dart'
    show FarmTutorialHistoryListWidget;
import 'package:flutter/material.dart';

class FarmTutorialHistoryListModel
    extends FlutterFlowModel<FarmTutorialHistoryListWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
