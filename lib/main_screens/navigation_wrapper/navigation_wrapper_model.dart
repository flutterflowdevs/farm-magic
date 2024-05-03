import '/flutter_flow/flutter_flow_util.dart';
import 'navigation_wrapper_widget.dart' show NavigationWrapperWidget;
import 'package:flutter/material.dart';

class NavigationWrapperModel extends FlutterFlowModel<NavigationWrapperWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
