import '/delete/onboarding_flow/onboarding_flow_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'onboarding_widget.dart' show OnboardingWidget;
import 'package:flutter/material.dart';

class OnboardingModel extends FlutterFlowModel<OnboardingWidget> {
  ///  Local state fields for this page.

  int pageIndex = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for onboarding_flow component.
  late OnboardingFlowModel onboardingFlowModel1;
  // Model for onboarding_flow component.
  late OnboardingFlowModel onboardingFlowModel2;
  // Model for onboarding_flow component.
  late OnboardingFlowModel onboardingFlowModel3;
  // Model for onboarding_flow component.
  late OnboardingFlowModel onboardingFlowModel4;

  @override
  void initState(BuildContext context) {
    onboardingFlowModel1 = createModel(context, () => OnboardingFlowModel());
    onboardingFlowModel2 = createModel(context, () => OnboardingFlowModel());
    onboardingFlowModel3 = createModel(context, () => OnboardingFlowModel());
    onboardingFlowModel4 = createModel(context, () => OnboardingFlowModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    onboardingFlowModel1.dispose();
    onboardingFlowModel2.dispose();
    onboardingFlowModel3.dispose();
    onboardingFlowModel4.dispose();
  }
}
