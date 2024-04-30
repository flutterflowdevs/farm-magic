import '/flutter_flow/flutter_flow_util.dart';
import 'fogot_password_widget.dart' show FogotPasswordWidget;
import 'package:flutter/material.dart';

class FogotPasswordModel extends FlutterFlowModel<FogotPasswordWidget> {
  ///  Local state fields for this page.

  String email = 'abc';

  bool isMailValid = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for EmailId widget.
  FocusNode? emailIdFocusNode;
  TextEditingController? emailIdTextController;
  String? Function(BuildContext, String?)? emailIdTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    emailIdFocusNode?.dispose();
    emailIdTextController?.dispose();
  }
}
