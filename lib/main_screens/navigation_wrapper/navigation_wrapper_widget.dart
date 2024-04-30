import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'navigation_wrapper_model.dart';
export 'navigation_wrapper_model.dart';

class NavigationWrapperWidget extends StatefulWidget {
  const NavigationWrapperWidget({super.key});

  @override
  State<NavigationWrapperWidget> createState() =>
      _NavigationWrapperWidgetState();
}

class _NavigationWrapperWidgetState extends State<NavigationWrapperWidget> {
  late NavigationWrapperModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavigationWrapperModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await requestPermission(locationPermission);
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: const custom_widgets.NavigationPage(
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}
