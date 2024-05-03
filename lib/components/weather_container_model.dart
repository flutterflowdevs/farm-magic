import '/delete/heading_container/heading_container_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'weather_container_widget.dart' show WeatherContainerWidget;
import 'package:flutter/material.dart';

class WeatherContainerModel extends FlutterFlowModel<WeatherContainerWidget> {
  ///  Local state fields for this component.

  int selectedDay = 0;

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
