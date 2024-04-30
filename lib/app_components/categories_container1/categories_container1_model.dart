import '/components/heading_container_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'categories_container1_widget.dart' show CategoriesContainer1Widget;
import 'package:flutter/material.dart';

class CategoriesContainer1Model
    extends FlutterFlowModel<CategoriesContainer1Widget> {
  ///  Local state fields for this component.

  int selectedCat = 0;

  ///  State fields for stateful widgets in this component.

  // Model for Heading_Container component.
  late HeadingContainerModel headingContainerModel;

  @override
  void initState(BuildContext context) {
    headingContainerModel = createModel(context, () => HeadingContainerModel());
  }

  @override
  void dispose() {
    headingContainerModel.dispose();
  }
}
