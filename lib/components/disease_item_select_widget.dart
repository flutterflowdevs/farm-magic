import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'disease_item_select_model.dart';
export 'disease_item_select_model.dart';

class DiseaseItemSelectWidget extends StatefulWidget {
  const DiseaseItemSelectWidget({
    super.key,
    required this.index,
    required this.selectedIndex,
    required this.image,
    required this.title,
  });

  final int? index;
  final int? selectedIndex;
  final String? image;
  final String? title;

  @override
  State<DiseaseItemSelectWidget> createState() =>
      _DiseaseItemSelectWidgetState();
}

class _DiseaseItemSelectWidgetState extends State<DiseaseItemSelectWidget> {
  late DiseaseItemSelectModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DiseaseItemSelectModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          width: 90.0,
          height: 90.0,
          child: Stack(
            children: [
              Material(
                color: Colors.transparent,
                elevation: 2.0,
                shape: const CircleBorder(),
                child: Container(
                  width: 90.0,
                  height: 90.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: widget.index == widget.selectedIndex
                          ? FlutterFlowTheme.of(context).setpColor
                          : const Color(0x00000000),
                      width: 2.0,
                    ),
                  ),
                  child: Container(
                    width: 120.0,
                    height: 120.0,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      widget.image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              if (widget.index == widget.selectedIndex)
                Align(
                  alignment: const AlignmentDirectional(1.0, -1.0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                    child: Container(
                      width: 24.0,
                      height: 24.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        shape: BoxShape.circle,
                      ),
                      child: Align(
                        alignment: const AlignmentDirectional(1.0, -1.0),
                        child: Icon(
                          Icons.check_circle,
                          color: FlutterFlowTheme.of(context).setpColor,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
          child: Text(
            widget.title!,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  color: FlutterFlowTheme.of(context).secondaryText,
                  letterSpacing: 0.0,
                ),
          ),
        ),
      ],
    );
  }
}
