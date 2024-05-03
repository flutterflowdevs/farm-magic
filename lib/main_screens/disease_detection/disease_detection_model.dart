import '/backend/schema/enums/enums.dart';
import '/components/disease_item_select_widget.dart';
import '/delete/setp/setp_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'disease_detection_widget.dart' show DiseaseDetectionWidget;
import 'package:flutter/material.dart';

class DiseaseDetectionModel extends FlutterFlowModel<DiseaseDetectionWidget> {
  ///  Local state fields for this page.

  UserDiseaseChoice? selectedCategory;

  int selectedCrop = 100;

  List<dynamic> categoryItemList = [];
  void addToCategoryItemList(dynamic item) => categoryItemList.add(item);
  void removeFromCategoryItemList(dynamic item) =>
      categoryItemList.remove(item);
  void removeAtIndexFromCategoryItemList(int index) =>
      categoryItemList.removeAt(index);
  void insertAtIndexInCategoryItemList(int index, dynamic item) =>
      categoryItemList.insert(index, item);
  void updateCategoryItemListAtIndex(int index, Function(dynamic) updateFn) =>
      categoryItemList[index] = updateFn(categoryItemList[index]);

  FFUploadedFile? uploadedImageByUser;

  bool showLastStepAnimation = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for setp component.
  late SetpModel setpModel1;
  // Model for setp component.
  late SetpModel setpModel2;
  // Model for setp component.
  late SetpModel setpModel3;
  // Model for setp component.
  late SetpModel setpModel4;
  // Model for setp component.
  late SetpModel setpModel5;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Stores action output result for [Custom Action - searchAnimalAndCropsFromJson] action in TextField widget.
  List<dynamic>? searchResult;
  // Model for DiseaseItemSelect component.
  late DiseaseItemSelectModel diseaseItemSelectModel2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Gemini - Text From Image] action in Button widget.
  String? genAIOutput;
  // Stores action output result for [Gemini - Generate Text] action in Button widget.
  String? aiTitleOutput;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  @override
  void initState(BuildContext context) {
    setpModel1 = createModel(context, () => SetpModel());
    setpModel2 = createModel(context, () => SetpModel());
    setpModel3 = createModel(context, () => SetpModel());
    setpModel4 = createModel(context, () => SetpModel());
    setpModel5 = createModel(context, () => SetpModel());
    diseaseItemSelectModel2 =
        createModel(context, () => DiseaseItemSelectModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    setpModel1.dispose();
    setpModel2.dispose();
    setpModel3.dispose();
    setpModel4.dispose();
    setpModel5.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    diseaseItemSelectModel2.dispose();
    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
