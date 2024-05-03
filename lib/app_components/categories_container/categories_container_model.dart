import '/delete/heading_container/heading_container_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'categories_container_widget.dart' show CategoriesContainerWidget;
import 'package:flutter/material.dart';

class CategoriesContainerModel
    extends FlutterFlowModel<CategoriesContainerWidget> {
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
