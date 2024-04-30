import '/app_components/categories_container/categories_container_widget.dart';
import '/app_components/categories_container1/categories_container1_widget.dart';
import '/components/search_text_field_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_copy_widget.dart' show HomePageCopyWidget;
import 'package:flutter/material.dart';

class HomePageCopyModel extends FlutterFlowModel<HomePageCopyWidget> {
  ///  Local state fields for this page.

  bool isAnimationOn = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Search_TextField component.
  late SearchTextFieldModel searchTextFieldModel;
  // Model for Categories_Container component.
  late CategoriesContainerModel categoriesContainerModel;
  // Model for Categories_Container1 component.
  late CategoriesContainer1Model categoriesContainer1Model;

  @override
  void initState(BuildContext context) {
    searchTextFieldModel = createModel(context, () => SearchTextFieldModel());
    categoriesContainerModel =
        createModel(context, () => CategoriesContainerModel());
    categoriesContainer1Model =
        createModel(context, () => CategoriesContainer1Model());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    searchTextFieldModel.dispose();
    categoriesContainerModel.dispose();
    categoriesContainer1Model.dispose();
  }
}
