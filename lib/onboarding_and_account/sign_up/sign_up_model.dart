import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'sign_up_widget.dart' show SignUpWidget;
import 'package:flutter/material.dart';

class SignUpModel extends FlutterFlowModel<SignUpWidget> {
  ///  Local state fields for this page.

  String name = 'abc';

  String email = 'abc';

  bool isMailValid = true;

  String password = 'abc';

  String confPass = 'abc';

  String city = 'abc';

  String state = 'abc';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for UserName widget.
  FocusNode? userNameFocusNode;
  TextEditingController? userNameTextController;
  String? Function(BuildContext, String?)? userNameTextControllerValidator;
  // State field(s) for EmailId widget.
  FocusNode? emailIdFocusNode;
  TextEditingController? emailIdTextController;
  String? Function(BuildContext, String?)? emailIdTextControllerValidator;
  // State field(s) for Password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // State field(s) for ConfirmPassword widget.
  FocusNode? confirmPasswordFocusNode;
  TextEditingController? confirmPasswordTextController;
  late bool confirmPasswordVisibility;
  String? Function(BuildContext, String?)?
      confirmPasswordTextControllerValidator;
  // State field(s) for StateDropDown widget.
  String? stateDropDownValue;
  FormFieldController<String>? stateDropDownValueController;
  // State field(s) for City widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityTextController;
  String? Function(BuildContext, String?)? cityTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    confirmPasswordVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    userNameFocusNode?.dispose();
    userNameTextController?.dispose();

    emailIdFocusNode?.dispose();
    emailIdTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    confirmPasswordFocusNode?.dispose();
    confirmPasswordTextController?.dispose();

    cityFocusNode?.dispose();
    cityTextController?.dispose();
  }
}
