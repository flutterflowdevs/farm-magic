import '/flutter_flow/flutter_flow_util.dart';
import 'demo_widget.dart' show DemoWidget;
import 'package:flutter/material.dart';

class DemoModel extends FlutterFlowModel<DemoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
