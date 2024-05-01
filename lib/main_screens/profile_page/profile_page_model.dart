import '/app_components/profile_options/profile_options_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_page_widget.dart' show ProfilePageWidget;
import 'package:flutter/material.dart';

class ProfilePageModel extends FlutterFlowModel<ProfilePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for profile_options component.
  late ProfileOptionsModel profileOptionsModel1;
  // Model for profile_options component.
  late ProfileOptionsModel profileOptionsModel2;
  // Model for profile_options component.
  late ProfileOptionsModel profileOptionsModel3;
  // Model for profile_options component.
  late ProfileOptionsModel profileOptionsModel4;
  // Model for profile_options component.
  late ProfileOptionsModel profileOptionsModel5;
  // Model for profile_options component.
  late ProfileOptionsModel profileOptionsModel6;

  @override
  void initState(BuildContext context) {
    profileOptionsModel1 = createModel(context, () => ProfileOptionsModel());
    profileOptionsModel2 = createModel(context, () => ProfileOptionsModel());
    profileOptionsModel3 = createModel(context, () => ProfileOptionsModel());
    profileOptionsModel4 = createModel(context, () => ProfileOptionsModel());
    profileOptionsModel5 = createModel(context, () => ProfileOptionsModel());
    profileOptionsModel6 = createModel(context, () => ProfileOptionsModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    profileOptionsModel1.dispose();
    profileOptionsModel2.dispose();
    profileOptionsModel3.dispose();
    profileOptionsModel4.dispose();
    profileOptionsModel5.dispose();
    profileOptionsModel6.dispose();
  }
}
